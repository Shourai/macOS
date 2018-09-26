########## Syntax highlighting package from brew ##########

# ------------------------------------------------------------------------------
# - Syntax highlighting package                                                -
# ------------------------------------------------------------------------------
if [[ "$(uname)" = "Darwin" ]]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f /etc/debian_version ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f /etc/arch-release ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ------------------------------------------------------------------------------
# - Aliases                                                                    -
# ------------------------------------------------------------------------------

# Colorize output, add file type indicator, and put sizes in human readable format
if [[ "$(uname)" = "Darwin" ]]; then
    alias ls='ls -GFh'
    alias ll='ls -GFhl'
    alias la='ls -GFha'
else
    alias ls='ls -Fh --color=always'
    alias ll='ls -Fhl --color=always'
    alias la='ls -Fha --color=always'
fi
alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd..='cd ../'
alias /='cd /'
alias ~='cd ~'
alias cp='cp -iv'
alias mkdir='mkdir -pv'
alias emd='emacs --daemon'
#alias python='python3'
#alias pip='pip3'
alias vi='\vim'
alias vim='nvim'
alias zshrc='vim ~/.zshrc'
alias activate='source bin/activate'

## Github related
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcam='git commit -a -m'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gl='git pull'
alias gm='git merge'
alias gmom='git merge origin/master'
alias gp='git push'
alias gpv='git push -v'
alias gr='git remote'
alias gra='git remote add'
alias grv='git remote -v'
alias gsb='git status -sb'
alias gss='git status -s'
alias gst='git status'

## Virtualenv
alias venv="workon"
alias venv.exit="deactivate"
alias venv.ls="lsvirtualenv"
alias venv.show="showvirtualenv"
alias venv.init="mkvirtualenv"
alias venv.rm="rmvirtualenv"
alias venv.switch="workon"
alias venv.add="add2virtualenv"
alias venv.cd="cdproject"
alias venv.cdsp="cdsitepackages"
alias venv.cdenv="cdvirtualenv"
alias venv.lssp="lssitepackages"
alias venv.proj="mkproject"
alias venv.setproj="setvirtualenvproject"
alias venv.wipe="wipeenv"

# ------------------------------------------------------------------------------
# - General Configurations                                                     -
# ------------------------------------------------------------------------------
# If non-ambiguous, allow changing into a directory just by typing its name
# (ie, make "cd" optional)
setopt autocd

# Detect and prompt to correct typos in commands.
# Note there is a "correctall" variant which also prompts to correct arguments
# to commands, but this ends up being more troublesome than useful.
setopt correct
setopt correctall

# Disables the beep zsh would otherwise make when giving invalid input (such as
# hitting backspace on an command line).
setopt no_beep

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt append_history         # Allow multiple terminal sessions to all append to one zsh command history
setopt extended_history       # save timestamp of command and duration
setopt inc_append_history     # Add comamnds as they are typed, do not wait until shell exit
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_ignore_dups       # Do not write events to history that are duplicates of previous events
setopt hist_ignore_space      # remove command line from history list when first character on the line is a space
setopt hist_find_no_dups      # When searching history do not display results already cycled through twice
setopt hist_reduce_blanks     # Remove extra blanks from each command line being added to history
setopt hist_verify            # do not execute, just expand history
setopt share_history          # imports new commands and appends typed commands to history
setopt hist_ignore_all_dups   # Delete old recorded entry if new entry is a duplicate.
setopt hist_save_no_dups      # Do not write duplicate entries in the history file.

# Set editor
if [[ "$(uname)" = "Darwin" ]]; then
    export EDITOR=/usr/local/bin/nvim
elif [ -f /etc/debian_version ]; then
    export EDITOR=/usr/bin/nvim
elif [ -f /etc/arch-release ]; then
    export EDITOR=/usr/bin/nvim
fi

# ------------------------------------------------------------------------------
# - Custom functions                                                           -
# ------------------------------------------------------------------------------
mkcd() { mkdir -p "$@" && cd "$@"; }      # Create a directory and cd to it afterwards
emc() { command emacsclient -n -c -a '' "$@" & } # use `emc <file>` to open file in emacsclient, start daemon if not running
# emacs() { command emacs "$@" & }

