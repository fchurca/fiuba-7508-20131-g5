#TODO: VER CÓMO SE PUEDE HACER CON FIFOs
function == {
if [ ${CONTROLX_TMPFILE}x == x ]; then
	CONTROLX_TMPFILE=`mktemp`
fi
echo $1 >> ${CONTROLX_TMPFILE}
}
function =! {
source ${CONTROLX_TMPFILE}
rm ${CONTROLX_TMPFILE}
CONTROLX_TMPFILE=
}

#Obtener respuesta Sí o No
getYesOrNoAnswer() {
	answer=
	while [ \( "$answer" != "si" \) -a \( "$answer" != "no" \) ]
	do
		read answer
		answer=$(echo $answer | tr [:upper:] [:lower:])
	done
}

# Exportamos las funciones
funs=(== =! getYesOrNoAnswer)
for f in ${funs[@]}; do
	export -f $f
done

