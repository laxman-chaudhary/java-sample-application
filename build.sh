#!/bin/bash

# Define the root directory where the project is located
ROOT_DIR=$(pwd)

# Define the list of directories to build
DIRECTORIES=("api-gateway" "discovery-server" "inventory-service" "notification-service" "order-service" "product-service")

# Loop through each directory and execute the Maven build command
for DIR in "${DIRECTORIES[@]}"; do
  # Check if the directory exists
  if [ -d "$ROOT_DIR/$DIR" ]; then
    echo "Entering $DIR directory..."
    cd "$ROOT_DIR/$DIR" || exit
    
    echo "Running 'mvn clean verify -DskipTests' in $DIR..."
    mvn clean verify -DskipTests

    # Check if the build was successful
    if [ $? -eq 0 ]; then
      echo "$DIR built successfully."
    else
      echo "Build failed in $DIR."
      exit 1
    fi

    # Go back to the root directory
    cd "$ROOT_DIR" || exit
  else
    echo "Directory $DIR not found, skipping..."
  fi
done

echo "All services have been built successfully."