# ------------------------------------------------------------------------------
# - Autocompletion settings                                                    -
# ------------------------------------------------------------------------------

# Use completion functionality
autoload -Uz compinit
compinit

setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word
setopt auto_menu # show completion menu on successive tab press. needs unsetop menu_complete to work
setopt auto_name_dirs # any parameter that is set to the absolute name of a directory immediately becomes a name for that directory
setopt complete_in_word # Allow completion from within a word/phrase

unsetopt menu_complete # do not autoselect the first completion entry

# If the <tab> key is pressed with multiple possible options, print the
# options.  If the options are printed, begin cycling through them.
zstyle ':completion:*' menu select

# Case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Print the categories the completion options fit into.
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Use colors when outputting file names for completion options.
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# Do not prompt to cd into current directory.
# For example, cd ../<tab> should not prompt current directory.
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# ------------------------------------------------------------------------------
# - Visual settings                                                            -
# ------------------------------------------------------------------------------

# PROMPT='%~ ❯ '

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# Echoes a username/host string when connected over SSH (empty otherwise)
ssh_info() {
  [[ "$SSH_CONNECTION" != '' ]] && echo "%(!.%{$fg[red]%}.%{$fg[yellow]%})%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:" || echo ""
}

# Echoes information about Git repository status when inside a Git repository
git_info() {

  # Git branch/tag, or name-rev if on detached head
  local GIT_LOCATION=${$((git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null)#(refs/heads/|tags/)}

  if [ -n "$GIT_LOCATION" ]; then

    local AHEAD="%F{red}⇡NUM"
    local BEHIND="%F{cyan}⇣NUM"
    local MERGING="%F{magenta}⚡︎"
    local UNTRACKED="%F{red}●"
    local MODIFIED="%F{yellow}●"
    local STAGED="%F{green}●"

    local -a DIVERGENCES
    local -a FLAGS

    local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_AHEAD" -gt 0 ]; then
      DIVERGENCES+=( "${AHEAD//NUM/$NUM_AHEAD}" )
    fi

    local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_BEHIND" -gt 0 ]; then
      DIVERGENCES+=( "${BEHIND//NUM/$NUM_BEHIND}" )
    fi

    local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
    if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
      FLAGS+=( "$MERGING" )
    fi

    if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
      FLAGS+=( "$UNTRACKED" )
    fi

    if ! git diff --quiet 2> /dev/null; then
      FLAGS+=( "$MODIFIED" )
    fi

    if ! git diff --cached --quiet 2> /dev/null; then
      FLAGS+=( "$STAGED" )
    fi

    local -a GIT_INFO
    GIT_INFO+=( "%F{245}±" )
    [ -n "$GIT_STATUS" ] && GIT_INFO+=( "$GIT_STATUS" )
    [[ ${#DIVERGENCES[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)DIVERGENCES}" )
    [[ ${#FLAGS[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)FLAGS}" )
    GIT_INFO+=( "%F{245}$GIT_LOCATION" )
    echo "${(j: :)GIT_INFO}"

  fi

}

# Use ❯ as the non-root prompt character; # for root
# Change the prompt character color if the last command had a nonzero exit code
PS1='
$(ssh_info)%F{147}%~%u $(git_info)
%(?.%F{blue}.%F{red})%(!.#.❯)%f '

# ------------------------------------------------------------------------------
# - Vi mode in ZSH                                                             -
# ------------------------------------------------------------------------------
bindkey -v

# Minimize escape sequence detection delay
export KEYTIMEOUT=1

# Save previous RPROMPT to restore when vim status not displayed
RPROMPT_PREVIOUS=$RPROMPT

# Default color settings
if [ -z "$VIMTO_COLOR_NORMAL_TEXT" ]; then VIMTO_COLOR_NORMAL_TEXT=black; fi
if [ -z "$VIMTO_COLOR_NORMAL_BACKGROUND" ]; then VIMTO_COLOR_NORMAL_BACKGROUND=white; fi

function zle-keymap-select zle-line-init {
	# Command mode
	if [ $KEYMAP = vicmd ]; then
		RPROMPT_PREVIOUS=$RPROMPT
		RPROMPT=$'%K{$VIMTO_COLOR_NORMAL_BACKGROUND} %F{$VIMTO_COLOR_NORMAL_TEXT}NORMAL%f %k'
	# Insert mode
	else
		RPROMPT=$RPROMPT_PREVIOUS
	fi
	zle reset-prompt
}

# Need to initially clear RPROMPT for it to work on first prompt
export RPROMPT=$RPROMPT_PREVIOUS

# Change appearance
zle -N zle-line-init # When a new line starts
zle -N zle-keymap-select  # When vi mode changes

# ------------------------------------------------------------------------------
# - insert_mode_(key bindings)                                                 -
# ------------------------------------------------------------------------------

# Have i_backspace work as it does in Vim.
bindkey -M viins "^?" backward-delete-char

# Have i_ctrl-h work as it does in Vim.
bindkey -M viins "^H" backward-delete-char

# Have i_ctrl-a work as it does in Vim.
bindkey -M viins "^A" beginning-of-line

# Have i_ctrl-e work as it does in Vim.
#bindkey -M viins "^E" end-of-line

# Have i_ctrl-p work as c_ctrl-p does in Vim.
bindkey -M viins "^P" up-line-or-history

# Have i_ctrl-n work as c_ctrl-n does in Vim.
bindkey -M viins "^N" down-line-or-history

# Have i_ctrl-b work as i_ctrl-b does in emacs.
bindkey -M viins "^B" backward-char

# Have i_ctrl-f work as i_ctrl-f does in emacs.
bindkey -M viins "^F" forward-char

# Prepend "sudo ".  This does not have a Vim parallel.
bindkey "^S" prepend-sudo

# Prepend "vim ".  This does not have a Vim parallel.
bindkey "^V" prepend-vim

# Have i_ctrl-u work as it does in Vim.
bindkey -M viins "^U" backward-kill-line

# Have i_ctrl-w work as it does in Vim.
bindkey -M viins "^W" backward-kill-word

# Display _completion_help for creating completion functions.  This does not
# have a Vim parallel.
bindkey -M viins "^X^H" _complete_help

# attempt to complete line based on history, roughly as i_ctrl-x_ctrl-l does in
# Vim.
bindkey -M viins "^X^L" history-incremental-search-backward

# Cut the contents of the line and paste immediately when the next prompt
# appears.  This does not have a clean Vim parallel.
bindkey -M viins "^Y" push-line

# Exchange the current word with the one before it.
bindkey -M viins "^T" transpose-words

# Re-enable incremental search from emacs mode (it is useful).
bindkey "^r" history-incremental-search-backward


# ------------------------------------------------------------------------------
# - normal_mode_(key_bindings)                                                 -
# ------------------------------------------------------------------------------

# Have ctrl-a work as it does in Vim.
bindkey -M vicmd "^A" increment-number

# Mimics Vim's "ca" text object functionality.
bindkey -M vicmd "ca" change-around

# Mimics Vim's "ci" text object functionality.
bindkey -M vicmd "ci" change-in

# If not explicitly set, above ca/ci bindings will cause a delay
bindkey -M vicmd "cc" vi-change-whole-line

# Mimic Vim's da text-object functionality.
bindkey -M vicmd "da" delete-around

# Mimic Vim's di text-object functionality.
bindkey -M vicmd "di" delete-in
#
# If not explicitly set, above da/di bindings will cause a delay
bindkey -M vicmd "dd" kill-whole-line

# Have ctrl-e work as it does in Vim.
bindkey -M vicmd "^E" vi-add-eol

# Have g~ work as it does in Vim.
bindkey -M vicmd "g~" vi-oper-swap-case

# Have ga work as it does in Vim.
bindkey -M vicmd "ga" what-cursor-position

# Have gg work as it does in Vim.
bindkey -M vicmd "gg" beginning-of-history

# Have G work as it does in Vim.
bindkey -M vicmd "G" end-of-history

# Have ctrl-r work as it does in Vim.
bindkey -M vicmd "^R" redo

# Editing the line in Vim proper.
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd "^V" edit-command-line

# Have ctrl-a work as it does in Vim.
bindkey -M vicmd "^X" decrement-number

# ------------------------------------------------------------------------------
# - fasd                                                                       -
# ------------------------------------------------------------------------------
# initialize fasd
eval "$(fasd --init auto)"

# custom fasd aliases
alias e='f -e "emacsclient -n -c"' # quick opening files with emacs
alias p='f -e python3' # quick opening files with python3
alias v='f -e nvim' # quick opening files with neovim

# ------------------------------------------------------------------------------
# - Fuzzy completion for zsh by junegunn                                       -
# ------------------------------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------------------------------------------------------------
# - Virtualenvwrapper settings                                                 -
# ------------------------------------------------------------------------------

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Documents/Python-Projects
    source /usr/local/bin/virtualenvwrapper.sh
fi


# ==============================================================================
# = functions_and_zle_widgets                                                  =
# ==============================================================================
#
# ------------------------------------------------------------------------------
# - zle_widgets                                                                -
# ------------------------------------------------------------------------------
#
# The ZLE widges are all followed by "zle -<MODE> <NAME>" and bound below in
# the "Key Bindings" section.

# Prepend "sudo" to the command line if it is not already there.
prepend-sudo() {
	if ! echo "$BUFFER" | grep -q "^sudo "
	then
		BUFFER="sudo $BUFFER"
		CURSOR+=5
	fi
}
zle -N prepend-sudo

# Prepend "vim" to the command line if it is not already there.
prepend-vim() {
	if ! echo "$BUFFER" | grep -q "^vim "
	then
		BUFFER="vim $BUFFER"
		CURSOR+=5
	fi
}
zle -N prepend-vim

# Delete all characters between a pair of characters.  Mimics Vim's "di" text
# object functionality.
delete-in() {
	# Create locally-scoped variables we'll need
	local CHAR LCHAR RCHAR LSEARCH RSEARCH COUNT
	# Read the character to indicate which text object we're deleting.
	read -k CHAR
	if [ "$CHAR" = "w" ]
	then # diw, delete the word.
		# find the beginning of the word under the cursor
		zle vi-backward-word
		# set the left side of the delete region at this point
		LSEARCH=$CURSOR
		# find the end of the word under the cursor
		zle vi-forward-word
		# set the right side of the delete region at this point
		RSEARCH=$CURSOR
		# Set the BUFFER to everything except the word we are removing.
		RBUFFER="$BUFFER[$RSEARCH+1,${#BUFFER}]"
		LBUFFER="$LBUFFER[1,$LSEARCH]"
		return
	# diw was unique.  For everything else, we just have to define the
	# characters to the left and right of the cursor to be removed
	elif [ "$CHAR" = "(" ] || [ "$CHAR" = ")" ] || [ "$CHAR" = "b" ]
	then # di), delete inside of a pair of parenthesis
		LCHAR="("
		RCHAR=")"
	elif [ "$CHAR" = "[" ] || [ "$CHAR" = "]" ]
	then # di], delete inside of a pair of square brackets
		LCHAR="["
		RCHAR="]"
	elif [ $CHAR = "{" ] || [ $CHAR = "}" ] || [ "$CHAR" = "B" ]
	then # di], delete inside of a pair of braces
		LCHAR="{"
		RCHAR="}"
	else
		# The character entered does not have a special definition.
		# Simply find the first instance to the left and right of the
		# cursor.
		LCHAR="$CHAR"
		RCHAR="$CHAR"
	fi
	# Find the first instance of LCHAR to the left of the cursor and the
	# first instance of RCHAR to the right of the cursor, and remove
	# everything in between.
	# Begin the search for the left-sided character directly the left of the cursor.
	LSEARCH=${#LBUFFER}
	# Keep going left until we find the character or hit the beginning of the buffer.
	while [ "$LSEARCH" -gt 0 ] && [ "$LBUFFER[$LSEARCH]" != "$LCHAR" ]
	do
		LSEARCH=$(expr $LSEARCH - 1)
	done
	# If we hit the beginning of the command line without finding the character, abort.
	if [ "$LBUFFER[$LSEARCH]" != "$LCHAR" ]
	then
		return
	fi
	# start the search directly to the right of the cursor
	RSEARCH=0
	# Keep going right until we find the character or hit the end of the buffer.
	while [ "$RSEARCH" -lt $(expr ${#RBUFFER} + 1 ) ] && [ "$RBUFFER[$RSEARCH]" != "$RCHAR" ]
	do
		RSEARCH=$(expr $RSEARCH + 1)
	done
	# If we hit the end of the command line without finding the character, abort.
	if [ "$RBUFFER[$RSEARCH]" != "$RCHAR" ]
	then
		return
	fi
	# Set the BUFFER to everything except the text we are removing.
	RBUFFER="$RBUFFER[$RSEARCH,${#RBUFFER}]"
	LBUFFER="$LBUFFER[1,$LSEARCH]"
}
zle -N delete-in


# Delete all characters between a pair of characters and then go to insert mode.
# Mimics Vim's "ci" text object functionality.
change-in() {
	zle delete-in
	zle vi-insert
}
zle -N change-in

# Delete all characters between a pair of characters as well as the surrounding
# characters themselves.  Mimics Vim's "da" text object functionality.
delete-around() {
	zle delete-in
	zle vi-backward-char
	zle vi-delete-char
	zle vi-delete-char
}
zle -N delete-around

# Delete all characters between a pair of characters as well as the surrounding
# characters themselves and then go into insert mode  Mimics Vim's "ca" text
# object functionality.
change-around() {
	zle delete-in
	zle vi-backward-char
	zle vi-delete-char
	zle vi-delete-char
	zle vi-insert
}
zle -N change-around

# Increment the number under the cursor, or find the next number to the right
# of the cursor and increment that number.  Emulate vim's ctrl-a functionality.
# This code is not my style at all; presumably I found it somewhere online, but
# I no longer remember the source to cite or credit.
increment-number() {
	emulate -L zsh
	setopt extendedglob
	local pos num newnum sign buf
	if [[ $BUFFER[$((CURSOR + 1))] = [0-9] ]]; then
		pos=$((${#LBUFFER%%[0-9]##} + 1))
	else
		pos=$(($CURSOR + ${#RBUFFER%%[0-9]*} + 1))
	fi
	(($pos <= ${#BUFFER})) || return
	num=${${BUFFER[$pos,-1]}%%[^0-9]*}
	if ((pos > 0)) && [[ $BUFFER[$((pos - 1))] = '-' ]]; then
		num=$((0 - num))
		((pos--))
	fi
	newnum=$((num + ${NUMERIC:-${incarg:-1}}))
	if ((pos > 1)); then
		buf=${BUFFER[0,$((pos - 1))]}${BUFFER[$pos,-1]/$num/$newnum}
	else
		buf=${BUFFER/$num/$newnum}
	fi
	BUFFER=$buf
	CURSOR=$((pos + $#newnum - 2))
}
zle -N increment-number

# Decrement the number under the cursor, or find the next number to the right
# of the cursor and increment that number.  Emulate vim's ctrl-x functionality.
# This code is not my style at all; presumably I found it somewhere online, but
# I no longer remember the source to cite or credit.
decrement-number() {
	emulate -L zsh
	setopt extendedglob
	local pos num newnum sign buf
	if [[ $BUFFER[$((CURSOR + 1))] = [0-9] ]]; then
		pos=$((${#LBUFFER%%[0-9]##} + 1))
	else
		pos=$(($CURSOR + ${#RBUFFER%%[0-9]*} + 1))
	fi
	(($pos <= ${#BUFFER})) || return
	num=${${BUFFER[$pos,-1]}%%[^0-9]*}
	if ((pos > 0)) && [[ $BUFFER[$((pos - 1))] = '-' ]]; then
		num=$((0 - num))
		((pos--))
	fi
	newnum=$((num - ${NUMERIC:-${incarg:-1}}))
	if ((pos > 1)); then
		buf=${BUFFER[0,$((pos - 1))]}${BUFFER[$pos,-1]/$num/$newnum}
	else
		buf=${BUFFER/$num/$newnum}
	fi
	BUFFER=$buf
	CURSOR=$((pos + $#newnum - 2))
}
zle -N decrement-number