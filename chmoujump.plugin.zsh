#!/usr/bin/env zsh
#
# Based on https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh
# (MIT licensed, as of 2016-05-05).

CHMOUJUMP_SCRIPT_PATH=

source ${0:a:h}/chmoujump

__chmoujump() {
    { chmoujump -A ; chmoujump -n } | while read item; do
        printf '%q ' "$item"
    done
    echo
}

chmoujump-dir-widget() {
    local shouldAccept=$(should-accept-line)
    LBUFFER="${LBUFFER}$(__chmoujump)"
    local ret=$?
    zle redisplay
    typeset -f zle-line-init >/dev/null && zle zle-line-init
    if [[ $ret -eq 0 && -n "$BUFFER" && -n "$shouldAccept" ]]; then
        zle .accept-line
    fi
    return $ret
}

# Accept the line if the buffer was empty before invoking the file widget, and
# the `auto_cd` option is set.
should-accept-line() {
    if [[ ${#${(z)BUFFER}} -eq 0 && -o auto_cd ]]; then
        echo "true";
    fi
}

zle -N chmoujump-dir-widget
bindkey -M viins -r '^G'
bindkey -M vicmd -r '^G'
bindkey -M emacs -r '^G'

bindkey -M viins '^G' chmoujump-dir-widget
bindkey -M vicmd '^G' chmoujump-dir-widget
bindkey -M emacs '^G' chmoujump-dir-widget
