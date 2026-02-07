#!/bin/bash
docker compose -f ./Database-Node/compose.yml up -d
docker compose -f ./Database-Node/compose.yml logs -f
