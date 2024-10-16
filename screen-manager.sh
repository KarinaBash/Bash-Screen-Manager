RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;36m'
WHITE='\033[1;37m'
YELLOW='\033[1;33m'
NC='\033[0m' 

LOG_FILE="$HOME/screen_manager.log"

log_activity() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $1" >> "$LOG_FILE"
}

display_screen_list() {
    clear
    echo -e "${BLUE}==============================="
    echo -e "   Active Screen Sessions"
    echo -e "===============================${NC}"

    screen -ls | grep -v "Sockets" | awk -v green="$GREEN" -v white="$WHITE" '
    NR>1 { printf("%s%s. %s%s\n", white, NR-1, green, $1) }'

    echo -e "${BLUE}===============================${NC}"
}

open_screen() {
    local session=$(screen -ls | grep -v "Sockets" | awk -v n=$1 'NR==n+1 { print $1 }')

    if [ -z "$session" ]; then
        echo -e "${RED}Invalid screen number!${NC}"
        log_activity "Failed to open screen: Invalid number $1"
    else
        echo -e "${YELLOW}Opening session: ${GREEN}$session${NC}"
        log_activity "Opened screen session: $session"
        screen -r $session
    fi
}

kill_screen() {
    local session=$(screen -ls | grep -v "Sockets" | awk -v n=$1 'NR==n+1 { print $1 }')

    if [ -z "$session" ]; then
        echo -e "${RED}Invalid screen number!${NC}"
        log_activity "Failed to kill screen: Invalid number $1"
    else
        echo -e "${YELLOW}Killing session: ${GREEN}$session${NC}"
        log_activity "Killed screen session: $session"
        screen -S $session -X quit
    fi
}

display_menu() {
    echo -e "${YELLOW}Options:${NC}"
    echo -e "1. ${WHITE}Open screen${NC}"
    echo -e "2. ${WHITE}Kill screen${NC}"
    echo -e "3. ${WHITE}Exit${NC}"
}

while true; do
    display_screen_list
    display_menu

    read -p "Choose an option [1-3]: " choice

    case "$choice" in
        1)  read -p "Enter screen number to open: " number
            open_screen $number
            ;;
        2)  read -p "Enter screen number to kill: " number
            kill_screen $number
            ;;
        3)  echo -e "${GREEN}Exiting. Thank you!${NC}"
            log_activity "Script exited by user."
            exit 0
            ;;
        *)  echo -e "${RED}Invalid option!${NC}" ;;
    esac

    clear
done