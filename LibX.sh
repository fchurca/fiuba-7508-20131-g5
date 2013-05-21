function getIntAnswer {
local ans=
while [ -z "${ans##*[!0-9]*}" ]; do
	read ans
	if [ -z "${ans##*[!0-9]*}" ]; then
		echo "Por favor ingrese un número entero"
	fi
done
return $ans
}

#Obtener respuesta Sí o No
function getYesOrNoAnswer {
answer=
while [ \( "$answer" != "si" \) -a \( "$answer" != "no" \) ]; do
	read answer
	# tr trabaja de a bytes, y, aunque funciona así, posiblemente sea mejor cambiar eso con un sed: sed 's/[[:upper:]]*/\L&/;s/í/i/g'
	answer=$(tr [:upper:]Íí [:lower:]ii <<< $answer)
	if [ \( "$answer" != "si" \) -a \( "$answer" != "no" \) ]; then
		echo "Por favor responda sí o no"
	fi
done
}

# Exportamos las funciones
funs=(getIntAnswer getYesOrNoAnswer)
for f in ${funs[@]}; do
	export -f $f
done

