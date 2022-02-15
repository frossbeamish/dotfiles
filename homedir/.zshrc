# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.dotfiles/oh-my-zsh
export ZSH_THEME="powerlevel10k/powerlevel10k"

# colorcode test
# for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"

zsh_battery_level() {
  local percentage1=`pmset -g ps  |  sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p'`
  local percentage=`echo "${percentage1//\%}"`
  local color='%F{red}'
  local symbol="\uf00d"
  pmset -g ps | grep "discharging" > /dev/null
  if [ $? -eq 0 ]; then
    local charging="false";
  else
    local charging="true";
  fi
  if [ $percentage -le 20 ]
  then symbol='\uf579' ; color='%F{red}' ;
    #10%
  elif [ $percentage -gt 19 ] && [ $percentage -le 30 ]
  then symbol="\uf57a" ; color='%F{red}' ;
    #20%
  elif [ $percentage -gt 29 ] && [ $percentage -le 40 ]
  then symbol="\uf57b" ; color='%F{yellow}' ;
    #35%
  elif [ $percentage -gt 39 ] && [ $percentage -le 50 ]
  then symbol="\uf57c" ; color='%F{yellow}' ;
    #45%
  elif [ $percentage -gt 49 ] && [ $percentage -le 60 ]
  then symbol="\uf57d" ; color='%F{blue}' ;
    #55%
  elif [ $percentage -gt 59 ] && [ $percentage -le 70 ]
  then symbol="\uf57e" ; color='%F{blue}' ;
    #65%
  elif [ $percentage -gt 69 ] && [ $percentage -le 80 ]
  then symbol="\uf57f" ; color='%F{blue}' ;
    #75%
  elif [ $percentage -gt 79 ] && [ $percentage -le 90 ]
  then symbol="\uf580" ; color='%F{blue}' ;
    #85%
  elif [ $percentage -gt 89 ] && [ $percentage -le 99 ]
  then symbol="\uf581" ; color='%F{blue}' ;
    #85%
  elif [ $percentage -gt 98 ]
  then symbol="\uf578" ; color='%F{green}' ;
    #100%
  fi
  if [ $charging = "true" ];
  then color='%F{green}'; if [ $percentage -gt 98 ]; then symbol='\uf584'; fi
  fi
  echo -n "%{$color%}$symbol" ;
}

zsh_internet_signal(){
  local airportOut=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | tr -d '\n')
  local signal=0
  local noise=1
  if [[ ! $airportOut =~ .*Off* ]]; then
    signal=$(echo "$airportOut" | grep agrCtlRSSI | awk '{print $2}' | sed 's/-//g')
    noise=$(echo "$airportOut" | grep agrCtlNoise | awk '{print $2}' | sed 's/-//g')
  fi
  local SNR=$(bc <<<"scale=2; $signal / $noise")

  local net=$(curl -LI http://www.example.org -o /dev/null -w '%{http_code}\n' -s)
  local color='%F{red}'
  local symbol="\uf011"

  # Excellent Signal (5 bars)
  if [[ ! -z "${signal// }" ]] && [[ $SNR -gt .40 ]] ;
    then color='%F{blue}' ; symbol="\uf1eb" ;
  fi

  # Good Signal (3-4 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .40 ]] && [[ $SNR -gt .25 ]] ;
    then color='%F{green}' ; symbol="\uf1eb" ;
  fi

  # Low Signal (2 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .25 ]] && [[ $SNR -gt .15 ]] ;
    then color='%F{yellow}' ; symbol="\uf1eb" ;
  fi

  # Very Low Signal (1 bar)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .15 ]] && [[ $SNR -gt .10 ]] ;
    then color='%F{red}' ; symbol="\uf1eb" ;
  fi

  # Ethernet Connection (no wifi, hardline)
  if [[ "${signal}" -eq 0 ]] && [[ "$net" -eq 200 ]] ;
    then color='%F{blue}' ; symbol="\uf011" ;
  fi

  echo -n "%{$color%}$symbol "
}

zsh_spotify () {
  running=`ps -ax | grep Spotify.app | wc -l | tr -d ' '`
  if [ $running -gt 1 ]; then
    state=`osascript -e 'tell application "Spotify" to player state as string'`;
    if [ $state = "playing" ]; then
      symbol="\uF1BC"
      symbolColor='%F{green}'
      color='%F{blue}'
      artist=`osascript -e 'tell application "Spotify" to artist of current track as string'`;
      track=`osascript -e 'tell application "Spotify" to name of current track as string'`;

      echo -n "%{$symbolColor%}$symbol %{$color%}$artist - $track";
    fi
  fi
}

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%f "

# Time
POWERLEVEL9K_TIME_BACKGROUND="238"
POWERLEVEL9K_TIME_FOREGROUND="blue"
POWERLEVEL9K_TIME_FORMAT="%D{%I:%M:%S}"
POWERLEVEL9K_TIME_ICON="\UF43A"

# Root
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="red"
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="white"

# Dir
POWERLEVEL9K_DIR_HOME_FOREGROUND="238"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="238"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="238"

# VCS
POWERLEVEL9K_SHOW_CHANGESET=true

# Command Execution Time
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='238'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0

# Status
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_BACKGROUND="238"

# Spotify
POWERLEVEL9K_CUSTOM_SPOTIFY="zsh_spotify"
POWERLEVEL9K_CUSTOM_SPOTIFY_BACKGROUND="238"
POWERLEVEL9K_CUSTOM_SPOTIFY_FOREGROUND="253"

# Internet
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL="zsh_internet_signal"
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL_BACKGROUND="238"
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL_FOREGROUND="253"

# WiFi
POWERLEVEL9K_CUSTOM_BATTERY_STATUS="zsh_battery_level"
POWERLEVEL9K_CUSTOM_BATTERY_STATUS_BACKGROUND="238"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time ssh root_indicator dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time custom_spotify custom_internet_signal custom_battery_status_joined)

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# disable colors in ls
# export DISABLE_LS_COLORS="true"

# disable autosetting terminal title.
export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.dotfiles/oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(colorize compleat dirpersist autojump git gulp history cp)

source $ZSH/oh-my-zsh.sh

source /usr/local/opt/nvm/nvm.sh --no-use

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use &> /dev/null
  else
    nvm use stable
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Customize to your needs...
unsetopt correct

# run fortune on new terminal :)
# fortune

# The next line enables shell command completion for ffsctl.
if [ $commands[ffsctl] ]; then source <(ffsctl completion zsh); fi

# The next line enables shell command completion for stsctl.
if [ $commands[stsctl] ]; then source <(stsctl completion zsh); fi
