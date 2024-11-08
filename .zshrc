if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export PATH=/home/vansh/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export XDG_SCREENSHOTS_DIR=~/screenshots 

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

run() {
    g++ "$1/a.cpp" -o "$1/a" &&
        "$1/a" < "$1/input.txt" > "$1/res.txt" &&
        diff "-B" "-Z" "$1/res.txt" "$1/output.txt";
        cat "$1/res.txt" &&
        echo -e "\n" &&
        cat "$1/output.txt"
}
