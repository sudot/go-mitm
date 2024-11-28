@echo off
call npm run --prefix ./web/ui build
go build ./cmd/mitm-web
