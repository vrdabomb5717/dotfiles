PS1="\[$(tput bold)\]\[$(tput setaf 6)\]\d \@ \[$(tput setaf 3)\]\W \[$(tput sgr0)\]\$ "
#PS1="\W \$ "
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export GREP_OPTIONS='--color=auto'

export GDFONTPATH=/Library/Fonts
export HISTSIZE=50000
export HISTCONTROL=ignoredups
export EDITOR=emacs

# bash-completion
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    . $(brew --prefix)/share/bash-completion/bash_completion
fi

if [ -d ~/.bash.completion.d ]; then
    for f in ~/.bash.completion.d/*; do
        . $f
    done
    unset f
fi

#export CC="/opt/local/bin/gcc-mp-4.6"
#export CFLAGS="-O2 -arch x86_64 -Wall -W"
#export FC="gfortran -arch x86_64"
######################################################################################

# set bash aliases

alias ccl='ccl64'
alias lisp='ccl64'

alias ts="date +%s"
alias quit="exit"
alias q="exit"
alias histgrep="history | grep"
alias sl=ls
alias mkcd='_(){ mkdir $1; cd $1; }; _'
alias edit=$EDITOR
alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../..'
alias grep="grep --color=auto"
alias less="less -MR"

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -A -l'
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'
alias rm='trash'           # stop using rm; move all deleted files to the trash to be recovered later

# alias hub to git
eval "$(hub alias -s)"

pipu() {
    pip install -U `yolk -U | awk '{print $1}' | uniq`
}

pip3u() {
    pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip3 install -U
}

alias ipython='ipython --pylab'
alias isympy='/usr/local/share/python/isympy'
alias ipython3='ipython3 --pylab'
alias sml='rlwrap sml'
alias ocaml='rlwrap ocaml'
alias java_home='/usr/libexec/java_home'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
################################################################################

# set bash 4.0 settings

shopt -s autocd
shopt -s cdable_vars cdspell
shopt -s dirspell
shopt -s checkhash
shopt -s cmdhist
shopt -s checkwinsize
shopt -s histappend
shopt -s histreedit
shopt -s histverify
shopt -s extglob
shopt -s globstar
shopt -s execfail
shopt -s hostcomplete
shopt -s no_empty_cmd_completion
set -o ignoreeof

########################################################################################

# Set various paths

export NODE_PATH=/usr/local/lib/node:$NODE_PATH

#export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
export PYTHONPATH="/Users/Varun/Documents/Computer Science/STAT W4249 Applied Data Science/:$PYTHONPATH"
export PYTHONPATH="/Users/Varun/Documents/Computer Science/APMA E4990 Computational social science/Final Project/CSS_Final_Project"

export PATH=/usr/local/Cellar/smlnj/110.75/libexec/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/Users/Varun/.start

# make sure to export Python 3 scripts before Python 2.7 so the 2.7 versions are found first
export PATH=/usr/local/share/python3:$PATH
export PATH=/usr/local/share/python:$PATH
eval "`pip completion --bash`"

export RBENV_ROOT=/usr/local/opt/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
source "`brew --prefix`/etc/grc.bashrc"

export PERLBREW_ROOT=/usr/local/perl5/perlbrew
if [[ -z "$PERL5LIB" ]]; then export PERL5LIB=""; fi
source ${PERLBREW_ROOT}/etc/bashrc # and no warning
export PATH=/usr/local/perl5/perlbrew/bin:$PATH

export PATH=/Developer/NVIDIA/CUDA-5.0/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-5.0/lib:$DYLD_LIBRARY_PATH

export RLWRAP_HOME="$HOME/.rlwrap"

#export HADOOP_HOME=/usr/local/Cellar/hadoop/1.1.1/libexec
export JAVA_HOME=`java_home`
#export BOOST_PYTHON=boost_python-mt

#export FCFLAGS='-Os -w -pipe   -mmacosx-version-min=10.8 -march=core2 -msse4'

######################################################################

# create useful functions

body() {
    IFS= read -r header
    printf '%s\n' "$header"
    "$@"
}
export -f body

# Don't replace ~ by $HOME when doing shell expansion
_expand_tilde_by_ref()
{
    return 0;
}

function gi()
{
    curl http://gitignore.io/api/$@ ;
}
