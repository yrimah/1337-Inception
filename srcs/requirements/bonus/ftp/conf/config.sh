#!/bin/sh

#adduser yrimah --disabled-password

useradd -d /home/$FTP_USER -s /bin/bash $FTP_USER && echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

mkdir -p /var/run/vsftpd/empty 

echo "listen=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
xferlog_std_format=YES
chroot_local_user=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
pasv_enable=YES
pasv_min_port=40000
pasv_max_port=40100
user_sub_token=$FTP_USER
local_root=/home/$FTP_USER
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO" > /etc/vsftp.conf

echo $FTP_USER | tee -a /etc/vsftpd.userlist

/usr/sbin/vsftpd
