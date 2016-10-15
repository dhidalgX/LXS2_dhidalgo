#!/bin/bash

# Ejemplo de case, determina si la distro está soportada

shopt -s nocasematch

DISTRO=$1

# Las funciones se deben definir antes de ser llamadas
mensaje ()
{
echo "Distribución $1 soportada"
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
		echo "Distro no soportada"
esac



