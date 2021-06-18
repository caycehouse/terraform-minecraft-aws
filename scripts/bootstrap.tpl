#!/bin/bash

# Install docker
yum update -y
yum install -y docker

# Enable and start docker
systemctl --now enable docker

# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Make and mount our EBS volume
mkfs -t xfs /dev/sdb
mkdir -p /opt/minecraft
mount /dev/sdb /opt/minecraft
echo "/dev/sdb /opt/minecraft xfs defaults 0 2" >> /etc/fstab

# Run the minecraft docker instance
docker run -d \
    --name minecraft-server \
    --restart always \
    -p 25565:25565/tcp \
    -v /opt/minecraft:/data \
    -e EULA="TRUE" \
    -e MEMORY="6144M" \
    -e TYPE="SPIGOT" \
    -e USE_AIKAR_FLAGS="TRUE" \
    itzg/minecraft-server
