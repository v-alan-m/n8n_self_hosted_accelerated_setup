# Start:
`docker compose up -d`

# View n8n
http://localhost:5678

# Check for running containers
`docker ps -a`

# Stop:
`docker compose down`

# Update:
`docker compose pull`
`docker compose up -d`

# Change password
- Run the n8n Docker container instance: `docker compose up -d`
- Run the reset command inside the running container: `docker exec -u node -it n8n n8n user-management:reset`
- Spin the docker container down: `docker compose down`
- The next time you spin the container up, you will be prompted for the new set of login credentials 👍