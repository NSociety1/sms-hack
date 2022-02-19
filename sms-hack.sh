#/bin/bash

# LOADER
LOADER() {
echo -e "${YELLOW}#${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}##${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}###${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}####${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}#####${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}######${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}#######${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}########${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}#########${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}##########${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}###########${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}############${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}#############${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}##############${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}###############${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}################${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}#################${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}##################${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}###################${RESET}"
sleep 0.01; clear
echo -e "${YELLOW}####################${RESET}"
sleep 0.01; clear
}
# HEADERS
header_green() {
  clear
  clear
  echo -e "${GREEN}########################################################${RESET}\\n"
  echo
}

header_red() {
  clear
  clear
  echo -e "${RED}########################################################${RESET}\\n"
  echo
}

header_CYAN() {
  clear
  clear
  echo -e "${CYAN}########################################################${RESET}\\n"
  echo
}
LOGO() {
header_green
cat << "EOF"
 .-._                                                   _,-,
  `._`-._                                           _,-'_,'
     `._ `-._                                   _,-' _,'
        `._  `-._        __.-----.__        _,-'  _,'
           `._   `#==="""           """===#'   _,'
              `._/)  ._               _.  (\_,'
               )*'     **.__     __.**     '*( 
               #  .==..__  ""   ""  __..==,  # 
NSociety       #   `"._(_).       .(_)_."'   #

EOF
}
#Variables

default="\e[39m"
yellow="\e[33m"
red="\e[31m"
green='\033[0;32m'
lightyellow="\e[93m"
cyan="\e[36m"
# COLORS
RESET='\033[0m'
YELLOW='\033[1;33m'
CYAN='\e[36m'
GRAY='\033[0;37m'
WHITE='\033[1;37m'
GRAY_R='\033[39m'
WHITE_R='\033[39m'
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\e[34m'
BOLD='\e[1m'
BLINK='\033[5m'

#Dependency check

curl=/usr/bin/curl
a=y
# LOAD
LOADER
#Curl
echo ""
header_CYAN
echo -e "${yellow}[+] Checking your installation , Please wait . . ."
echo ""
echo -e "[+] Checking curl . . ."
if ! dpkg -l curl 2> /dev/null | awk '{print $1}' | grep -iq "^ii\\|^hi\\|^i"; then
  header_red && echo -e "${RED}#${RESET} Curl is required but not installed on your system!"
  read -rp $'# Do you want to install it? (Y/n) ' yes_no;
  case "$yes_no" in
      [Yy]*|"")echo -e "${YELLOW}Ok.. Please wait.. ${BLINK}Installing..${RESET}" && pkg update &> /dev/null && pkg install curl -y &> /dev/null;;
      [Nn]*) exit 0;;
  esac
fi

#Banner
LOGO
echo -e "${yellow}                                                          -> coded by madroots"
sleep 2 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done

#Main Function
echo ""
echo -e "${BLUE}[+] Note :- Free tier: 1 sms per day limit${RESET}"
echo ""
echo -e "${yellow}[+] Enter recipent's phone number with country code (+)"
echo ""
read -p "-> " phone
echo ""
echo -e "${yellow}[+] Enter your message e.g. -> [hello asshole]"
echo ""
read -p "-> " message
echo ""
echo -e "${green}[+] Sending . . ."
sleep 1 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
echo ""

#Output
curl -X POST https://textbelt.com/text \
       --data-urlencode phone=$phone \
       --data-urlencode message="$message" \
       -d key=textbelt
echo "${default}"
#DONE
