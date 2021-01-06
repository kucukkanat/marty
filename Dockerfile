FROM ubuntu

RUN apt update && \
    apt install tmux vim git curl wget -y

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash - && \
    apt-get install -y nodejs

# Install Golang
WORKDIR /downloads
RUN wget https://golang.org/dl/go1.15.5.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.15.5.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin:/root/go/bin

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
# VIM Prettier
RUN mkdir -p ~/.vim/pack/plugins/start
RUN git clone https://github.com/prettier/vim-prettier ~/.vim/pack/plugins/start/vim-prettier
# Vim Fugitive
RUN git clone git clone https://tpope.io/vim/fugitive.git ~/.vim/pack/plugins/start/fugitive
# Go Utilities
RUN go get github.com/jesseduffield/lazygit 
RUN go get github.com/jesseduffield/lazydocker 
RUN go get github.com/gokcehan/lf 


# Copy dotfiles
COPY dotfiles/ /root/
