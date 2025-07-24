# set up plugins
# ------------------------------------------------------------------------------

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# starship prompt
# ------------------------------------------------------------------------------
if type starship &>/dev/null; then
  eval "$(starship init zsh)"
else
  echo ERROR: Could not load starship.
fi


# eza (better `ls`)
# ------------------------------------------------------------------------------
if type eza &>/dev/null; then
  alias l="eza --icons=always"
  alias ls="eza --icons=always"
  alias ll="eza -lg --icons=always"
  alias la="eza -lag --icons=always"
  alias lt="eza -lTg --icons=always"
else
  echo ERROR: eza could not be found. Skip setting up eza aliases.
fi
