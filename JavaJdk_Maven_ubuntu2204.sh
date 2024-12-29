#!/bin/bash
#------- JDK & Maven Installation Script -------
# Author: Paul Valery Simo

# Update the package list
sudo apt-get update -y

# Install OpenJDK 11
sudo apt install -y openjdk-11-jdk

# Install Maven
sudo apt install -y maven

# Set JAVA_HOME environment variable
echo "Setting JAVA_HOME environment variable..."
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" | sudo tee -a /etc/profile
echo "export PATH=\$JAVA_HOME/bin:\$PATH" | sudo tee -a /etc/profile
source /etc/profile

# Verify Java installation
echo "Verifying Java installation..."
java -version

# Verify Maven installation
echo "Verifying Maven installation..."
mvn -version

echo "JDK and Maven installation completed successfully!"
