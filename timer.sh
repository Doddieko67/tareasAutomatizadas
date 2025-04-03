#!/bin/bash
# temporizador.sh

if [ -z "$1" ]; then
  echo "Uso: temporizador.sh <segundos>"
  exit 1
fi

segundos_iniciales=$1
echo "Temporizador inicial iniciado para $segundos_iniciales segundos..."

sleep $segundos_iniciales

# Bucle para enviar notificaciones cada 10 segundos hasta que el usuario presione Enter
while true; do
  notify-send "Temporizador terminado" "Han pasado $segundos_iniciales segundos. Enviando recordatorio cada 10 segundos. Presiona Enter para salir." -i "clock"
  sleep 6  # Espera 10 segundos

  # Revisa si se presionó Enter sin bloquear la notificación
  if read -t 0.1 -n 1 -s; then  # Intenta leer una tecla sin esperar (timeout 0.1 seg)
    echo "Saliendo..."
    break  # Sale del bucle si se presionó una tecla
  fi
done

echo "Temporizador terminado."
