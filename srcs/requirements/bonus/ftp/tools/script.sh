# #!/bin/bash

# useradd -m $FTP_USER

# echo "$FTP_USER:$FTP_PASS" | chpasswd

# echo $FTP_USER >> /etc/vsftp.userlist

# mkdir -p /home/$FTP_USER/ftp/somefiles

# chown "$FTP_USER:$FTP_USER" "/home/$FTP_USER/ftp/somefiles"

# vsftpd

#!/bin/sh

adduser --home /wp-files --quiet --disabled-password --gecos "" $FTP_USER;

echo "$FTP_USER:$FTP_PASS" | chpasswd

mkdir -p /var/run/vsftpd/empty;

chown $FTP_USER:$FTP_USER /wp-files;

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