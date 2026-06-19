#!/bin/bash

LOG_DIR="/var/www/log"

mkdir -p "$LOG_DIR"

ARCHIVO="archivo_$(date +%H%M%S).log"

cat << EOF > "$LOG_DIR/$ARCHIVO"
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.
Fecha de generación: $(date)
EOF
