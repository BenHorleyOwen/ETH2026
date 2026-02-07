#!/bin/bash

# ETH2026 Project Initialization Script

echo "Initializing ETH2026 project..."
echo ""

# Get the current directory
PROJECT_DIR="$(pwd)"
PROJECT_NAME=$(basename "$PROJECT_DIR")

# Check if .env already exists
if [ -f ".env" ]; then
    echo "⚠️  .env file already exists!"
    read -p "Do you want to overwrite it? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Skipping .env creation."
        exit 0
    fi
fi

# Create .env file
echo "Creating .env file..."
cat > .env << ENVFILE
PROJECT_NAME=$PROJECT_NAME
APP_PORT=3000
DB_PORT=3306
ENVFILE

echo "✅ .env file created successfully!"
echo ""
echo "Configuration:"
cat .env
echo ""
echo "Note: Database files should be in ./db/ directory"
echo ""
echo "Next steps:"
echo "  1. Edit .env if you need to change ports"
echo "  2. Ensure db/simple_db.sql exists with your database schema"
echo "  3. Run ./start.sh to start the stack"
echo ""
