 #!/bin/bash
export NCURSES_NO_UTF8_ACS=1

############################### Creates Starter Files if it Doesn't Exist
file="/var/plexguide/server.appguard" 1>/dev/null 2>&1
  if [ -e "$file" ]
    then
  echo "" 1>/dev/null 2>&1
    else
  touch /var/plexguide/server.appguard 1>/dev/null 2>&1
  echo "[OFF]" > /var/plexguide/server.appguard
  fi

file="/var/plexguide/server.ports.status" 1>/dev/null 2>&1
  if [ -e "$file" ]
    then
  echo "" 1>/dev/null 2>&1
    else
  touch /var/plexguide/var/plexguide/server.ports.status 1>/dev/null 2>&1
  echo "[OPEN]" > /var/plexguide/server.ports.status
  fi
############################### Calls Variables

appguard=$(cat /var/plexguide/server.appguard)
portstat=$(cat /var/plexguide/server.ports.status)

echo "INFO - @PG Security Menu" > /var/plexguide/pg.log && bash /opt/plexguide/roles/log/log.sh
echo "INFO - AppGuard $appguard | Ports $portstat" > /var/plexguide/pg.log && bash /opt/plexguide/roles/log/log.sh

HEIGHT=10
WIDTH=43
CHOICE_HEIGHT=3
BACKTITLE="Visit https://PlexGuide.com - Automations Made Simple"
TITLE="PG Server Security"
MENU="Make a Selection:"

OPTIONS=(A "APP Ports - $portstat"
         B "APP Guard Protection - $appguard"
         Z "Exit")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        A)
          echo "INFO - Selected Ports Menu Interface" > /var/plexguide/pg.log && bash /opt/plexguide/roles/log/log.sh
          bash /opt/plexguide/roles/ports/main.sh ;;
        B)
          echo "INFO - APPGuard Menu Interface" > /var/plexguide/pg.log && bash /opt/plexguide/roles/log/log.sh
          bash /opt/plexguide/menus/security/ht.sh ;;
        Z)
            clear
            echo "INFO - Exited PG Security Menu" > /var/plexguide/pg.log && bash /opt/plexguide/roles/log/log.sh
            exit 0
            ;;
esac

bash /opt/plexguide/menus/security/main.sh
