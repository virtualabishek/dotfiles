# dotfiles

My Arch Linux setup: [Niri](https://github.com/YaLTeR/niri) + [Noctalia](https://github.com/NoctaliaDE/noctalia) — scrollable tiling meets COSMIC shell. Managed with [GNU Stow](https://www.gnu.org/software/stow/).

---

## What's Inside

```
.
├── fish/          # Fish shell config, functions & completions
├── fontconfig/    # JetBrainsMono Nerd Font as default monospace
├── gtk/           # GTK3 theme
├── kitty/         # Kitty terminal (default, centered 1200x700 via Niri)
├── niri/          # Niri window manager config (KDL)
├── noctalia/      # Noctalia compositor/shell config
└── nvim/          # Neovim config (LazyVim-based)
```

### Theme That Follows You

Noctalia handles theming globally — set it once in the Noctalia control center and it pushes Tokyo-Night (with Gruvbox accents) into niri, kitty, GTK, and everything else automatically. Pick a wallpaper there too. I don't manually sync theme files; Noctalia does that.

### Fish Shell

Aliases I actually use: `c` for opencode, `f` for fastfetch. `tdl c` / `tdl a` for kitty dev layout (nvim + opencode/agy). Copilot and Grok completions baked in.

### Neovim

LazyVim-based. Clean, fast, gets out of your way.

---

## Getting Started

```bash
sudo pacman -S niri kitty fish neovim gnu-stow fontconfig
yay -S noctalia

git clone https://github.com/virtualabishek/dotfiles.git ~/dotfiles
cd ~/dotfiles

stow fish niri noctalia kitty gtk fontconfig nvim
```

This symlinks everything into `~/.config/`. Changed your mind? `stow --delete <package>` undoes it.

---

## Keybinds

### Niri (Mod = Super)

| Key | Action |
|---|---|
| `Mod + Return` | Open kitty terminal (centered floating) |
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
| `Mod + Ctrl + T` | btop (in kitty) |
| `Mod + E` | Nautilus file manager (floating 800x600) |
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

### Fish Shell Aliases

| Command | Action |
|---|---|
| `c` | opencode |
| `f` | fastfetch |
| `tdl c` | Kitty dev layout: top 80% [nvim 70% \| opencode 30%] + bottom 20% [term 50% \| term 50%] |
| `tdl a` | Kitty dev layout with `agy` (antigravity) |

### Kitty Terminal (default)

Scalable text: `Ctrl+Shift + = / -` to zoom, `Ctrl+Shift+0` reset. Font `JetBrainsMono Nerd Font 9.2` — stowed at `kitty/.config/kitty/kitty.conf`.

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
