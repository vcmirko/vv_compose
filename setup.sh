# write access will be needed on the datafolder
chmod -R 664 ./data
# the mysql init folder needs execute rights 
chmod -R +x ./data/mysql/init/

echo "{\"dns-opts\":[\"ndots:15\"]}" | sudo tee /etc/docker/daemon.json


# Bring up the Docker containers in detached mode
docker-compose up -d