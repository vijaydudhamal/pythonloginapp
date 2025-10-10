#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e
sudo apt update -y
echo "✅ Removing older versions of Docker (if any)..."
sudo apt remove docker docker-engine docker.io containerd runc -y || true

echo "🔄 Updating apt..."
sudo apt update
sudo apt install ca-certificates curl gnupg -y

echo "🔐 Adding Docker’s official GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "📦 Setting up the Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 Updating apt package index again..."
sudo apt update

echo "🚀 Installing Docker Engine, CLI, containerd, Buildx, and Compose plugin..."
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

echo "✅ Docker and Docker Compose installed successfully."

echo "👤 Adding current user to 'docker' group..."
sudo usermod -aG docker $USER

echo "🔄 Apply new group (you may need to restart your session)..."
newgrp docker

echo "🧪 Testing Docker..."
docker run hello-world || echo "⚠️ Docker requires a relogin or reboot to use without sudo."

echo "📦 Docker Version:"
docker --version

echo "📦 Docker Compose Version:"
docker compose version

echo "✅ Done."
