#!/bin/bash

# Step 1: Update your existing list of packages
sudo apt update

# Step 2: Install prerequisite packages which let apt use packages over HTTPS
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Step 3: Add the GPG key for the official Docker repository to your system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Step 4: Add the Docker repository to APT sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 5: Update your existing list of packages again for the addition to be recognized
sudo apt update

# Step 6: Make sure you are about to install from the Docker repo instead of the default Ubuntu repo
apt-cache policy docker-ce

# Step 7: Finally, install Docker
sudo apt install -y docker-ce

# Step 8: Add your username to the Docker group
sudo usermod -aG docker ${USER}

echo "Docker installation completed successfully!"
