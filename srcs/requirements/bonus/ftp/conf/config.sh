#!/bin/sh

useradd -d /home/$FTP_USER -s /bin/bash $FTP_USER && echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

mkdir /home/$FTP_USER/ftp

chown nobody:nogroup /home/$FTP_USER/ftp

chmod a-w /home/$FTP_USER/ftp

mkdir /home/$FTP_USER/ftp/files

chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files

mkdir -p /var/run/vsftpd/empty 

sed -i -r "s/#write_enable=YES/write_enable=YES/1" /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1" /etc/vsftpd.conf

echo "local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/home/$FTP_USER/ftp
pasv_min_port=40000
pasv_max_port=40100
userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

echo $FTP_USER | tee -a /etc/vsftpd.userlist

/usr/sbin/vsftpd
