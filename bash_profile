source ~/.bashrc

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


$(boot2docker shellinit 2> /dev/null)

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"
