# Go up N directories
function up() {

  str=""
  count=0

  while [ "$count" -lt "$1" ];
  do
    str=$str"../"
    let count=count+1
  done

  cd $str

}

# Show my IP
function myip() {

  hostname
  ip addr | awk '/inet / {sub(/\/.*/, "", $2); print $2}'
  dig +short myip.opendns.com @resolver1.opendns.com

}

# Create a backup file
function bak() {

  cp $1{,.bak}

}

# Start PHP server
function phpserver() {

  local port="${1:-4000}";
  sleep 1
  php -S "localhost:${port}";

}

# Start Python server
function pyserver() {

  local port="${1:-8000}";
  sleep 1
  python -m SimpleHTTPServer $port

}

# Determine size of a file or total size of a directory
function fs() {

  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh;
  else
    local arg=-sh;
  fi

  if [[ -n "$@" ]]; then
    du $arg -- "$@";
  else
    du $arg .[^.]* *;
  fi;

}

# https://laravel.com/docs/5.2/homestead#daily-usage
function __homestead() {

  cd ~/Homestead
  vagrant $*

}

# https://github.com/mathiasbynens/dotfiles/blob/ec493f5b1bb1650ef4d293291105430c3a982c08/.bash_prompt
function prompt_git() {

  local s='';
  local branchName='';

  # Check if the current directory is in a Git repository.
  if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

    # check if the current directory is in .git before running git checks
    if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

      # Ensure the index is up to date.
      git update-index --really-refresh -q &>/dev/null;

      # Check for uncommitted changes in the index.
      if ! $(git diff --quiet --ignore-submodules --cached); then
        s+='+';
      fi;

      # Check for unstaged changes.
      if ! $(git diff-files --quiet --ignore-submodules --); then
        s+='!';
      fi;

      # Check for untracked files.
      if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        s+='?';
      fi;

      # Check for stashed files.
      if $(git rev-parse --verify refs/stash &>/dev/null); then
        s+='$';
      fi;

    fi;

    # Get the short symbolic ref.
    # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
    # Otherwise, just give up.
    branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
      git rev-parse --short HEAD 2> /dev/null || \
      echo '(unknown)')";

    [ -n "${s}" ] && s=" [${s}]";

    echo -e "${1}${branchName}${2}${s}";

  else

    return;

  fi;

}

# https://github.com/elgris/dotfiles/blob/master/bash_aliases#L15
function extract() {

  if [ -f $1 ] ; then

    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar -zxvf $1   ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac

   else
    echo "'$1' is not a valid file"
   fi

}

# https://www.gitignore.io/docs
function gi() {

  curl -L -s https://www.gitignore.io/api/\$@

}

# Google search
function google() {

  search=""

  for term in $@; do
    search="$search%20$term"
  done

  x-www-browser "http://www.google.com/search?q=$search"

}

# https://hub.docker.com/r/library/composer/
function __php_composer() {

  echo "Current working directory: '"$(pwd)"'"

  docker run \
    `tty -s && tty=--tty` \
    --interactive \
    --rm \
    --user $(id -u):$(id -g) \
    --volume /etc/passwd:/etc/passwd:ro \
    --volume /etc/group:/etc/group:ro \
    --volume $(pwd):/app \
    composer "$@"

}

function __php() {

  docker run \
    --rm \
    --interactive \
    --user $(id -u):$(id -g) \
    --volume /etc/passwd:/etc/passwd:ro \
    --volume /etc/group:/etc/group:ro \
    --volume $(pwd):/app \
    --workdir /app \
    --network host \
    magnobiet/php:7.2-cli \
    php "$@"

}

function __phpstan() {

  docker run \
    --rm \
    -v $PWD:/app \
    phpstan/phpstan \
    "$@"

}
