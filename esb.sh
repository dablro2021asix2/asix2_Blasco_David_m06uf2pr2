#!/bin/bash
#
if [[ ! -d ~/Paperera ]]
then
	mkdir ~/Paperera
	clear
fi

echo "PROGRAMA DE CONFIGURACIÓ: PAPERERA DE RECICLATGE"
echo "Les opcions disponibles son:"
echo "-r) Eliminar el contingut de la carpeta 'Paperera'"
echo "-e) Afegir contingut de la carpeta 'Paperera'"
echo "Escrigui l'argument de l'opció que vol realitzar: "
echo -n "Resposta: "
read Variable1
case "$Variable1" in
	'-r')
		if [[ ! -d ~/Paperera ]]
		then
			echo "La carpeta indicada no existeix"
		else
			rm -r ~/Paperera/*
			echo "El contingut de la carpeta 'Paperera' ha siguit eliminat amb éxit"
			echo "Que tingui un bon día"
		fi
		;;
	'-e')
		echo "Escrigui el format de fitxers que voleu eliminar: "
		echo ""
		read Variable2
		echo ""
		echo "Escrigui la ruta sencera de la carpeta on es troba el fitxer (Especifique '/' al final de la ruta): "
		echo ""
		read Variable3
		echo ""
		if [[ ! -d $Variable3 ]]
		then
			echo "La carpeta indicada no existeix."
			echo "Finalitzant programa."
		else
			echo ""
			for a in "$Variable3"*."$Variable2"
			do
				mv $a ~/Paperera
				if [[ $? != 0 ]]
				then
					echo "Els fitxers amb l'extensió indicada no existeixen"
					exit 2
				fi
			done
			echo "Els Fitxers han sigut moguts amb éxit. Que tingui un bon dia."
		fi
		;;
	*)
		echo "OPERACIÓ NO ACEPTADA"
		echo "El paramtre esrit no es acceptat. Tancat programa"
		exit 3
	;;
esac
exit 0
