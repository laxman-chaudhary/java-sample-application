#!/bin/bash

# Define the root directory where the project is located
ROOT_DIR=$(pwd)

# Define the list of directories to run
DIRECTORIES=("api-gateway" "discovery-server" "inventory-service" "notification-service" "order-service" "product-service")

# Loop through each directory to run the applications
for DIR in "${DIRECTORIES[@]}"; do
  # Check if the directory exists
  if [ -d "$ROOT_DIR/$DIR" ]; then
    echo "Entering $DIR directory..."

    # Go into the directory
    cd "$ROOT_DIR/$DIR" || exit

    # Run the application with Spring Boot
    echo "Running 'mvn spring-boot:run' in $DIR..."
    mvn spring-boot:run &
    
    # Check if the application started successfully
    if [ $? -eq 0 ]; then
      echo "$DIR is running in the background."
    else
      echo "Failed to start $DIR."
      exit 1
    fi

    # Go back to the root directory for the next iteration
    cd "$ROOT_DIR" || exit
  else
    echo "Directory $DIR not found, skipping..."
  fi
done

echo "All services have been started in the background."

