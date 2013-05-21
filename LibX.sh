#TODO: VER CÓMO SE PUEDE HACER CON FIFOs
function == {
if [ ${CONTROLX_TMPFILE}x == x ]; then
	CONTROLX_TMPFILE=`mktemp`
fi
echo $1 >> ${CONTROLX_TMPFILE}
}
function =! {
if [ ${CONTROLX_TMPFILE}x != x ]; then
	source ${CONTROLX_TMPFILE}
	rm ${CONTROLX_TMPFILE}
	CONTROLX_TMPFILE=
fi
}

function getIntAnswer {
ans=
while [ -z "${ans##*[!0-9]*}" ]; do
	read ans
	if [ ! -z "${ans##*[!0-9]*}" ]; then
		return $ans
	else
		echo "Por favor, ingrese un número entero"
	fi
done
}

#Obtener respuesta Sí o No
function getYesOrNoAnswer {
# Reemplazar por return cuando podamos refactorear
answer=
while [ \( "$answer" != "si" \) -a \( "$answer" != "no" \) ]; do
	read answer
	# tr trabaja de a bytes, y, aunque funciona así, posiblemente sea mejor cambiar eso con un sed: sed 's/[[:upper:]]*/\L&/;s/í/i/g'
	answer=$(echo $answer | tr [:upper:]Íí [:lower:]ii)
	if [ \( "$answer" != "si" \) -a \( "$answer" != "no" \) ]; then
		echo "Por favor responda sí o no"
	fi
done
}

# Exportamos las funciones
funs=(== =! getYesOrNoAnswer)
for f in ${funs[@]}; do
	export -f $f
done

