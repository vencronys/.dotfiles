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

# Colors (Zenbones Monochrome)
DARK_GRAY="\[\e[38;5;235m\]"  # Near-black gray
LIGHT_GRAY="\[\e[38;5;250m\]" # Soft light gray
WHITE="\[\e[38;5;255m\]"      # Brighter white
RESET="\[\e[0m\]"

# Minimal, default-style single-line prompt
PS1="[${LIGHT_GRAY}\u@\h ${WHITE}\W\$(parse_git_branch)${RESET}]\$ "

# Color breakdown:
# \t - Time in HH:MM:SS (cyan)
# \u@\h - User and hostname (green)
# \w - Current working directory (blue)
# Git branch (if any) (yellow)

# Exports
export TERMINAL=kitty
export BAT_THEME=base16

export PATH=$PATH:"$HOME/.local/bin:$HOME/.cargo/bin:/var/lib/flatpak/exports/bin:/.local/share/flatpak/exports/bin"
# JDK with Java23 --- Uncomment if needed, I am using SDKMAN
# export PATH=$PATH:"/usr/lib/jvm/java-23-openjdk/bin"
# Sql Server tools
export PATH=$PATH:"/opt/mssql-tools/bin"

# Android SDK paths
export ANDROID_HOME=$HOME/Android/Sdk
# export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_AVD_HOME=$HOME/.android/avd

# Add Android SDK tools to PATH
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/build-tools/$(ls -1 $ANDROID_HOME/build-tools | sort -V | tail -n 1):$PATH

# Bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

# fzf
eval "$(fzf --bash)"

. "/home/vencronys/.deno/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
