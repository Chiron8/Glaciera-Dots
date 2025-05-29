function fish_greeting
	echo ""
	fastfetch
	echo ""
end
if status is-interactive	
    # Commands to run in interactive sessions can go here
end

alias emerge "sudo emerge"
alias sduo sudo
alias :q exit
alias quack ~/.local/bin/quack.sh


set -Ux XCURSOR_THEME Bibata-Modern-Classic
set -Ux XCURSOR_SIZE 24


starship init fish | source

fish_add_path /home/chiron/.spicetify

