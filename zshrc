source ~/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle github
antigen bundle pip
antigen bundle python
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle sindresorhus/pure
antigen bundle rupa/z

antigen apply

source ~/.profile
