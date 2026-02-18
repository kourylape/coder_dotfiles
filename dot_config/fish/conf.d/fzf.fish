# fzf setup
set -x FZF_CTRL_T_COMMAND "fd --type f --hidden"
set -x FZF_CTRL_T_OPTS "--preview 'bat --color=always --style=plain,numbers {}'"

# fzf - rose-pine
set -x FZF_DEFAULT_OPTS "
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
