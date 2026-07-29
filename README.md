# dotfiles

My Arch Linux setup: [Niri](https://github.com/YaLTeR/niri) + [Noctalia](https://github.com/NoctaliaDE/noctalia) — scrollable tiling meets COSMIC shell. Managed with [GNU Stow](https://www.gnu.org/software/stow/).

---

## What's Inside

```
.
├── fish/          # Fish shell config, functions & completions
├── fontconfig/    # JetBrainsMono Nerd Font as default monospace
├── foot/          # Foot terminal emulator
├── gtk/           # GTK3 theme
├── niri/          # Niri window manager config (KDL)
├── noctalia/      # Noctalia compositor/shell config
├── nvim/          # Neovim config (LazyVim-based)
└── tmux/          # Tmux config with vi-mode keybinds
```

### Theme That Follows You

Noctalia handles theming globally — set it once in the Noctalia control center and it pushes Tokyo-Night (with Gruvbox accents) into niri, foot, GTK, and everything else automatically. Pick a wallpaper there too. I don't manually sync theme files; Noctalia does that.

### Fish Shell

Aliases I actually use: `t` for tmux, `c` for opencode, `f` for fastfetch. Copilot and Grok completions baked in.

### Tmux

Prefix is `Ctrl+Space`. The `D` keybind spins up my daily driver: nvim + opencode + terminal in a three-pane layout.

### Neovim

LazyVim-based. Clean, fast, gets out of your way.

---

## Getting Started

```bash
sudo pacman -S niri foot fish tmux neovim gnu-stow fontconfig
yay -S noctalia

git clone https://github.com/virtualabishek/dotfiles.git ~/dotfiles
cd ~/dotfiles

stow fish niri noctalia foot tmux gtk fontconfig nvim
```

This symlinks everything into `~/.config/`. Changed your mind? `stow --delete <package>` undoes it.

---

## Keybinds

### Niri (Mod = Super)

| Key | Action |
|---|---|
| `Mod + Return` | Open foot terminal |
| `Mod + Q` | Close window |
| `Mod + F` | Maximize column |
| `Mod + Shift + F` | Fullscreen |
| `Mod + M` | Maximize window to edges |
| `Mod + Ctrl + F` | Expand column to available width |
| `Mod + C` | Center column |
| `Mod + Shift + C` | Center all columns |
| `Mod + V` | Toggle floating |
| `Mod + Shift + V` | Focus toggle (floating/tiling) |
| `Mod + W` | Toggle column tabbed display |
| `Mod + R` / `Mod + Shift + R` | Cycle column width |
| `Mod + Ctrl + Shift + R` | Cycle window height |
| `Mod + Ctrl + R` | Reset window height |
| `Mod + -` / `Mod + =` | Column width ±10% |
| `Mod + Shift + -` / `Mod + Shift + =` | Window height ±10% |
| `Mod + [` / `Mod + ]` | Consume/expel window left/right |
| `Mod + ,` / `Mod + .` | Consume / expel window |
| `Mod + B` | Zen Browser |
| `Mod + Ctrl + B` | Brave Browser |
| `Mod + Ctrl + T` | btop (in foot) |
| `Mod + E` | Thunar file manager |
| `Mod + Space` | Noctalia launcher |
| `Mod + Shift + L` | Lock screen |
| `Mod + Shift + T` | Toggle Noctalia bar |
| `Mod + Escape` | Noctalia session panel |
| `Mod + Ctrl + Space` | Noctalia control center |
| `Mod + Ctrl + Tab` | Noctalia window switcher |
| `Mod + Alt + Space` | Noctalia settings |
| `Mod + Ctrl + C` | Noctalia clipboard |
| `Mod + O` | Toggle overview |
| `Mod + Shift + P` | Power off monitors |
| `Mod + H / J / K / L` | Focus: left/down/up/right |
| `Mod + Ctrl + H / J / K / L` | Move window: left/down/up/right |
| `Mod + Shift + H / J / K` | Focus monitor: left/down/up |
| `Mod + Shift + Ctrl + H / J / K / L` | Move column to monitor |
| `Mod + Left / Right / Up / Down` | Focus direction |
| `Mod + Home` / `Mod + End` | Focus first/last column |
| `Mod + Page_Down(U)` / `Mod + Page_Up(I)` | Focus workspace down/up |
| `Mod + 1-9` | Switch to workspace |
| `Mod + Shift + 1-9` | Move window to workspace |
| `Mod + Ctrl + 1-9` | Move column to workspace |
| `Mod + Shift + Page_Down(U)` / `Mod + Page_Up(I)` | Move workspace down/up |
| `Mod + Ctrl + Page_Down(U)` / `Mod + Page_Up(I)` | Move column to workspace |
| `Mod + Shift + /` | Show hotkey overlay |
| `Mod + Wheel Down/Up` | Focus workspace |
| `Mod + Ctrl + Wheel Down/Up` | Move column to workspace |
| `Mod + Wheel Left/Right` | Focus column |
| `Mod + Ctrl + Wheel Left/Right` | Move column |
| `Print` | Screenshot region |
| `Ctrl + Print` | Screenshot full screen |
| `Alt + Print` | Screenshot focused window |
| `XF86AudioRaiseVolume / LowerVolume / Mute` | Volume control |
| `XF86AudioMicMute` | Mute microphone |
| `XF86Audio Play / Stop / Prev / Next` | Media control |
| `XF86MonBrightnessUp / Down` | Brightness ±10% |
| `Ctrl + Alt + Del` | Quit niri |
| `Ctrl + Escape` | Toggle keyboard inhibit |

### Tmux (Prefix = Ctrl+Space)

| Key | Action |
|---|---|
| `Prefix + q` | Reload config |
| `Prefix + h` | Split pane vertical |
| `Prefix + v` | Split pane horizontal |
| `Prefix + x` | Kill pane |
| `Prefix + r` | Rename window |
| `Prefix + c` | New window |
| `Prefix + k` | Kill window |
| `Prefix + R` | Rename session |
| `Prefix + C` | New session |
| `Prefix + K` | Kill session |
| `Prefix + P / N` | Previous/next session |
| `Prefix + D` | 3-pane dev layout (nvim + opencode + terminal) |
| `Prefix + C-Space` | Send prefix |
| `Alt + Enter` | Split pane vertical |
| `Alt + Shift + Enter` | Split pane horizontal |
| `Alt + Escape` | Kill pane |
| `Ctrl + Alt + Arrow` | Navigate panes |
| `Ctrl + Alt + Shift + Arrow` | Resize pane |
| `Alt + 1-9` | Switch window |
| `Alt + Left / Right` | Previous/next window |
| `Alt + Shift + Left / Right` | Swap window |
| `Alt + Up / Down` | Previous/next session |
| _Copy mode (vi):_ | |
| `v` (in copy-mode-vi) | Begin selection |
| `y` (in copy-mode-vi) | Copy selection |

### Fish Shell Aliases

| Command | Action |
|---|---|
| `t` | tmux |
| `c` | opencode |
| `f` | fastfetch |
| `tdl` | Terminal dev layout (3-pane tmux) |

### Foot Terminal

| Key | Action |
|---|---|
| `Ctrl + Shift + C` / `Ctrl + Insert` | Copy |
| `Ctrl + Shift + V` / `Shift + Insert` | Paste |

---

## Adding Your Own

Each component is a Stow package:

```bash
mkdir -p ~/dotfiles/newapp/.config/newapp
cp -r ~/.config/newapp/* ~/dotfiles/newapp/.config/newapp/
stow newapp
```
