# Java 17 for Android/Gradle (Expo RN 0.86 requires JDK 17)
set -gx JAVA_HOME /usr/lib/jvm/java-17-openjdk
fish_add_path $JAVA_HOME/bin

# Android SDK (mirrors ~/.bashrc so `expo run:android` works in fish too)
set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx ANDROID_SDK_ROOT $HOME/Android/Sdk
fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin $ANDROID_HOME/platform-tools $ANDROID_HOME/emulator

if status is-interactive
    set -gx BUN_INSTALL $HOME/.bun
    fish_add_path $BUN_INSTALL/bin

    set -g fish_greeting

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

# kimi-code
fish_add_path -g "/home/abi/.kimi-code/bin"
fnm env --use-on-cd | source
set -x LIBVIRT_DEFAULT_URI "qemu:///system"

# opencode
fish_add_path /home/abi/.opencode/bin
