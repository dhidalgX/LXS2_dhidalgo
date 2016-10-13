#!/bin/bash

DATA=/home/dhidalgo/GIT_REP/LXS2_dhidalgo/proyecto_programado/Proyecto-de-Programacion/problema1/hojasDatos
mkdir $DATA/datos_csv
OUT_DATA=$DATA/datos_csv

m=0

for i in `find $DATA -name '*.xls'`
do
	echo "Procesando archivo $i"

	xls2csv $i > $OUT_DATA/data-$m.csv
	let m=m+1
done 2> error1.log
