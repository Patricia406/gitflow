#!/bin/bash

ORIGEN="/var/www/log"
DESTINO="/var/paricia/log"

if [ ! -d "$ORIGEN" ]; then
    echo "Error: directorio origen no existe"
    exit 2
fi

mkdir -p "$DESTINO"

cp "$ORIGEN"/*.log "$DESTINO"/ 2>/dev/null

if [ $? -ne 0 ]; then
    echo "Error al copiar archivos"
    exit 3
fi

rm -f "$ORIGEN"/*.log

if [ $? -ne 0 ]; then
    echo "Error al eliminar archivos"
    exit 4
fi

echo "Proceso completado"
exit 0
