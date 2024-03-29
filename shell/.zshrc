ZSH_BASE=$HOME/dotfiles # Base directory for ZSH configuration

source $ZSH_BASE/antigen/antigen.zsh # Load Antigen

# Ensure colors work properly on Alpine
autoload colors && colors

antigen use oh-my-zsh # Yes, I want to use Oh My ZSH

# Terminal stuff
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle z

# Do OS dependant stuff
case `uname` in
  Darwin)
    # Commands for macOS go here
    antigen bundle macos
  ;;
  Linux)
    # Commands for Linux go here
  ;;
esac

# Set the theme
antigen theme ys 

# And lastly, apply the Antigen stuff
antigen apply

# Default editor
export EDITOR=nvim

# Needs to go after antigen
source ~/.aliases 


# Commented out until gcloud supports Python 3.10
# https://issuetracker.google.com/issues/205238176
if [ -d '/opt/homebrew/opt/python@3.9' ]; then PATH="/opt/homebrew/opt/python@3.9/bin:$PATH"; fi
#if [ -d '/opt/homebrew/opt/python@3.10' ]; then PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"; fi

if [ -d '/Users/david/go/bin' ]; then path+=('/Users/david/go/bin'); fi
if [ -d '/opt/metasploit-framework/bin/' ]; then path+=('/opt/metasploit-framework/bin/'); fi
if [ -d '/opt/homebrew/opt/mysql-client/bin' ]; then path+=('/opt/homebrew/opt/mysql-client/bin'); fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/david/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/david/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/david/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/david/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
