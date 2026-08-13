# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

export TERM="alacritty"

alias ..="cd ../"
alias ...="cd ../../"

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

if [ -f $HOME/secrets ]; then
    source $HOME/secrets
fi

# SSH / GPG
export GPG_TTY=$(tty)
ssh-add -K ~/.ssh/id_rsa-otto-ec-github 2&>/dev/null
ssh-add -K ~/.ssh/id_rsa 2&>/dev/null

# Starship (https://starship.rs/)
eval "$(starship init bash)"

# NVM - Node Version Manager
export NVM_DIR="$HOME/.nvm"
export NVM_HOME="$(brew --prefix nvm)"
[ -s "$NVM_HOME/nvm.sh" ] && \. "$NVM_HOME/nvm.sh"
[ -s "$NVM_HOME/bash_completion" ] && \. "$NVM_HOME/bash_completion"

# Python
export PYTHONDONTWRITEBYTECODE=1
export PATH="$(brew --prefix python3)/bin:$PATH"

# Golang
export GOPATH="$HOME/go"
export GOROOT="$(brew --prefix go)/libexec"
export PATH="$GOPATH/bin:$PATH"

# Rust
export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"
[ -f "$CARGO_HOME/env" ] && \. "$CARGO_HOME/env"

# https://rust-analyzer.github.io/book/installation.html#rust-standard-library
export RUSTUP_TOOLCHAIN=stable

# Emacs / Doom Emacs
export PATH="$PATH:$HOME/.config/emacs/bin"

# Vim