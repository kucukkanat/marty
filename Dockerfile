FROM golang:alpine

ENV NODE_VERSION v15.3.0
ENV NODE_ARCH linux-x64
ENV NODE_ARCHIVE_NAME node-${NODE_VERSION}-${NODE_ARCH}
COPY dotfiles/ /root/
RUN apk update && \
apk add tmux vim git bash nodejs-current curl npm

# Vim Plugins
# COC.VIM
RUN mkdir -p ~/.vim/pack/coc/start && \
cd ~/.vim/pack/coc/start && \
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
# NERDTREE
RUN git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
# VSCode Theme
RUN git clone https://github.com/tomasiser/vim-code-dark ~/.vim/pack/vendor/start/vim-code-dark
# VIM GO
RUN git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go

# Go Utilities
RUN go get github.com/jesseduffield/lazygit 
RUN go get github.com/jesseduffield/lazydocker 
RUN go get github.com/gokcehan/lf 