export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR=vim

# Brew-Cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Cabal
export PATH="$HOME/.cabal/bin:$PATH"

# LaTeX
export PATH="/usr/texbin:$PATH"

## Anaconda
#export PATH="/anaconda/bin:$PATH"
#
## Theano+Anaconda
#export DYLD_FALLBACK_LIBRARY_PATH="/anaconda/lib:$DYLD_FALLBACK_LIBRARY_PATH"

# CUDA
# export PATH="/Developer/NVIDIA/CUDA-5.5/bin:$PATH"
# export DYLD_LIBRARY_PATH="/Developer/NVIDIA/CUDA-5.5/lib:$DYLD_LIBRARY_PATH"

# Julia
alias julia=/Applications/Julia-0.2.0.app/Contents/Resources/julia/bin/julia

# git hub
# eval "$(hub alias -s)"

# objectsharer
export PYTHONPATH="$HOME/code"
export PYTHONPATH="$HOME/code/objectsharer:$PYTHONPATH"
export PYTHONPATH="$HOME/code/dataserver:$PYTHONPATH"
export PYTHONPATH="$HOME/code/vectfit_python:$PYTHONPATH"
export PYTHONPATH="$HOME/code/brune_python:$PYTHONPATH"
export PYTHONPATH="$HOME/code/Yngwie/Python/Core:$PYTHONPATH"
export PYTHONPATH="$HOME/code/instrumentserver:$PYTHONPATH"
export PYTHONPATH="$HOME/code/pulseseq:$PYTHONPATH"
export PYTHONPATH="$HOME/code/reconstruction:$PYTHONPATH"
export PYTHONPATH="$HOME/code/fpga_lib:$PYTHONPATH"

# Ruby gems
export GEM_HOME="$HOME/.gems"
export PATH="$HOME/.gems/bin:$PATH"

# tmux
alias tmux='tmux -2' # use 256 colors
