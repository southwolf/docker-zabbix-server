FROM centos:centos6

MAINTAINER SouthWolf <wp.southwolf@gmail.com>

ENV REFRESHED_AT 2015-07-29

# Install EPEL to have MySQL packages.
RUN yum install -y http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install Zabbix release packages.
RUN yum install -y http://repo.zabbix.com/zabbix/2.4/rhel/6/x86_64/zabbix-release-2.4-1.el6.noarch.rpm

# Refresh
RUN yum makecache

# Installing Tools.
RUN yum -y -q install \
              monit \
              nmap  \
              traceroute \
              wget  \
              sudo

# Installing SNMP Utils
RUN yum -y -q install \
              net-snmp-devel  \
              net-snmp-libs   \
              net-snmp        \
              net-snmp-perl   \
              net-snmp-python \
              net-snmp-utils

# Install packages.
RUN yum -y -q install java-1.8.0-openjdk \
                      java-1.8.0-openjdk-devel

# YUM Cleanup
yum clean all && rm -rf /tmp/*