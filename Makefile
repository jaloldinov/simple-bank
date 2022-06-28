swag-init:
	swag init -g api/api.go -o api/docs
run:
	go run cmd/main.go
install:
	swag init -g api/api.go -o api/docs
	go mod download
	go mod vendor
	go run cmd/main.go
migrate_down:
	migrate -path ./db/migration -database 'postgres://postgres:Muhammad@localhost:5432/bank?sslmode=disable' down
migrate_up:
	migrate -path ./db/migration -database 'postgres://postgres:Muhammad@localhost:5432/bank?sslmode=disable' up