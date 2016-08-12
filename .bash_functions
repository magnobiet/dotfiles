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

# Extract tar file
function untar() {

  tar -zxvf $*

}

# https://www.gitignore.io/docs
function gi() {

  curl -L -s https://www.gitignore.io/api/\$@

}
