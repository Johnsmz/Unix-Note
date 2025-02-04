alias v='vim'
alias l='ls'
alias a='cat'
alias d='cd'
alias rm='rm -r'
alias cp='cp -r'
alias r='rm'
alias t='date'
alias lt='tree -L 1'
alias rag='ranger'

function vpn () {
    if (($#==0)); then
        printf "vpn: "
        if [[ $http_proxy == "" ]]; then
            printf "\033[0;31moff\033[0m\n"
        else
            printf "\033[0;32mon\033[0m\n"
        fi
    elif (($#>1)); then
        echo "[vpn] unrecognised command $1"
    elif [[ $1 == "on" ]]; then
        export http_proxy=http://127.0.0.1:7890
        export https_proxy=http://127.0.0.1:7890
        export all_proxy=socks://127.0.0.1:7891
        printf "vpn: "
        if [[ $http_proxy == "" ]]; then
            printf "\033[0;31moff\033[0m\n"
        else
            printf "\033[0;32mon\033[0m\n"
        fi
    elif [[ $1 == "off" ]]; then
        export http_proxy=
        export https_proxy=
        export all_proxy=
        printf "vpn: "
        if [[ $http_proxy == "" ]]; then
            printf "\033[0;31moff\033[0m\n"
        else
            printf "\033[0;32mon\033[0m\n"
        fi
    elif [[ $1 == "status" ]]; then
        printf "vpn: "
        if [[ $http_proxy == "" ]]; then
            printf "\033[0;31moff\033[0m\n"
        else
            printf "\033[0;32mon\033[0m\n"
        fi
    else
        echo "[vpn] unrecognised command $1"
    fi
}
