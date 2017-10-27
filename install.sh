#!/bin/bash

yum -y install glibc.i686 tomcat-native openssl-devel > /dev/null 2>&1
chattr -i /etc/sysconfig/iptables

exit 0
