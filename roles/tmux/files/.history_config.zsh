if [[ -n $TMUX ]]; then
  setopt APPEND_HISTORY
  setopt SHARE_HISTORY
  setopt INC_APPEND_HISTORY
  setopt EXTENDED_HISTORY
  
  export HISTFILE_LOCAL="$HOME/.zsh_history.$(tmux display-message -p '#{pane_id}')"
  export HISTFILE_GLOBAL="$HOME/.zsh_history"
  
  function save_history_to_both() {
    print -sr -- "${1%%$'\n'}" >> "$HISTFILE_LOCAL"
    print -sr -- "${1%%$'\n'}" >> "$HISTFILE_GLOBAL"
  }
  
  function my_accept_line() {
    save_history_to_both "$BUFFER"
    zle .accept-line
  }
  zle -N accept-line my_accept_line
  
  function search_history() {
    if [[ -f "$HISTFILE_LOCAL" ]]; then
      fc -R "$HISTFILE_LOCAL"
    fi
    fc -R "$HISTFILE_GLOBAL"
    zle history-beginning-search-backward
  }
  zle -N search_history
fi
