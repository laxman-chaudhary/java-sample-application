#!/bin/bash

# Find and kill all Java processes running Spring Boot applications
echo "Killing all Spring Boot services..."

# Get the process IDs (PIDs) of all Java processes running Spring Boot
PIDS=$(ps aux | grep 'spring-boot' | grep 'java' | awk '{print $2}')

# Check if any PIDs are found
if [ -z "$PIDS" ]; then
  echo "No Spring Boot services are currently running."
else
  # Kill all the processes
  echo "Killing the following PIDs: $PIDS"
  kill -9 $PIDS
  echo "All services have been killed."
fi

