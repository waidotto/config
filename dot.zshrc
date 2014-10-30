export LANG=ja_JP.UTF-8

##補完機能
autoload -U compinit
compinit

##viライクキーバインド設定
bindkey -v

##色を使う
setopt prompt_subst
##補完候補一覧でファイルの種別をマーク表示
setopt list_types
##サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume
##補完候補を一覧表示
setopt auto_list
##直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
##cd時に自動でpush
setopt auto_pushd
##同じディレクトリをpushdしない
setopt pushd_ignore_dups
##Tabで順に補完候補を切り替える
setopt auto_menu
##--prefix=/usrなどの=以降も補完
setopt magic_equal_subst
##ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort
##補完候補のカーソル選択を有効に
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
##ディレクトリ名だけでcd
setopt auto_cd
##括弧の対応などを自動的に補完
setopt auto_param_keys
##ディレクトリ名の補完で末尾の/を自動的に付加し、次の補完に備える
setopt auto_param_slash
##ファイル名の展開でディレクトリにマッチした場合末尾に/を付加する
setopt mark_dirs
##補完候補を詰めて表示
setopt list_packed
##最後のスラッシュを自動的に削除しない
setopt noautoremoveslash

alias ls='ls -v -F --color=auto'

function chpwd() {
	if [ 150 -le $(ls | wc -l) ]; then
		ls | head -n 5
		echo '...'
		ls | tail -n 5
		echo "$(ls | wc -l) files exist"
	else
		ls -v -F
	fi
}

##右プロンプトの設定
RPROMPT="%{[36m%}[%~] %*%{[m%}"
##他のプロンプトの設定
PROMPT="%{[36m%}%n@%M%(1j,[%j],)%%%{[m%} "
PROMPT2="%{[36m%}%_%%%{[m%} "
SPROMPT="%{[36m%}%r is correct? [n,y,a,e]:%{[m%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"

export PATH=/usr/sbin/:$PATH
export PATH=/sbin/:$PATH
if [[ -d ~/nas ]]; then
	export PATH=/home/user01/nas/tools/:$PATH
fi

if [[ -e ~/.platex.sh ]]; then
	alias platex='source ~/.platex.sh'
fi

##大文字小文字を区別せずに補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

##タブ幅を4にする
tabs -4

##コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
##コマンド訂正
setopt correct

alias cp='cp -p'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export EDITOR=`which vim`

