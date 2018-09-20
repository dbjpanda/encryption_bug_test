#!/usr/bin/env bash

echo "Creating a separate user who have deploy access on your server"
read -p 'Server Address ' SERVER
read -p 'Deploy User Name ' USER
ssh-keygen -t rsa -N "" -f ${USER}_rsa

# Encrypt with your CI tool
travis encrypt-file ${USER}_rsa --add

PUB_KEY=$(cat ${USER}_rsa.pub)
rm ${USER}_rsa
rm ${USER}_rsa.pub
ssh -o StrictHostKeyChecking=no root@"${SERVER}" << EOF
sudo adduser --disabled-password --gecos "" ${USER}
echo "travis ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USER}
chmod 0440 /etc/sudoers.d/${USER}

sudo su ${USER}
mkdir /home/${USER}/.ssh
chmod 700 /home/${USER}/.ssh
echo "$PUB_KEY" >> /home/${USER}/.ssh/authorized_keys

EOF