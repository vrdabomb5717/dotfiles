PS1="\[$(tput bold)\]\[$(tput setaf 6)\]\d \@ \[$(tput setaf 3)\]\W \[$(tput sgr0)\]\$ "
#PS1="\W \$ "
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

export HISTSIZE=50000
export HISTCONTROL=ignoredups

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
#export FCFLAGS='-Os -w -pipe   -mmacosx-version-min=10.8 -march=core2 -msse4'
######################################################################################

# set bash aliases

if [ -f ~/.aliases ]; then
   source ~/.aliases
fi

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

if [ -f ~/.env ]; then
   source ~/.env
fi

eval "`pip completion --bash`"

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
