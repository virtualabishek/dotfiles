if status is-interactive
    set -gx BUN_INSTALL $HOME/.bun
    fish_add_path $BUN_INSTALL/bin

    set -g fish_greeting

    alias t tmux
    alias c opencode
    alias f fastfetch

    zoxide init fish --cmd cd | source
end


# Added by Antigravity CLI installer
set -gx PATH "/home/abi/.local/bin" $PATH

# >>> grok installer >>>
fish_add_path $HOME/.grok/bin
# <<< grok installer <<<

# pnpm
set -gx PNPM_HOME "/home/abi/.local/share/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
  set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end
