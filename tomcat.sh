#!/bin/bash

cd /opt/tomcat-native-1.2.14-src/native
./configure --with-apr=`which apr-1-config` \
--with-java-home=$JAVA_HOME \
--with-ssl=yes \
--prefix=$CATALINA_HOME > /dev/null 2>&1

make  > /dev/null 2>&1
make install > /dev/null 2>&1

chown -R tomcat.tomcat /opt/apache/tomcat/current/*
chattr +i /etc/sysconfig/iptables

chkconfig --level 2345 tomcat on && reboot

exit 0
