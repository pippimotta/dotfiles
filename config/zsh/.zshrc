# ~/.config/zsh/.zshrc
# Loaded for interactive shells. ZDOTDIR is set in ~/.zshenv.
#
# Drop-in config lives in conf.d/ and is sourced in filename order.
# Add new settings as their own NN-name.zsh file there.

for _conf in "$ZDOTDIR"/conf.d/*.zsh(N); do
  source "$_conf"
done
unset _conf
