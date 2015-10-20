# bash
[[ -z "$PS1" ]] && return 0

_awsmeta() {
  # :で引数が分割されないようにする（）
  COMP_WORDBREAKS=${COMP_WORDBREAKS//:/}
  # COMP系変数をパースする
  local cur prev words cword
  _get_comp_words_by_ref cur prev words cword
  # curからCOMPREPLYを作る
  COMPREPLY=()
  local path=$(perl -pe's/[^\/]+?$//'<<<"$cur")
  local basename=${cur##*/}
  local f
  while read f; do
    [[ $f == $basename* ]] && COMPREPLY+=("$path$f")
  done < <(awsmeta "$path")
  # 確定候補が/終わりなら次の補完を継続できるように空白挿入を抑止する
  [[ ${#COMPREPLY[@]} == 1 && $COMPREPLY =~ /$ ]] && compopt -o nospace
  # メニュー補完の場合はパス部分を除いたリストで表示する
  if [[ $COMP_TYPE == 63 ]]; then
    local i
    for ((i = 0; i < ${#COMPREPLY[@]}; i++)); do
      COMPREPLY[$i]="${COMPREPLY[i]:${#path}}"
    done
  fi
}

complete -F _awsmeta awsmeta
