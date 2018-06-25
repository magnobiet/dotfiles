# Navigation
alias ..="cd ../"
alias ...="cd ../.."
alias ....="cd ../../.."
alias l='ls -lahFG'
alias lf='ls -lahFG | grep -E "^-|^l"' # only files
alias lh='ls -lahdFG .??*' # only hidden

# System utilities
alias update='sudo sh -c "apt-get update; apt-get upgrade -y; apt-get autoremove; apt-get autoclean"'
alias updatev='sudo apt-get dist-upgrade -y'
alias syslog='tail -f /var/log/syslog'

# Utils
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
alias clock='date "+%A %m/%d -%l:%M %p"'
alias sshgen='ssh-keygen -t rsa -b 4096'

# PHP Development
alias php='__php'
alias composer='__php_composer'
alias phpstan='__phpstan'
## Laravel
alias artisan='php artisan'
alias homestead='__homestead'

# Docker
alias compose='docker-compose'
