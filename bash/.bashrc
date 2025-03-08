#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim
alias vim='nvim'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Git aliases
alias g="git"
alias gs="git status"
alias gls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias gll='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdate='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative'
alias gdatelong='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'
# Load Git aliases
# if [[ -f ~/.git_aliases.bash ]]; then
#     source ~/.git_aliases.bash
# fi

# tmux-sessisonizer script (needs fzf) credits: ThePrimeagen
alias tmux-sessionizer='~/.local/scripts/tmux-sessionizer.sh'
alias cht="~/.local/bin/cht.sh"

# Keybindings (Ctrl+F runs the script)
bind '"\C-f":"~/.local/scripts/tmux-sessionizer.sh\n"'


# Prompt
# PS1='[\u@\h \W]\$ '
# Custom bash prompt with time, user, host, directory, and git branch
# parse_git_branch() {
#     git branch 2>/dev/null | grep '*' | sed 's/* //'
# }
parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Colors
NORD0="\[\e[38;5;236m\]"  # Dark gray (Polar Night)
NORD4="\[\e[38;5;252m\]"  # Light gray (Snow Storm)
NORD8="\[\e[38;5;109m\]"  # Light cyan (Frost)
RESET="\[\e[0m\]"

# Prompt with time
# PS1="${NORD4}\t ${NORD8}\u@\h ${NORD4}\w\$(parse_git_branch)${RESET}\n\$ "
# Prompt without time
PS1="${NORD8}\u@\h ${NORD4}\w\$(parse_git_branch)${RESET}\n\$ "

# Color breakdown:
# \t - Time in HH:MM:SS (cyan)
# \u@\h - User and hostname (green)
# \w - Current working directory (blue)
# Git branch (if any) (yellow)

# Paths
export PATH=$PATH:"$HOME/.local/bin:$HOME/.cargo/bin:/var/lib/flatpak/exports/bin:/.local/share/flatpak/exports/bin:/usr/lib/jvm/java-23-openjdk/bin"
export PATH=$PATH:"/opt/mssql-tools/bin"

# Variable exports
export TERMINAL=kitty

# Bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# fzf
eval "$(fzf --bash)"

. "/home/vencronys/.deno/env"
