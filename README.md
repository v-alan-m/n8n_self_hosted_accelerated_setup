# Start:
docker compose up -d

# Run:
docker compose up -d

# n8n
http://localhost:5678

# Check for running containers
docker ps -a

# Stop:
docker compose down

# Update:
docker compose pull
docker compose up -d

# Change password
- The password will be stored in the database.sqlite file as well as the config file

- Step 1 - Stop n8n: `docker compose down`
- Step 2 - Delete the instance owner flag in the database
	- Windows: `docker run --rm -v "%cd%":/data alpine sh -c "apk add --no-cache sqlite && sqlite3 /data/database.sqlite \"DELETE FROM settings WHERE key='userManagement.isInstanceOwnerSetUp';\" && echo done"`
	- macOS / Linux: `docker run --rm -v "$PWD":/data alpine sh -c "apk add --no-cache sqlite && sqlite3 /data/database.sqlite \"DELETE FROM settings WHERE key='userManagement.isInstanceOwnerSetUp';\" && echo done"`
- Step 3 - Start n8n: `docker compose up -d`
