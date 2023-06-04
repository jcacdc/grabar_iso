# Script para grabar imagen ISO en una unidad

Este script de Bash permite grabar una imagen ISO en una unidad especificada. Asegúrate de tener privilegios de administrador para ejecutar ciertos comandos.

## Uso

1. Asegúrate de tener Bash instalado en tu sistema.

2. Descarga el archivo `grabar_iso.sh`.

3. Abre una terminal y navega hasta la ubicación donde se encuentra el archivo descargado.

4. Ejecuta el siguiente comando:

   ```bash
   bash grabar_iso.sh ruta_a_la_imagen_ISO unidad_destino

Asegúrate de reemplazar ruta_a_la_imagen_ISO con la ruta completa al archivo de imagen ISO que deseas grabar y unidad_destino con la ruta a la unidad donde deseas grabar la imagen.

    El script te pedirá confirmación antes de eliminar el contenido de la unidad destino. Responde s o n para continuar o cancelar la grabación.

Descripción del script

El script consta de las siguientes partes:

    Verifica que se proporcionen el nombre de la imagen ISO y la unidad destino como parámetros.
    Verifica si el archivo de la imagen ISO existe.
    Pide confirmación antes de eliminar todo el contenido de la unidad destino.
    Utiliza los comandos wipefs y parted para formatear la unidad destino.
    Crea una partición primaria en la unidad destino utilizando parted.
    Formatea la partición como sistema de archivos FAT32 utilizando mkfs.vfat.
    Utiliza dd para grabar la imagen ISO en la partición de la unidad destino.

Si la confirmación se realiza correctamente y la grabación se completa sin errores, la imagen ISO se habrá grabado en la unidad destino especificada. En caso de cancelar la grabación, se mostrará un mensaje indicando que se ha cancelado.

Asegúrate de tener cuidado al utilizar este script, ya que el contenido de la unidad destino se eliminará permanentemente.

¡Utilízalo con responsabilidad!
