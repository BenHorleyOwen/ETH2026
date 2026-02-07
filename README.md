**Turn on database host**
./init.sh to create the template .env, nothing should need to be changed there, only if ports need changing
./start.sh and go to localhost:3000 to see the local deployment.

**Ingest data**
cp ./businessCrawler/env.template ./businessCrawler/env
fill the .env with api keys
./refresh-data.sh # Runs the crawler (if .env created, this is for database updating)


ETH2026/
├── Database-Node/              # Submodule (generic, shared)
│   └── compose.yml             # Base services (MySQL + Node)
├── docker-compose.yml          # Symlink to Database-Node/compose.yml
├── docker-compose.override.yml # Project-specific (data-ingest) - NOT committed
├── Dockerfile.ingest           # Your custom Dockerfile
├── businessCrawler/            # Your crawler code
├── db/                         # Generated data
└── .env                        # Project config
