#!/bin/bash

DATA=/home/dhidalgo/GIT_REP/LXS2_dhidalgo/proyecto_programado/Proyecto-de-Programacion/problema2/
GRAF_DATA=$DATA/datos_graf
mkdir $DATA/datos_csv
mkdir $GRAF_DATA
mkdir $FULL_DATA
OUT_DATA=$DATA/datos_csv
FULL_DATA=$DATA/full_datos


m=0

for i in `find $DATA -name '*.xls'`
do
	echo "Procesando archivo $i"

	xls2csv $i > $OUT_DATA/data-$m.csv
	let m=m+1
done 2> error1.log

m=0

for e in `find $OUT_DATA -name "*.csv"`
do
	echo "Dando formato de datos para graficar el archivo $e"
	cat $e | awk -F "\",\"" '{print $1 " " $2 " " $3 " " $4 " " $5 " " }' | sed '1,$ s/"//g' | sed '1 s/date/#date/g' > $GRAF_DATA/graf-$m.dat
	let m=m+1
done 2> error2.log	
    
if [ -a $FULL_DATA/full.dat]
then 
	rm $FULL_DATA/full.dat
	echo "Archivo full.dat borrado"
fi 2 > errorIF.log

for k in `find $GRAF_DATA -name "*.dat"`
do 
	sed '1d' $k >> $FULL_DATA/full.dat
	let m=m+1
	echo "Procesando archivo $k"

done 2> error.log


FMT_BEGIN=20110206 0000
FMT_END=20110206 0200
FMT_X_SHOW=%M%H
DATA_DONE=$FULL_DATA/full.dat

graficar ()
{	
	gnuplot <<EOF 2> error.log
	set xdata time
	set timefmt "%Y%m%d %H%M"
	set xrange ["$FMT_BEGIN":"$FMT_END"]
	set format x "$FMT_X_SHOW"
	set terminal png
	set output 'fig1.png'
	plot "$DATA_DONE" using 1:3 with lines title "sensor 1","$DATA_DONE" using 1:4 with linespoints title "sensor 2"
EOF
}

graficar
