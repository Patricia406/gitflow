#!/bin/bash



BASE_DIR="/var/www/apps"
REPORTE="/var/log/apps_reporte.txt"

# Vaciar reporte
echo "===== REPORTE DE APLICACIONES =====" > "$REPORTE"
echo "Fecha: $(date)" >> "$REPORTE"

for APP_DIR in "$BASE_DIR"/app*
do
    APP_NAME=$(basename "$APP_DIR")

    APP_NUM=$(echo "$APP_NAME" | sed 's/app//')

    # Crear archivos segun el numero de app
    for i in $(seq 1 "$APP_NUM")
    do
        touch "$APP_DIR/archivo_${i}.txt"
    done

    CANTIDAD=$(find "$APP_DIR" -type f | wc -l)

    echo "$APP_NAME - $CANTIDAD archivos" >> "$REPORTE"
done
