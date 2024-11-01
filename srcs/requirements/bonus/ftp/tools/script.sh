#!/bin/sh

mkdir -p /var/run/vsftpd/empty; #####

adduser --home /wp-files --quiet --disabled-password --gecos "" $FTP_USER;

echo "$FTP_USER:$FTP_PASS" | chpasswd

chown -R $FTP_USER:$FTP_USER /wp-files;

echo "
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
pasv_enable=YES
pasv_min_port=30000
pasv_max_port=30010
userlist_enable=YES
userlist_file=/etc/ftpusers
userlist_deny=YES
" >> /etc/vsftpd.conf;

vsftpd