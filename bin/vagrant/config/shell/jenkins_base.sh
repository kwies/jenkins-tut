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

## PACKAGES

DEPENDENCIES_BASE="curl zip bzip2 vim lynx ntp git subversion git-svn"
DEPENDENCIES_APACHE="apache2"
DEPENDENCIES_JENKINS="jenkins"

echo "add jenkins repo.."
cd /tmp
wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | apt-key add -
echo "deb http://pkg.jenkins-ci.org/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.repo.list

echo "update.."
sudo apt-get update

echo "install dependencies..."
apt-get install -y $DEPENDENCIES_BASE $DEPENDENCIES_APACHE $DEPENDENCIES_JENKINS

echo "various settings..."
usermod -a -G adm vagrant

echo "activate apache modules..."
a2enmod proxy
a2enmod proxy_http
a2enmod rewrite
a2enmod headers

echo "configure apache..."
a2dissite 000-default.conf
cp /vagrant/config/files/apache/jenkins.conf /etc/apache2/sites-available/jenkins.conf
a2ensite jenkins.conf

echo "restart apache..."
service apache2 restart

