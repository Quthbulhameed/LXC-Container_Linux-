#!/bin/bash

# Create 2 LXC containers
for i in {1..2}; do
  lxc-create -n container"$i" -t download -- --dist ubuntu --release bionic --arch amd64
done

# Start all the containers
for i in {1..2}; do
  lxc-start -n container"$i"
done

# Wait for all the containers to start
for i in {1..2}; do
  while ! lxc-info -n container"$i" | grep -q RUNNING; do
    sleep 1
  done
done

# Print the IP addresses of all the containers
for i in {1..2}; do
  echo "container-$i IP: $(lxc-info -n container"$i" | grep -Eo 'IP\s+:\s(.*)' | awk '{print $2}')"
done
