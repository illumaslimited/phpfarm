#!/bin/bash
# You can override config options very easily.
# Just create a custom options file; it may be version specific:
# - custom-options.sh
# - custom-options-5.sh
# - custom-options-5.3.sh
# - custom-options-5.3.1.sh
#
# Don't touch this file here - it would prevent you to just "svn up"
# your phpfarm source code.

version=$1
vmajor=$2
vminor=$3
vpatch=$4

#gcov='--enable-gcov'
configoptions="\
--disable-debug \
--disable-rpath \
--enable-fpm \
--enable-bcmath \
--enable-calendar \
--enable-exif \
--enable-ftp \
--enable-mbstring \
--enable-pcntl \
--enable-soap \
--enable-sockets \
--enable-wddx \
--enable-zip \
--enable-shmop \
--enable-sysvmsg \
--enable-sysvsem \
--enable-sysvshm \
--enable-intl \
--with-fpm-user=nobody \
--with-fpm-group=nobody \
--with-libdir=lib64 \
--with-curl=shared \
--with-curlwrappers=shared \
--with-bz2=shared \
--with-mcrypt=shared \
--with-mhash=shared \
--with-mm=shared \
--with-gd=shared \
--with-jpeg-dir=/usr \
--with-png-dir=/usr \
--with-freetype-dir=shared,/usr \
--with-libxml-dir=shared,/usr \
--with-xsl=shared \
--with-xmlrpc=shared \
--with-zlib=shared \
--with-gettext=shared \
--with-pdo-mysql=shared \
--with-openssl=shared \
--with-readline=shared \
--with-mysql=shared \
--with-mysqli=shared \
--with-pear \
$gcov"

echo $version $vmajor $vminor $vpatch

custom="custom-options.sh"
[ -f $custom ] && source "$custom" $version $vmajor $vminor $vpatch
custom="custom-options-$vmajor.sh"
[ -f $custom ] && source "$custom" $version $vmajor $vminor $vpatch
custom="custom-options-$vmajor.$vminor.sh"
[ -f $custom ] && source "$custom" $version $vmajor $vminor $vpatch
custom="custom-options-$vmajor.$vminor.$vpatch.sh"
[ -f $custom ] && source "$custom" $version $vmajor $vminor $vpatch
