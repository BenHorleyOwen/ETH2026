#!/bin/bash

echo "🔄 Building data ingestion container..."
docker build -f Dockerfile.ingest -t eth2026-data-ingest .

echo "🕷️  Running business crawler..."
docker run --rm \
  -v "$(pwd)/db:/output" \
  -v "$(pwd)/.env:/app/.env:ro" \
  -e DB_HOST=mini-simple-db-${PROJECT_NAME:-ETH2026} \
  -e DB_USER=Euclid \
  -e DB_PASSWORD=star \
  -e DB_NAME=simple_db \
  -e DB_PORT=${DB_PORT:-3306} \
  eth2026-data-ingest

if [ -f "./db/simple_db.sql" ]; then
    echo "✅ SQL file generated successfully"
    
    echo "🔄 Restarting database with fresh data..."
    docker compose restart mini-simple-db-${PROJECT_NAME:-ETH2026}
    
    echo "✅ Data refresh complete! Database reloaded."
else
    echo "❌ Error: db/simple_db.sql was not created"
    exit 1
fi
