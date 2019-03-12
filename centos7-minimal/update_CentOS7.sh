#!/bin/bash
# Installing root permission updates to get the OS up to date

OPSUSER=ec2-operations
if [ "$USER" != "root" ]; then
    echo "You must be root to run this"
    exit 1
fi

yum -y update
yum -y group install "Development Tools"
yum -y install epel-release
yum -y install wget
yum -y install vim-enhanced
yum -y install s3cmd
yum -y install https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
yum -y install postgresql-server
wget https://www-us.apache.org/dist/ant/binaries/apache-ant-1.10.5-bin.zip -P /tmp
unzip /tmp/apache-ant-1.10.5-bin.zip -d /tmp
mv /tmp/apache-ant-1.10.5 /opt/ant
ln -s /opt/ant/bin/ant /usr/bin/ant
mkdir /mnt/backups
chown ${OPSUSER} /mnt/backups
mkdir /mnt/baselines
chown ${OPSUSER} /mnt/baselines
mkdir /mnt/data
chown ${OPSUSER} /mnt/data
mkdir /mnt/lingdb
chown ${OPSUSER} /mnt/lingdb
mkdir /mnt/logs
chown ${OPSUSER} /mnt/logs
mkdir /mnt/node-baseline
chown ${OPSUSER} /mnt/node-baseline
mkdir /mnt/repositories
chown ${OPSUSER} /mnt/repositories
mkdir /mnt/sync
chown ${OPSUSER} /mnt/sync
mkdir /mnt/temp
chown ${OPSUSER} /mnt/temp
mkdir /mnt/postgres
chown postgres /mnt/postgres
