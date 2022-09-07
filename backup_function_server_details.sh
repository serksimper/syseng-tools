#!/bin/bash

#######################################
# description
# Globals:
#   BLUE
#   BOLD
#   BOLD_Blue
#   BOLD_Italics
#   BOLD_Red
#   Blink
#   Blue_Two
#   CYAN
#   Cyan
#   ENDCOLOR
#   FGBLUE
#   FGRED
#   GREEN
#   Green
#   HOSTNAME
#   HPEGreen
#   Italics
#   MAGENTA
#   NC
#   Red
#   USER
#   YELLOW
#   Yellow
#   current_folder
#   current_public_ip
#   current_top_five_clients
#   kernel
#   last_reboot
#   server_uptime
# Arguments:
#  None
#######################################
function main() {
  {
    BLUE="\e[34m"
    YELLOW="\e[33m"
    GREEN="\e[32m"
    MAGENTA="\e[35m"
    ENDCOLOR="\e[0m"
    CYAN="\e[36m"
    Green=$'\e[1;32m'
    HPEGreen=$'\e[38;5;78m'
    Yellow=$'\e[0;93m'
    Blue_Two=$'\e[0;36m'
    BOLD_Blue=$'\e[1;36m'
    FGBLUE=$'\e[1;35;44m'
    Red=$'\e[0;91m'
    Cyan=$'\e[0;96m'
    BOLD_Red=$'\e[1;31m'
    FGRED=$'\e[0;41m'
    NC=$'\e[0m'
    BOLD=$'\e[1m'
    Italics=$'\e[3m'
    BOLD_Italics=$'\e[1;3m'
    Blink=$'\e[5m'
  }

  kernel=$(exec uname -r)

  server_uptime=$(exec uptime -p)

  last_reboot=$(exec uptime -p -s)

  current_folder=$(exec pwd)

  current_top_five_clients=$(exec tcpdump -nnn -t -c 20 | cut -f 1,2,3,4 -d sleep 5 | sort | uniq -c | sort -nr | head -n 5)

  current_public_ip=$(exec curl api.ipify.org)

  echo -e "${GREEN}CONNECTED${ENDCOLOR}: ${Blink}${HOSTNAME}${Blink}"

  echo -e "${BLUE}CURRENT USER${ENDCOLOR}: ${USER}"

  echo -e "${Blue_Two}CURRENT FOLDER${ENDCOLOR}: ${current_folder}"

  echo -e "${YELLOW}KERNEL${ENDCOLOR}: ${kernel}"

  echo -e "${BOLD_Blue}SERVER UPTIME${ENDCOLOR}: ${server_uptime}"

  echo -e "${CYAN}LAST REBOOT${ENDCOLOR}: ${last_reboot}"

  echo -e "${BLUE}TOP 5 CONNECTED TCP CLIENTS${ENDCOLOR}: ${current_top_five_clients}"

  echo -e "${BOLD_Red}CURRENT PUBLIC IP${ENDCOLOR}: ${current_public_ip}"

}

main "$@"