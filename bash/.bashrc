# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# User-specific environment
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# Systemd configuration
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim
alias zedupdate='curl -f https://zed.dev/install.sh | sh'

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

# tmux-sessionizer script (needs fzf) credits: ThePrimeagen
alias tmux-sessionizer='~/.local/scripts/tmux-sessionizer.sh'
alias cht="~/.local/bin/cht.sh"

# Keybindings (Ctrl+F runs the script)
bind '"\C-f":"~/.local/scripts/tmux-sessionizer.sh\n"'

# bat (cat with wings)
export BAT_THEME=base16

# Bash completion
[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Load additional shell configurations
for rc in "$HOME/.bashrc.d/"*; do
    [ -f "$rc" ] && . "$rc"
done

# fnm (Fast Node Manager)
FNM_PATH="$HOME/.local/share/fnm"
[ -d "$FNM_PATH" ] && export PATH="$FNM_PATH:$PATH" && eval "$(fnm env)"

# Deno
[ -f "$HOME/.deno/env" ] && . "$HOME/.deno/env"

# SDKMAN (must be at the end for proper initialization)
export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && . "$SDKMAN_DIR/bin/sdkman-init.sh"

# Cargo (Rust)
. "$HOME/.cargo/env"
