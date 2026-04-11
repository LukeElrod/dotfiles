#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias vi='nvim'
alias la='ls -la'
alias cls='clear'

hex_to_ps1_color() {
  local hex="${1#"#"}"
  local r g b
  r=$((16#${hex:0:2}))
  g=$((16#${hex:2:2}))
  b=$((16#${hex:4:2}))
  printf '\[\e[38;2;%d;%d;%dm\]' "$r" "$g" "$b"
}

PS1="$(hex_to_ps1_color '89B482')\u@\h \w> \[\e[0m\]"

# pnpm
export PNPM_HOME="/home/raz/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="$HOME/.local/bin:$PATH"
