# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/caio/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="arrow"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  asdf
  ansible
  git-auto-fetch
  gitfast
  heroku
  jira
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias g="git"
alias gst="git status"
alias gdiff="git diff"

alias b="bundle exec"

alias dco="docker-compose"

alias cdplatform="cd ~/workspace/platform"
alias cdjobs="cd ~/workspace/jobs"
alias cdeai="cd ~/workspace/eai-rails"
alias cdapi="cd ~/workspace/api"
alias cdinfra="cd ~/workspace/infra"

export EDITOR='nvim'

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

export PATH=~/.local/bin:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$PATH:$HOME/apache-jmeter-5.1.1/bin"

function volume {
  PERCENT=$1
  SINK=$2
  SINK=${SINK:-"0"}

  pactl -- set-sink-volume $SINK $PERCENT%
}

function brightness {
  SYNTAX="\\n \\t SYNTAX:  dimmer level \\n \\t Where 'level' ranges from 0 to 100.\\n";

  LEVEL=$1
  if [ $LEVEL -gt 100 ]; then
    echo -e $SYNTAX;
    exit 1;
  fi

  if [ $LEVEL -lt 0 ]; then
    echo -e $SYNTAX;
    exit 1;
  fi
  brightness_level="$(( $LEVEL / 100)).$(( $LEVEL % 100 ))"
  screenname=$(xrandr | grep " connected" | cut -f1 -d" ")
  xrandr --output $screenname --brightness $brightness_level;
  echo -e "[info]: Screen Brightness level set to" $LEVEL"%"
}

function lock {
  which i3lock && i3lock -c 1d4d4f -e
}

function mysuspend {
  lock

  systemctl suspend;
}

alias media="playerctl"
alias wifi="nmcli dev wifi"
