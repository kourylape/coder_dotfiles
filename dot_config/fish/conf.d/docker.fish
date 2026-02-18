# Docker shortcuts
abbr -a dps 'docker ps --format "table {{.Names}}\t{{.Status}}"'
abbr -a de 'docker exec -e COLUMNS="$(tput cols)" -e LINES="$(tput lines)" -ti'
abbr -a dstop 'docker stop -t 30 $(docker ps -a -q)'
abbr -a dstart 'docker start $(docker ps -a -q)'
abbr -a dclean 'docker system prune -f && docker volume prune -f && docker rmi -f $(docker images -a -q)'
