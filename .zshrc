# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE=“false”

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

##################################################################################
#                           For Jacky Personal Settings                          #
##################################################################################

######## Zsh Plugins Begin #########
# k zsh plugin: https://github.com/rimraf/k
# plugins+=(k)
source ~/.oh-my-zsh/custom/plugins/k/k.sh 
alias k='k --no-vcs'
alias ka='k -a'
alias ls='k'
alias lsa='ka'
######## Zsh Plugins End #########


######## Terminal Command Begin ########
# percol
function exists { which $1 &> /dev/null }
if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi

# pwd
alias pwd='pwd | pbcopy; pbpaste'
######## Terminal Command End ########


######## Quick Entry Begin ########
# For zshrc editor
alias sourcezhrc="source ~/.zshrc"

# For Cocos
alias cdv3='cd /Users/Jacky/Cocos2d-x/v3'
alias cd3rd='/Users/Jacky/Cocos2d-x/3rd-party-libs-bin'
alias gen3rd='cd3rd && cd cocos2d-x-3rd-party-libs-bin && git pull origin v3 --tags && cd .. && ./generate_cocos2dx_deps.sh'

# Sublime Text3
alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
######## Quick Entry End ########


######## Git Begin ########
alias fuck="git status"
######## Git End ########


######## Cocos Environment Begin ########
# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/Jacky/Cocos2d-x/v3/tools/cocos2d-console/bin
#export COCOS_CONSOLE_ROOT=/Users/Jacky/Cocos2d-x/cocos2d-x-3.10/tools/cocos2d-console/bin
#export COCOS_CONSOLE_ROOT=/Users/Jacky/Cocos2d-x/cocos2d-x-3.3/tools/cocos2d-console/bin
#export COCOS_CONSOLE_ROOT=/Users/Jacky/Cocos2d-js/cocos2d-js-v3.3/tools/cocos2d-console/bin
#export COCOS_CONSOLE_ROOT=/Applications/Cocos/frameworks/cocos2d-x-3.4/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
#export COCOS_TEMPLATES_ROOT=/Users/Jacky/Cocos2d-x/cocos2d-x-3.10/templates
#export COCOS_TEMPLATES_ROOT=/Users/Jacky/Cocos2d-x/cocos2d-x-3.3/templates
export COCOS_TEMPLATES_ROOT=/Users/Jacky/Cocos2d-x/v3/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
#export NDK_ROOT=/Users/Jacky/AndroidDev/android-ndk-r9d
export NDK_ROOT=/Users/Jacky/AndroidDev/android-ndk-r10c
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/Users/Jacky/AndroidDev/sdk
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.9.5/libexec/bin
export PATH=$ANT_ROOT:$PATH
######## Cocos Environment End ########

######## Path Export Begin ########
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home/

# NodeJS
export NODE_PATH='/usr/local/lib/node_modules'

# Ruby
export PATH=/Users/jacky/.rbenv/versions/2.2.3/bin:$PATH

# ApkTool
export PATH=/Users/jacky/AndroidDev/apktool:$PATH

# Dex2jar
export PATH=/Users/jacky/AndroidDev/dex2jar:$PATH
######## Path Export End ########
