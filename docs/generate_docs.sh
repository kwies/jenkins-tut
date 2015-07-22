#!/bin/bash
if cd "`dirname \"$0\"`"; then
    absdirpath=`pwd`
    cd "$OLDPWD" || exit 1
else
    exit 1
fi
SCRIPTDIR=$absdirpath
BASEDIR=$(dirname $SCRIPTDIR)
SCRIPTNAME=$(basename $0 .sh)

# requirements: pandoc http://johnmacfarlane.net/pandoc/
# under ubuntu 14.04 run: "sudo apt-get install pandoc texlive-latex-extra texlive-fonts-recommended"

type pandoc >/dev/null 2>&1 || { echo >&2 "'pandoc' is required but it's not installed.  Aborting."; exit 1; }

cd $SCRIPTDIR
for f in *.md
do
	IN="$f"
	INWOEXT=${IN%.md}
	OUT="$INWOEXT.pdf"

	echo "convert '$IN' to '$OUT' ..."
	pandoc -s $IN -o $OUT
done

