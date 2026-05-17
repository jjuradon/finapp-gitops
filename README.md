# finapp-gitops

GitOps orchestrates the local stack via Docker Compose, sets up Nginx, CI pipelines, and holds the architectural decision records (ADRs).

## Running the Stack
Ensure you have Docker and Docker Compose installed.

To start the complete stack for local development (Backend, Web, PostgreSQL, RabbitMQ, Redis, Nginx):
```bash
make up
```

To stop the stack:
```bash
make down
```

To view logs:
```bash
make logs
```
