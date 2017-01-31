export PS1='\[\e[32m\]\u@\h:\W\$\[\e[0m\] '
if [ $TERM == 'screen' ]; then
    export PROMPT_COMMAND='echo -ne "\033k\033\0134\033k$(basename $(pwd))\033\\"'
fi
