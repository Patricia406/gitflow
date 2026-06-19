#!/bin/bash

ORIGEN="/var/paricia/log"
DESTINO="/var/www/backup"

if [ ! -d "$ORIGEN" ]; then
    echo "Directorio origen inexistente"
    exit 2
fi

FECHA=$(date +%Y%m%d_%H%M%S)

tar -cf "$DESTINO/backup_$FECHA.tar" "$ORIGEN"

if [ $? -ne 0 ]; then
    echo "Error creando TAR"
    exit 5
fi

zip -r "$DESTINO/backup_$FECHA.zip" "$ORIGEN" >/dev/null

if [ $? -ne 0 ]; then
    echo "Error creando ZIP"
    exit 5
fi

echo "Backup completado"
exit 0
