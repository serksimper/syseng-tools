#!/bin/bash
num_lines=$(wc -l </etc/resolv.conf)

if [ "$num_lines" -lt 4 ]; then
  echo -e "nameserver 8.8.8.8" >>/mnt/infidel/wsl/resolv.conf
  echo -e "Added DNS Resolvers to /etc/resolv.conf"
else
  echo -e "Nothing to do here, Bob!"
fi