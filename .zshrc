

typeset -U path cdpath fpath manpath

for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

HELPDIR="/nix/store/0xy5m4xbkx8bjkb5a216q2n6v2lh3gh5-zsh-5.9/share/zsh/$ZSH_VERSION/help"





# Oh-My-Zsh/Prezto calls compinit during initialization,
# calling it twice causes slight start up slowdown
# as all $fpath entries will be traversed again.
autoload -U compinit && compinit







# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="10000"

HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

# Exclude certain commands from history
function precmd() {
  case "$BUFFER" in
    (rm\ *|pkill\ *|cp\ *) return 1 ;;
  esac
}

setopt HIST_FCNTL_LOCK
unsetopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY

# Completion
autoload -Uz compinit
compinit
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# Syntax Highlighting
if [ -f "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Binds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


# Aliases
alias update="sudo nixos-rebuild switch --flake \"$HOME/hyprland-nixos#nixos\""
alias nv='NVIM_APPNAME="nvchad" nvim'

# Adding all the nice little keys to my keychain ;)

eval "$(keychain --quiet --eval ~/.ssh/id_gitlab_ed25519)"
eval "$(keychain --quiet --eval ~/.ssh/id_github_ed25519)"

# Named Directory Hashes

eval "$(starship init zsh)"


