#manager
docker swarm init --advertise-addr <ip>

#worker
docker swarm join --token <...> <ip>:2377

#leave swarm
docker swarm leave --force