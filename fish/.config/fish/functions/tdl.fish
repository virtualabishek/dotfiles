function tdl
  switch "$argv[1]"
    case c
      tmux rename-window code
      set editor_pane $TMUX_PANE
      tmux split-window -v -p 20
      tmux select-pane -t $editor_pane
      set ai_pane (tmux split-window -h -p 30 -P -F '#{pane_id}')
      tmux send-keys -t $ai_pane 'opencode' Enter
      tmux send-keys -t $editor_pane 'nvim .' Enter
      tmux select-pane -t $editor_pane
    case '*'
      echo "Usage: tdl <ai>"
      echo "  c  - opencode"
  end
end
