sed -i '/docker/d' /etc/group
export DOCKER_GID=$(stat -c '%g' /var/run/docker.sock) && sudo groupadd -for -g ${DOCKER_GID} docker && sudo usermod -aG docker jenkins 

/sbin/tini -- /usr/local/bin/jenkins.sh
