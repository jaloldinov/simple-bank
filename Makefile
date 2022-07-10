swag-init:
	swag init -g api/api.go -o api/docs
run:
	go run cmd/main.go

createdb:
	docker exec -t postgres12 dropdb --username=postgres --password=Muhammad bank

install:
	swag init -g api/api.go -o api/docs
	go mod download
	go mod vendor
	go run cmd/main.go

migrate_down:
	migrate -path ./db/migration -database 'postgres://postgres:Muhammad@localhost:5432/bank?sslmode=disable' down
migrate_up:
	migrate -path ./db/migration -database 'postgres://postgres:Muhammad@localhost:5432/bank?sslmode=disable' up

sqlc:
	sqlc generate


test: 
	go test -v -cover ./...

server: 
	go run main.go

.PHONY: postgres createdb dropdb migrate_up migrate_down sqlc server