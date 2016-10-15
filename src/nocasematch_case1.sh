#!/bin/bash

#Ejemplo de case, determina si la distro esta soportada.

shopt -s nocasematch

DISTRO=$1
#Las funciones se deben definir antes de ser llamadas
mensaje ()
{

		echo "Distribucion $DISTRO soportada"
}

case "$DISTRO" in 
	Ubuntu)
		mensaje
	;;
	Centos)
		
		mensaje
	;;
	Fedora)
		
		mensaje
	;;
	*)
		
		echo "Distribucion no soportada"
esac
