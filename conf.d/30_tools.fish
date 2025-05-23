# Tool Configurations (FZF, Yarn, fnm, direnv)

# fzf - Fuzzy finder settings
set -gx FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS '
--height=50% --min-height=15 --reverse
--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#2E3440,hl+:#A3BE8C
--color pointer:#B48DAC,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#a3be8b
'
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# Yarn global settings (related to fnm)
set -gx YARN_GLOBAL_FOLDER $FNM_MULTISHELL_PATH/yarn-global
set -gx YARN_PREFIX $FNM_MULTISHELL_PATH

# fnm - Fast Node Manager
if type -q fnm
  fnm env | source
end

# direnv - Environment switcher
if type -q direnv
  direnv hook fish | source
end

