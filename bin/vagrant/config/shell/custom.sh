#!/bin/sh
if cd "`dirname \"$0\"`"; then
    absdirpath=`pwd`
    cd "$OLDPWD" || exit 1
else
    exit 1
fi
SCRIPTDIR=$absdirpath
BASEDIR=$(dirname $SCRIPTDIR)
SCRIPTNAME=$(basename $0 .sh)

echo ""
echo "===== $SCRIPTNAME ====="
echo ""

# NOTE: this script will run as root !

echo "install misc. build dependencies.."
DEPENDENCIES_JAVA="openjdk-7-jdk"
DEPENDENCIES_MAVEN="maven"
apt-get install -y $DEPENDENCIES_JAVA $DEPENDENCIES_MAVEN

echo "add here your install commands.."
