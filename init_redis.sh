#!/bin/bash

# New verison (2), install from epel-repository
  
    echo Install EPEL Repository

# Install EPEL

    yum install epel-release -y
    yum update -y

# Install Redis

    yum install redis

# Enable autostart

    systemctl start redis
    systemctl enabled redis 

# Verify the Installation

    redis-cli ping

# Tunning 

    echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf
    echo 'sysctl -w net.core.somaxconn=65535' >> /etc/rc.local
    echo 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' >> /etc/rc.local
  
# Additional configuration

    cat /etc/redis.conf | sed 's/^appendsonly*/appendsonly yes/g' > /etc/redis.conf
    cat /etc/redis.conf | sed 's/^apeendfsync*/appendfsync everysec/g' > /etc/redis.conf
    systemctl restart redis

# Reboot server

    reboot

# Old version (if you want))
# Need to be download into destination folder
# tar xzf redis-3.2.5.tar.gz
# cd redis-3.2.5
# make
