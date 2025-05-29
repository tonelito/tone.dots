if status is-interactive
    # Commands to run in interactive sessions can go here
    # Install Fisher if not installed
    if not functions -q fisher
        curl -sL https://git.io/fisher | source
        fisher install jorgebucaran/fisher
    end
end

if test (uname) = Darwin
    # macOS Intel
    # set BREW_BIN /usr/local/bin/brew 
    # macOS Silicon
    set BREW_BIN /opt/homebrew/bin/brew
else
    # Linux
    set BREW_BIN /home/linuxbrew/.linuxbrew/bin/brew
end

eval ($BREW_BIN shellenv)

# set tmux session with your name
if not set -q TMUX
    set SESSION_NAME tone
    if tmux has-session -t $SESSION_NAME 2>/dev/null
        tmux attach-session -t $SESSION_NAME
    else
        tmux new-session -s $SESSION_NAME
    end
end

# shell enhancements
starship init fish | source
zoxide init fish | source
atuin init fish | source
fzf --fish | source

set -x PATH $HOME/.cargo/bin $PATH
set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'

if not test -d ~/.config/fish/completions
    mkdir -p ~/.config/fish/completions
end

if not test -f ~/.config/fish/completions/.initialized
    if not test -d ~/.config/fish/completions
        mkdir -p ~/.config/fish/completions
    end
    carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish
    touch ~/.config/fish/completions/.initialized
end

carapace _carapace | source

# colors
set -x LS_COLORS "di=38;5;67:ow=48;5;60:ex=38;5;132:ln=38;5;144:*.tar=38;5;180:*.zip=38;5;180:*.jpg=38;5;175:*.png=38;5;175:*.mp3=38;5;175:*.wav=38;5;175:*.txt=38;5;223:*.sh=38;5;132"

# greeting message
set -g fish_greeting ""

# aliases
if test (uname) = Darwin
    alias ls='ls --color=auto'
else
    alias ls='gls --color=auto'
end

alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim (fzf --preview="bat --theme=gruvbox-dark --color=always {}")'

# Kanagawa Fish shell theme
# A template was taken and modified from Tokyonight:
# https://github.com/folke/tokyonight.nvim/blob/main/extras/fish_tokyonight_night.fish
set -l foreground DCD7BA normal
set -l selection 2D4F67 brcyan
set -l comment 727169 brblack
set -l red C34043 red
set -l orange FF9E64 brred
set -l yellow C0A36E yellow
set -l green 76946A green
set -l purple 957FB8 magenta
set -l cyan 7AA89F cyan
set -l pink D27E99 brmagenta

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

clear
