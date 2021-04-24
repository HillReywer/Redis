FROM ubuntu:20.10

RUN apt update -y
RUN apt install redis-server -y

RUN echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf \
    echo 'sysctl -w net.core.somaxconn=65535' >> /etc/rc.local \
    echo 'bind 127.0.0.1 ::1' >> /etc/redis/redis.conf \
    echo 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' >> /etc/rc.local \
    cat /etc/redis/redis.conf | sed 's/^appendsonly*/appendsonly yes/g' > /etc/redis/redis.conf \
    cat /etc/redis/redis.conf | sed 's/^apeendfsync*/appendfsync everysec/g' > /etc/redis/redis.conf 
EXPOSE 6379
CMD [ "redis-server" ]
