#!/bin/bash

################################################################################
# Nombre del script: gravar_iso.sh
# Descripción: Script para grabar imagen ISO en una unidad
# Autor: Jorge Giovannelli
# Fecha: 4 de junio de 2023
# Versión: 1.0
# Licencia: Licencia Pública General de GNU (GNU GPL)
################################################################################


grabar_iso() {
  iso_nombre="$1"
  unidad_destino="$2"

  read -p "Se eliminará todo el contenido de la unidad \"$unidad_destino\". ¿Deseas continuar? (s/n): " confirmacion_eliminar

  if [[ $confirmacion_eliminar =~ ^[Ss]$ ]]; then
    sudo wipefs --all "$unidad_destino"
    sudo parted "$unidad_destino" mklabel gpt
    sudo parted -a opt "$unidad_destino" mkpart primary fat32 0% 100% --align optimal
    sudo mkfs.vfat -F 32 "${unidad_destino}1"
    sudo dd if="$iso_nombre" of="${unidad_destino}1" bs=4M status=progress oflag=sync
  else
    echo "La grabación ha sido cancelada"
  fi
}

if [ $# -lt 2 ]; then
  echo "Debe proporcionar el nombre de la imagen ISO y la unidad destino como parámetros"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "El archivo de la ISO \"$1\" no existe"
  exit 1
fi

grabar_iso "$1" "$2"

