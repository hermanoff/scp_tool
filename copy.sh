#!/bin/bash
ssh_file="~/.ssh/"

echo "Do you want to copy something FROM or T(w)O remote machine? (Enter 1 or 2)"
read from_to

echo "Enter the name of your ssh key file (file should be in ~/.ssh directory)"
read ssh_name

echo "Enter remote machine username:"
read username

echo "Enter the IP addres of remote server:"
read remote_ip

if [ $from_to == 1 ]
then
  echo "Enter the full path of file on the remote machine:"
  read remote_path
  echo "Enter path on localhost:"
  read local_path
  scp -i $ssh_file$ssh_name $username@$remote_ip:$remote_path $local_path 
fi

if [ $from_to == 2 ]
then
  echo "Enter the path of file on localhost"
  read local_path
  echo "Enter the full path on remote machine:"
  read remote_path
  scp -i $ssh_file$ssh_name $local_path $username@$remote_ip:$remote_path
fi