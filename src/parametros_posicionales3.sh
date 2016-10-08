#!/bin/sh
ERRORLOG="$0.err"
#la salida estandar de error estara redireccionada al archivo if-then.sh.err
 if cp archivo1.txt archivo1.txt.bck 2> $ERRORLOG
then
      	echo "El archivo1.txt fue correctamente respaldo..."
	echo "Eliminar archivo original"
	if rm archivo1.txt
	then
		echo "El archivo original fue elimindado correctamente.."
	else

		echo "El archivo1.txt no pudo ser respaldado, verifique el log:$ERRORLOG"
	fi
else
	echo "El archivo.txt no pudo ser respaldado, verifique el log :$ERRORLOG"
fi
