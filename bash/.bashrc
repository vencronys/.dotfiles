#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disable the bell
if [[ $iatest -gt 0 ]]; then bind "set bell-style visible"; fi

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# History options
# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTTIMEFORMAT="%F %T" # add timestamp to history
#
# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace
#
# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize
#
# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
PROMPT_COMMAND='history -a'

# Set up XDG folders
# export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_STATE_HOME="$HOME/.local/state"
# export XDG_CACHE_HOME="$HOME/.cache"

# Allow ctrl-S for history navigation (with ctrl-R)
[[ $- == *i* ]] && stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi
#
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim
alias vim='nvim'

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated
#
# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# -------------Aliases-------------
#
# Machine specific aliass
#
# Alias for SSH
# alias SERVERNAME='ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
#
# Alias to change the directory
# alias web='cd /var/www/html'
#
# Alias to mount ISO files
# mount -o loop /home/NAMEOFISO.iso /home/ISOMOUNTDIR/
# umount /home/NAMEOFISO.iso
# (Both commands done as root only.)

# General aliases
#
# To temporarily bypass an alias, we precede the command with a \
# EG: the ls command is aliased, but to use the normal ls command you would type \ls
#
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Edit this .bashrc file
alias ebrc='nvim ~/.bashrc'

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Aliases to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Aliases for multiple directory listing commands
alias la='ls -Alh'                # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh'               # sort by extension
alias lk='ls -lSrh'               # sort by size
alias lc='ls -ltcrh'              # sort by change time
alias lu='ls -lturh'              # sort by access time
alias lr='ls -lRh'                # recursive ls
alias lt='ls -ltrh'               # sort by date
alias lm='ls -alh |more'          # pipe through 'more'
alias lw='ls -xAh'                # wide listing format
alias ll='ls -Fls'                # long listing format
alias labc='ls -lap'              # alphabetical sort
alias lf="ls -l | egrep -v '^d'"  # files only
alias ldir="ls -l | egrep '^d'"   # directories only
alias lla='ls -Al'                # List and Hidden Files
alias las='ls -A'                 # Hidden Files
alias lls='ls -l'                 # List

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search command line history
alias h="history | grep "

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show open ports
alias openports='netstat -nape --inet'

# Aliases for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Aliases to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Aliases for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# Git aliases
alias g="git"
alias gs="git status"
alias gls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias gll='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdate='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative'
alias gdatelong='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'
# Load Git aliases
if [[ -f ~/.git_aliases.bash ]]; then
    source ~/.git_aliases.bash
fi

# tmux-sessisonizer script (needs fzf) credits: ThePrimeagen
alias tmux-sessionizer='~/.local/scripts/tmux-sessionizer.sh'
alias cht="~/.local/bin/cht.sh"

# Keybindings (Ctrl+F runs the script)
bind '"\C-f":"~/.local/scripts/tmux-sessionizer.sh\n"'

# SHA1
alias sha1='openssl sha1'

alias clickpaste='sleep 3; xdotool type "$(xclip -o -selection clipboard)"'

# KITTY - alias to be able to use kitty features when connecting to remote servers(e.g use tmux on remote server)
alias kssh="kitty +kitten ssh"

# alias to cleanup unused docker containers, images, networks, and volumes
alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '

# Special functions
#
# Extracts any archive(s) (if unp isn't installed)
extract() {
  for archive in "$@"; do
    if [ -f "$archive" ]; then
      case $archive in
        *.tar.bz2) tar xvjf $archive ;;
        *.tar.gz) tar xvzf $archive ;;
        *.bz2) bunzip2 $archive ;;
        *.rar) rar x $archive ;;
        *.gz) gunzip $archive ;;
        *.tar) tar xvf $archive ;;
        *.tbz2) tar xvjf $archive ;;
        *.tgz) tar xvzf $archive ;;
        *.zip) unzip $archive ;;
        *.Z) uncompress $archive ;;
        *.7z) 7z x $archive ;;
        *) echo "don't know how to extract '$archive'..." ;;
      esac
    else
      echo "'$archive' is not a valid file!"
    fi
  done
}

# Searches for text in all files in the current folder
ftext() {
  # -i case-insensitive
  # -I ignore binary files
  # -H causes filename to be printed
  # -r recursive search
  # -n causes line number to be printed
  # optional: -F treat search term as a literal, not a regular expression
  # optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
  grep -iIHrn --color=always "$1" . | less -r
}

# Copy file with a progress bar
cpp() {
  set -e
  strace -q -ewrite cp -- "${1}" "${2}" 2>&1 |
    awk '{
      count += $NF
      if (count % 10 == 0) {
        percent = count / total_size * 100
        printf "%3d%% [", percent
        for (i=0;i<=percent;i++)
          printf "="
          printf ">"
          for (i=percent;i<100;i++)
            printf " "
            printf "]\r"
          }
        }
      END { print "" }' total_size="$(stat -c '%s' "${1}")" count=0
    }

# Copy and go to the directory
cpg() {
  if [ -d "$2" ]; then
    cp "$1" "$2" && cd "$2"
  else
    cp "$1" "$2"
  fi
}

