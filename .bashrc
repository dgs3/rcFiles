## MongoDB bashrc

# Set colors on bash command line
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Color aliases
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
bakgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

## Command prompt

HOSTCOLOR=$txtblk
HOST_BK=
CURSOR=$txtgrn
CURSOR_BK=
HOST="\h"

# Attempt to display different prompt if on local server
if [ "$HOSTNAME" == "Sams-MacBook-Pro.local" ]; then
    HOSTCOLOR=$txtpur
    HOST="local"
elif [[ "$HOSTNAME" == *"staging"* ]]; then
    HOST_BK=$bakylw
    CURSOR_BK=$bakylw
    CURSOR=$txtblk
elif [[ "$HOSTNAME" == *"prod"* ]]; then
    HOST_BK=$bakred
    HOSTCOLOR=$txtylw
    CURSOR_BK=$bakred
    CURSOR=$txtylw

fi



export PS1="$txtcyn[$txtblu\u$txtcyn@$txtrst$HOSTCOLOR$HOST_BK$HOST$txtrst$txtylw:\w$txtcyn] $CURSOR$CURSOR_BK>$txtrst "
PS1_SRC="$txtcyn[$txtblu\u$txtcyn@$txtylw\w$txtcyn] $txtgrn>$txtrst "

## setup env
# shell
export SAM_HOME="/Users/wyattsam"

export PACKAGE="$SAM_HOME/package"
export CODE_HOME="$SAM_HOME/programs"

# env - dev 
export DEV_HOME="$SAM_HOME/projects"

# env - dev - planet mongodb
export PLANET_HOME="$DEV_HOME/planetmongo"

# env - dev - django planet mongodb
export DJANGO_HOME="$DEV_HOME/djangoplanet"

# env - dev - tengen jira plugin
export JIRA_PLUGIN_HOME="$DEV_HOME/tengen-jira-plugin"

# env - dev - portaltype
export PORTAL_HOME="$DEV_HOME/portaltype"

# env - dev - corp
export CORP_HOME="$DEV_HOME/corp"

# program - MongoDB
#export MONGOHOME="$PACKAGE/mongo"
#export MONGOPATH="$MONGOHOME/bin"

# program - Google go
export GOPATH="$SAM_HOME/programs/go"
export GOROOT="/usr/local/go"

# program - MacVim
export MACVIMPATH="/Applications/MacVim.app/Contents/MacOS"

# PIP fixes - fixes issues with pip & cpp installation
#export CFLAGS="$CFLAGS -Qunused-arguments"
#export CPPFLAGS="$CPPFLAGS -Qunused-arguments"
#export ARCHFLAGS="$ARCHFLAGS -Wno-error=unused-command-line-argument-hard-error-in-future"

# Add vars to system path
PATH=$PATH:$MONGOPATH:$MACVIMPATH

# Add opt/local/bin (Midnight Commander / mc) 
PATH="$PATH:/opt/local/bin"

# Add home exes
PATH="$PATH:~/bin"

## Export path to shell
export PATH


## Aliases

# Common aliases
alias c='cdl'
alias lsf='ls'
alias ll='ls -ltra'
alias l='ls -ltra'
alias vimbash='vim ~/.bashrc'
alias vb='vim ~/.bashrc'
alias vimvim='vim ~/.vimrc'
alias vv='vim ~/.vimrc'
alias h='history'
alias hg='history | grep'
alias pg='ps -afux | grep'
alias eg='env | grep'
alias a='alias'
alias ag='alias | grep'
alias e='$EDITOR '
alias g='grep'
alias bash_reload='source ~/.bashrc'
alias br='source ~/.bashrc'

# Django controls
alias dj_start='python manage.py runserver'
alias dj_shell='python manage.py shell'
alias dj_createproject="django-admin.py startproject"
alias dj_createapp="python manage.py startapp"

# Planet MongoDB controls
alias planet_start='python planet.py'
alias planet_sync='python planet.py -s'

# Navigation
alias codehome='cd $CODE_HOME'
alias dev='cd $DEV_HOME'
alias d='dev'
alias codepython='cd $CODE_HOME/python'
alias codego='cd $CODE_HOME/go'

# MacVim
alias mvim="$MACVIMPATH/MacVim"

# virtualenv aliases
alias vh="source venv/bin/activate"
alias vd="deactivate"
alias venv_create="virtualenv venv"
alias venv_here="source venv/bin/activate"

# Environment commands
alias v_planet='cd $PLANET_HOME; deactivate; venv_here'
alias v_django='cd $DJANGO_HOME; deactivate; venv_here'
alias v_jira='cd $JIRA_PLUGIN_HOME; deactivate; venv_here'
alias v_portal='cd $PORTAL_HOME; deactivate; venv_here'
alias v_corp='cd $CORP_HOME; deactivate; venv_here'

# Dev shortcuts
alias dev_django='v_django; cd planetmongo'

# Git shortcuts
alias gc='git commit'
alias gp='git push'
alias gs='git status'

# Pip aliases
alias p='pip'
alias pi='pip install'
alias pf='pip freeze'
alias pr='pip install -r requirements.txt'

# Mongo aliases
alias m='mongo'

# Server aliases
alias ssh_stg_ow='ssh orgwww-staging-1.vpc3.10gen.cc'
alias synched_ssh_stg_ow="synched_ssh orgwww-staging-1.vpc3.10gen.cc"
alias ssh_stg_corp='ssh corp-staging-1.10gen.cc'
alias synched_ssh_stg_corp='synched_ssh corp-staging-1.10gen.cc'

# Fab commands
alias fab_stage='fab -R staging'
alias fab_planet_stage='fab -R staging deploy:rewrite/django'

# lessc commands
export MONGOSTRAP_HOME="$SAM_HOME/resources/mongostrap"
alias ms_build='build_mongostrap'
## Set the default editor to MacVim
export EDITOR="vim"

## Remote commands
alias ec2_home='cd /opt/10gen'

timestamp() {
    date "+%Y%m%d%H%M%S"
}

build_mongostrap() {
    infile="$MONGOSTRAP_HOME/less/bootstrap.less"
    outfile="$MONGOSTRAP_HOME/build/mongostrap.css."`timestamp`
    echo "Building $outfile with lessc"
    lessc $infile > $outfile
    echo "Copying the new file to django css dir ..."
    cp $outfile $DJANGO_HOME/planetmongo/planet/static/planet/mongostrap/css/mongostrap.css
    echo "Done"
}

cdl() {
    cd "$1"
    ll
}
