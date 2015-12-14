#Note: The following code was shamelessly copied by me (Yuri Cheung)

#from http://blog.jadecell.org/wp/ 's excellent code , and was modified

#slightly by me to enable it to run on my Macbook Pro. All the bugs belong to me.

#-----copy begin-----

#enables color in the terminal bash shell

export CLICOLOR=1

#sets up the color scheme for list

export LSCOLORS=gxfxcxdxbxegedabagacad

#sets up the prompt color (currently a green similar to linux terminal)

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]-\[\033[00;32m\]`hostname -I`\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$'

#enables color for iTerm

export TERM=xterm-color

#sets up proper alias commands when called

alias ls='ls -G'

alias ll='ls -hl'

alias l='ls -hla'
##
# Your previous /Users/ruxsfi/.bash_profile file was backed up as /Users/ruxsfi/.bash_profile.macports-saved_2010-04-13_at_16:37:41
##

# MacPorts Installer addition on 2010-04-13_at_16:37:41: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

source $HOME/.rvm/scripts/rvm

##
# Your previous /Users/ruxsfi/.bash_profile file was backed up as /Users/ruxsfi/.bash_profile.macports-saved_2010-04-25_at_21:17:26
##

# MacPorts Installer addition on 2010-04-25_at_21:17:26: adding an appropriate PATH variable for use with MacPorts.
export PATH=/sbin:/Developer/usr/bin:/usr/local/sphinx/bin:/opt/local/bin:/opt/local/sbin:~/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

#This is for git autocompletion
# export BUNDLER_EDITOR='mate'

 source ~/git-completion.bash
 
alias gco='git co'
alias gci='git ci'
alias grb='git rb'

