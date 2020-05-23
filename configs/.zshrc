# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git extract web-search git-extras docker vagrant vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR=vim

if [ "$TERM" = "linux" ]; then
	echo -en "\e]P0#3b4252" # black
	echo -en "\e]P1#bf616a" # red
	echo -en "\e]P2#a3be8c" # green
	echo -en "\e]P3#ebcb8b" # yellow
	echo -en "\e]P4#81a1c1" # blue
	echo -en "\e]P5#b48ead" # magenta
	echo -en "\e]P6#88c0d0" # cyan
	echo -en "\e]P7#e5e9f0" # white
	echo -en "\e]P8#4c566a" # black
	echo -en "\e]P9#bf616a" # red
	echo -en "\e]PA#a3be8c" # green
	echo -en "\e]PB#ebcb8b" # yellow
	echo -en "\e]PC#81a1c1" # blue
	echo -en "\e]PD#b48ead" # magenta
	echo -en "\e]PE#8fbcbb" # cyan
	echo -en "\e]PF#eceff4" # white
    clear #for background artifacting
fi

# fix broken binds

bindkey '[3~' delete-char
bindkey '[1~' beginning-of-line
bindkey '[4~' end-of-line

# Prompt
NCOLOR="magenta"

PROMPT='%{$fg[$NCOLOR]%}%B%n%b%{%{$fg[$NCOLOR]%}@$HOST$reset_color%}:%{$fg[blue]%}%~%{$reset_color%} $(git_prompt_info)
%(!.#.$) » '
RPROMPT='[%*]'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[red]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"

# LS colors, made with https://geoff.greer.fm/lscolors/
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:*.patch=00;34:*.o=00;32:*.so=01;35:*.ko=01;31:*.la=00;33'