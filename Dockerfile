FROM ubuntu:20.04

ARG USER

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TERM screen-256color
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/home/$USER

RUN apt-get update \
  && apt-get install -y \
	git \
	bash \
	fzf \
	wget \
	python3-dev \
	python3-pip \
	libssl-dev \
	libffi-dev \
	locales \
	curl \
	ripgrep \
	nodejs \
	npm \
	neovim \
	sudo \
	ctags

RUN groupadd -g 1000 -r $USER && useradd --no-log-init -r -u 1000 -m -G sudo -g $USER $USER
WORKDIR $HOME

COPY install.sh .
COPY plugins.vim $HOME/.config/nvim/init.vim
RUN chmod u+x $HOME/install.sh && chown -R $USER $HOME

USER $USER

# vim-plug
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
RUN nvim -i NONE -c PlugInstall -c CocInstall -c quitall > /dev/null 2>&1

RUN $HOME/install.sh

ENV TERM xterm-256color

COPY vimrc $HOME/.config/nvim/init.vim

# base16 shell
RUN git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell \
    && echo '# Base16 Shell\n\
    BASE16_SHELL="$HOME/.config/base16-shell/"\n\
    [ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"' >> $HOME/.bashrc

RUN echo base16_gruvbox-dark-hard >> $HOME/.bashrc

COPY coc-settings.json $HOME/.config/nvim/

ENTRYPOINT ["/bin/bash", "-ic"]

CMD ["nvim"]
