up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

init-db:
	./scripts/init-db.sh

ci-local:
	docker compose build
