#!/bin/bash
# Desactivar cámara en Ubuntu (blacklist del módulo uvcvideo)

echo "Desactivando cámara..."

# Verificar si ya está desactivada
if lsmod | grep -q "^uvcvideo "; then
    sudo modprobe -r uvcvideo
    echo "Cámara desactivada temporalmente."
else
    echo "La cámara ya no está activa."
fi

# Hacer permanente (opcional)
read -p "¿Quieres hacerlo permanente (se reactiva tras reinicio)? (s/n): " perm
if [[ $perm == "s" ]]; then
    echo "blacklist uvcvideo" | sudo tee -a /etc/modprobe.d/blacklist-camera.conf
    echo "Agregado a blacklist. Necesitarás reiniciar para que sea efectivo permanentemente."
fi
