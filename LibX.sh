#

# Obtener respuesta entero
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

# Obtener respuesta Sí o No
# $1 debe llevar el nombre de la variable de retorno
function getYesOrNoAnswer {
local __answer__=
while [ \( "$__answer__" != "si" \) -a \( "$__answer__" != "no" \) ]; do
	read __answer__
	# tr trabaja de a bytes, y, aunque funciona así, posiblemente sea mejor cambiar eso con un sed: sed 's/[[:upper:]]*/\L&/;s/í/i/g'
	__answer__=$(tr [:upper:]Íí [:lower:]ii <<< $__answer__)
	if [ \( "$__answer__" != "si" \) -a \( "$__answer__" != "no" \) ]; then
		echo "Por favor responda sí o no"
	fi
done
eval "$1=${__answer__}"
}

# Crear funciones de logging cortas
function curryGlogX {
eval 'function Glog'$1' { GlogX '$1' "$1" "$2"; }'
eval 'function GlogV'$1' { Glog'$1' "$1" "$2"; echo "$1" >&2; }'
}

# Exportamos las funciones
funs=(getIntAnswer getYesOrNoAnswer curryGlogX)
for f in ${funs[@]}; do
	export -f $f
done