# Move and go to the directory
mvg() {
  if [ -d "$2" ]; then
    mv "$1" "$2" && cd "$2"
  else
    mv "$1" "$2"
  fi
}

# Create and go to the directory
mkdirg() {
  mkdir -p "$1"
  cd "$1"
}

# Goes up a specified number of directories  (i.e. up 4)
up() {
  local d=""
  limit=$1
  for ((i = 1; i <= limit; i++)); do
    d=$d/..
  done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

# Automatically do an ls after each cd, z, or zoxide
# cd ()
# {
#   if [ -n "$1" ]; then
#     builtin cd "$@" && ls
#   else
#     builtin cd ~ && ls
#   fi
# }

# Returns the last 2 fields of the working directory
pwdtail() {
  pwd | awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip () {
  # Internal IP Lookup.
  if command -v ip &> /dev/null; then
    echo -n "Internal IP: "
    ip addr show wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1
  else
    echo -n "Internal IP: "
    ifconfig wlan0 | grep "inet " | awk '{print $2}'
  fi

    # External IP Lookup
    echo -n "External IP: "
    curl -s ifconfig.me
  }

# View Apache logs
apachelog() {
  if [ -f /etc/httpd/conf/httpd.conf ]; then
    cd /var/log/httpd && ls -xAh && multitail --no-repeat -c -s 2 /var/log/httpd/*_log
  else
    cd /var/log/apache2 && ls -xAh && multitail --no-repeat -c -s 2 /var/log/apache2/*.log
  fi
}

# Edit the Apache configuration
apacheconfig() {
  if [ -f /etc/httpd/conf/httpd.conf ]; then
    sedit /etc/httpd/conf/httpd.conf
  elif [ -f /etc/apache2/apache2.conf ]; then
    sedit /etc/apache2/apache2.conf
  else
    echo "Error: Apache config file could not be found."
    echo "Searching for possible locations:"
    sudo updatedb && locate httpd.conf && locate apache2.conf
  fi
}

# Edit the PHP configuration file
phpconfig() {
  if [ -f /etc/php.ini ]; then
    sedit /etc/php.ini
  elif [ -f /etc/php/php.ini ]; then
    sedit /etc/php/php.ini
  elif [ -f /etc/php5/php.ini ]; then
    sedit /etc/php5/php.ini
  elif [ -f /usr/bin/php5/bin/php.ini ]; then
    sedit /usr/bin/php5/bin/php.ini
  elif [ -f /etc/php5/apache2/php.ini ]; then
    sedit /etc/php5/apache2/php.ini
  else
    echo "Error: php.ini file could not be found."
    echo "Searching for possible locations:"
    sudo updatedb && locate php.ini
  fi
}

# Edit the MySQL configuration file
mysqlconfig() {
  if [ -f /etc/my.cnf ]; then
    sedit /etc/my.cnf
  elif [ -f /etc/mysql/my.cnf ]; then
    sedit /etc/mysql/my.cnf
  elif [ -f /usr/local/etc/my.cnf ]; then
    sedit /usr/local/etc/my.cnf
  elif [ -f /usr/bin/mysql/my.cnf ]; then
    sedit /usr/bin/mysql/my.cnf
  elif [ -f ~/my.cnf ]; then
    sedit ~/my.cnf
  elif [ -f ~/.my.cnf ]; then
    sedit ~/.my.cnf
  else
    echo "Error: my.cnf file could not be found."
    echo "Searching for possible locations:"
    sudo updatedb && locate my.cnf
  fi
}

# Trim leading and trailing spaces (for scripts)
trim() {
  local var=$*
  var="${var#"${var%%[![:space:]]*}"}" # remove leading whitespace characters
  var="${var%"${var##*[![:space:]]}"}" # remove trailing whitespace characters
  echo -n "$var"
}

# GitHub
gcom() {
  git add .
  git commit -m "$1"
}
lazyg() {
  git add .
  git commit -m "$1"
  git push
}

# Yazi with directory change
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Prompt
# PS1='[\u@\h \W]\$ '
# Custom bash prompt with time, user, host, directory, and git branch
parse_git_branch() {
    git branch 2>/dev/null | grep '*' | sed 's/* //'
}

# With time
PS1='\[\e[0;36m\]\t \[\e[1;32m\]\u@\h \[\e[0;34m\]\w\[\e[0;33m\] $(parse_git_branch)\[\e[0m\]\n\$ '
# Without time
PS1='\[\[\e[1;32m\]\u@\h \[\e[0;34m\]\w\[\e[0;33m\] $(parse_git_branch)\[\e[0m\]\n\$ '

# Color breakdown:
# \t - Time in HH:MM:SS (cyan)
# \u@\h - User and hostname (green)
# \w - Current working directory (blue)
# Git branch (if any) (yellow)

# Paths
export PATH=$PATH:"$HOME/.local/bin:$HOME/.cargo/bin:/var/lib/flatpak/exports/bin:/.local/share/flatpak/exports/bin"

# Starship
# eval "$(starship init bash)"

# fzf
eval "$(fzf --bash)"

# zoxide
# eval "$(zoxide init bash)"
