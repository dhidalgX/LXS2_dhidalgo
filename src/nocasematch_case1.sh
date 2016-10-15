#!/bin/bash

#Ejemplo de case, determina si la distro esta soportada.

shopt -s nocasematch

DISTRO=$1
#Las funciones se deben definir antes de ser llamadas
mensaje ()
{
	echo "Distribucion $1 soportada"


	for i in "#@"
	do
	echo "Los parametros de la funcion fueron $i"
	done
}

case "$DISTRO" in 
	Ubuntu)
		mensaje $DISTRO
	;;
	Centos)
		
		mensaje $DISTRO
	;;
	Fedora)
		
		mensaje $DISTRO
	;;
	*)
		
		echo "Distribucion no soportada"
esac
