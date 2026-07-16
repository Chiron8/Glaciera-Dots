function fish_greeting
	echo ""
	fastfetch
end
if status is-interactive	
    # Commands to run in interactive sessions can go here
end

alias sduo sudo
alias :q exit

set -Ux XCURSOR_THEME Bibata-Modern-Classic
set -Ux XCURSOR_SIZE 24
set PATH $PATH ~/.cargo/bin
set PATH $PATH /opt/cuda/bin
set PATH $PATH /home/chiron/colmap/bin /home/chiron/glomap/bin
set CUDA_HOME /opt/cuda
set LD_LIBRARY_PATH $CUDA_HOME/lib64:$LD_LIBRARY_PATH

export CUDAToolkit_ROOT=/opt/cuda

set EDITOR nvim
set VISUAL nvim
set CUDAToolkit_ROOT /opt/cuda/bin

starship init fish | source



fish_add_path /home/chiron/.spicetify

# terminal-wakatime setup
set -gx PATH "$HOME/.wakatime" $PATH
terminal-wakatime init fish | source
