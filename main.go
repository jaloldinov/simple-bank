package main

import (
	"database/sql"
	"log"

	"github.com/jaloldinov/simple-bank/api"
	db "github.com/jaloldinov/simple-bank/db/sqlc"
	_ "github.com/lib/pq"
)

const (
	dbDriver     = "postgres"
	dbSource     = "postgres://postgres:Muhammad@localhost:5432/bank?sslmode=disable"
	serverAdress = "0.0.0.0:8080"
)

func main() {
	conn, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}

	store := db.NewStore(conn)
	server := api.NewServer(store)

	err = server.Start(serverAdress)

	if err != nil {
		log.Fatal("cannot start server:", err)
	}
}
