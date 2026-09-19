function tdl
    set -l ai "n"
    if test (count $argv) -ge 1
        set ai $argv[1]
    end

    set -l ai_cmd "opencode"
    switch "$ai"
        case c
            set ai_cmd "opencode"
        case a agy antigravity
            set ai_cmd "agy"
        case n nvim novim noai
            set ai_cmd "none"
        case '*'
            echo "Usage: tdl <mode>"
            echo "  (none) - nvim only, no AI (default)"
            echo "  c  - opencode"
            echo "  a  - antigravity (agy)"
            echo "  n  - nvim only, no AI"
            return 1
    end

    # --- Kitty — nvim-only: top 80% nvim (full width), bottom 20% [ term 50% | term 50% ] ---
    if test "$ai_cmd" = "none"
        if test -n "$KITTY_WINDOW_ID"
            kitty @ goto-layout splits 2>/dev/null

            # 1) Bottom terminal (hsplit = top/bottom) 20% height — capture its id
            set -l bottom_id (kitty @ launch --type=window --cwd=current --location=hsplit --bias=20 2>/dev/null)
            # keep focus on original nvim window after creating bottom
            kitty @ focus-window --match id:$KITTY_WINDOW_ID 2>/dev/null

            # 2) Split bottom into 50/50 (two terminals) — vsplit = left/right
            if test -n "$bottom_id"
                kitty @ focus-window --match id:$bottom_id 2>/dev/null
                kitty @ launch --type=window --cwd=current --location=vsplit --bias=50 2>/dev/null
                # back to nvim
                kitty @ focus-window --match id:$KITTY_WINDOW_ID 2>/dev/null
            end

            # 3) nvim in original top pane (full width)
            kitty @ send-text --match id:$KITTY_WINDOW_ID "nvim .\r" 2>/dev/null
            return 0
        end

        echo "tdl: must be run inside kitty (Mod+Return). Launching kitty..."
        kitty -e fish -c "tdl n" 2>/dev/null &
        return 0
    end

    # --- Kitty — 4 panes: top 80% [ nvim 70% | ai 30% ], bottom 20% [ term 50% | term 50% ] ---
    if test -n "$KITTY_WINDOW_ID"
        kitty @ goto-layout splits 2>/dev/null

        # 1) Bottom terminal (hsplit = top/bottom) 20% height — capture its id
        set -l bottom_id (kitty @ launch --type=window --cwd=current --location=hsplit --bias=20 2>/dev/null)
        # keep focus on original nvim window after creating bottom
        kitty @ focus-window --match id:$KITTY_WINDOW_ID 2>/dev/null

        # 2) AI on right of top (vsplit = left/right) 30% of top width
        if test "$ai_cmd" = "agy"
            kitty @ launch --type=window --cwd=current --location=vsplit --bias=30 --keep-focus -- agy 2>/dev/null
        else
            kitty @ launch --type=window --cwd=current --location=vsplit --bias=30 --keep-focus -- opencode 2>/dev/null
        end

        # 3) Split bottom into 50/50 (two terminals) — vsplit = left/right
        if test -n "$bottom_id"
            kitty @ focus-window --match id:$bottom_id 2>/dev/null
            kitty @ launch --type=window --cwd=current --location=vsplit --bias=50 2>/dev/null
            # back to nvim
            kitty @ focus-window --match id:$KITTY_WINDOW_ID 2>/dev/null
        end

        # 4) nvim in original left pane (70% top)
        kitty @ send-text --match id:$KITTY_WINDOW_ID "nvim .\r" 2>/dev/null
        return 0
    end

    echo "tdl: must be run inside kitty (Mod+Return). Launching kitty..."
    if test "$ai_cmd" = "agy"
        kitty -e fish -c "tdl a" 2>/dev/null &
    else
        kitty -e fish -c "tdl c" 2>/dev/null &
    end
end
