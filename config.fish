# Silence login messages
stty -echo

# Clear greeting message
set fish_greeting ""

# Source non-conf.d configurations

# Custom utility functions
if test -f "$HOME/.config/fish/functions/utils.fish"
    source "$HOME/.config/fish/functions/utils.fish"
end

# Source local secrets if the file exists
if test -f "$HOME/.config/fish/secrets.fish"
    source "$HOME/.config/fish/secrets.fish"
end

# Set theme interactively
if status is-interactive
  fish_config theme choose Nordic
end

# Restore terminal echo
stty echo
