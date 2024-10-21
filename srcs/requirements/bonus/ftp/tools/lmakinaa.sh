#!/bin/sh

adduser --home /wp "$FTP_USER" --disabled-password && printf "$FTP_PASS\n$FTP_PASS" | passwd "$FTP_USER";

mkdir -p /var/run/vsftpd/empty;

chown $FTP_USER:$FTP_USER /wp;

echo "
write_enable=YES
pasv_enable=YES
chroot_local_user=YES
pasv_min_port=40000
pasv_max_port=40100
pam_service_name=ftp
allow_writeable_chroot=YES
" >> /etc/vsftpd.conf;

echo "$FTP_USER" > /etc/ftpusers;

vsftpd