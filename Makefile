.PHONY: dev up down logs migrate ps

# Start full stack with hot reload (foreground).
# Mounts finapp-backend source as a volume so uvicorn --reload picks up changes.
# Includes all infrastructure: PG, Redis, RabbitMQ, Nginx.
# Add web/mobile service definitions here when those repos gain Dockerfiles (M4).
dev:
	docker compose -f docker-compose.yml -f docker-compose.override.yml up

# Start full stack detached (background).
up:
	docker compose -f docker-compose.yml up --detach

# Stop all containers. Does not remove volumes.
down:
	docker compose -f docker-compose.yml down

# Tail logs for all containers (Ctrl-C to stop).
logs:
	docker compose -f docker-compose.yml logs --follow

# Run pending Alembic migrations inside the running backend container.
# Requires `make up` to have been run first.
# Use `exec backend` to run inside the container.
migrate:
	docker compose -f docker-compose.yml exec backend alembic upgrade head

# Show container health status.
ps:
	docker compose -f docker-compose.yml ps
