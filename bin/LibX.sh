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

