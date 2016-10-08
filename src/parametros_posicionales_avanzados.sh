#!/bin/bash
#Este script salva archivos en una forma gerarquica
if test -e $1 #El command "test -e" verifique que el archivo exista
then
	cp $1 $1.bck
	echo "El archivo $1 fue correctamente respaldadp.."
elif test -e $2 
then 
	cp $2 $2.bck
        echo "El archivo $2 fue correctamente respaldadp.."
elif test -e $3
then
	 cp $3 $3.bck
        echo "El archivo $3 fue correctamente respaldadp.."
else
	echo "No se pudo respaldar ninguno de los archivos $@"
fi

