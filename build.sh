#!/usr/bin/env bash
npm run --prefix ./web/ui build
go build ./cmd/mitm-web
chmod +x mitm-web
