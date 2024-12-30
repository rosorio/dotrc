HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v

PROMPT="%n@%m:%~ %#"

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

## Poudriere aliases
function alias_poudriere {
    aname=$1
    jail=$2
    alias testport${aname}='screen sudo poudriere testport -j '${jail}' '${POUDRIERE_TEST_OPTIONS}' `pwd | cut -d"/" -f 4-5`'
    alias bulkport${aname}='screen sudo poudriere bulk -j '${jail}' '${POUDRIERE_BULK_OPTIONS}' `pwd | cut -d"/" -f 4-5`'
    alias itestport${aname}='screen sudo poudriere testport -j '${jail}' '${POUDRIERE_TEST_OPTIONS}' -i `pwd | cut -d"/" -f 4-5`'
    alias ibulkport${aname}='screen sudo poudriere bulk -j '${jail}' '${POUDRIERE_BULK_OPTIONS}' -i `pwd | cut -d"/" -f 4-5`'
}

POUDRIERE_BULK_OPTIONS='-p head -N -C '
POUDRIERE_TEST_OPTIONS='-p head -N '
PJAIL_14amd=1402amd64

alias_poudriere 14amd64 $PJAIL_14amd

alias testport=testport14amd64
alias bulkport=bulkport14amd64
alias itestport=itestport14amd64
alias ibulkport=ibulkport14amd64
