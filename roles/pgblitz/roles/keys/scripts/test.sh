#!/bin/bash
#
# [PlexGuide Menu]
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705 FlickerRate
# URL:      https://plexguide.com
#
# PlexGuide Copyright (C) 2018 PlexGuide.com
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################

#clear && ansible-playbook /opt/plexguide/pg.yml --tags cloudst2 --skip-tags cron

rm -r /root/.config/rclone/rclone.conf
cp /root/.config/rclone/rclone.conf2 /root/.config/rclone/rclone.conf

bash /opt/plexguide/roles/pgblitz/roles/keys/scripts/list.sh
bash /opt/plexguide/roles/pgblitz/roles/keys/scripts/gdsa.sh