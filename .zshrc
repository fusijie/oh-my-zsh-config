# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx zsh-syntax-highlighting zsh-autosuggestions git-open)

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
# For zshrc
alias sourcezhrc="source ~/.zshrc"

# Sublime Text3
alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"

# Visual Studio Code
alias vsc="'/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code'"

# For show android package name
function showpackage {
	aapt dump badging $1 | grep package:\ name
}
######## Quick Entry End ########


######## Git Begin ########
alias fuck="git status"
alias f="git status"
alias fuc="git status"
alias gb="git pull origin master"
alias gc="git commit -m 'update'"
######## Git End ########


######## Cocos Environment Begin ########
# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Users/jacky/AndroidDev/android-ndk-r10c
export PATH=$NDK_ROOT:$PATH
export ANDROID_NDK_ROOT=/Users/jacky/AndroidDev/android-ndk-r10c
export PATH=$ANDROID_NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/Users/jacky/AndroidDev/sdk
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/bin
export PATH=$ANT_ROOT:$PATH
######## Cocos Environment End ########


####### Java Begin #######
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home/
####### Java End #######


######## NVM Begin ########
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
######## NVM End ########


####### Mysql Begin #######
export MYSQL_BIN_ROOT=/usr/local/mysql/bin
export PATH=$MYSQL_BIN_ROOT:$PATH
####### Mysql End #######


####### Android SDK BUILD-TOOLS Begin #######
export ANDROID_BUILD_TOOLS=/Users/jacky/AndroidDev/sdk/build-tools/27.0.3
export PATH=$ANDROID_BUILD_TOOLS:$PATH
####### Android SDK BUILD-TOOLS End #######
# Add environment variable SDKBOX_HOME for sdkbox installer
export SDKBOX_HOME=/Users/jacky/.sdkbox
export PATH=${SDKBOX_HOME}/bin:$PATH
