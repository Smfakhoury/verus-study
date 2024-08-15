FROM rust:latest

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      wget \
      git \
      gnupg \
      sudo \
      unzip \
      libgmp-dev \
    && apt-get clean -y

# Create a new user and give them sudo rights
ARG USER=vscode
RUN useradd -d /home/$USER -s /bin/bash -m $USER
RUN echo "$USER ALL=NOPASSWD: ALL" >> /etc/sudoers
USER $USER
ENV HOME /home/$USER
WORKDIR $HOME
RUN mkdir -p $HOME/bin

# get node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

RUN export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
    && nvm install 20 


# Make sure ~/bin is in the PATH
RUN echo 'export PATH=$HOME/bin:$PATH' | tee --append $HOME/.profile $HOME/.bashrc $HOME/.bash_profile

# get and build verus
#RUN cd $HOME \
#    && git clone https://github.com/verus-lang/verus.git \
#    && cd verus/source 
#    && ./tools/get-z3.sh \
#    && source ../tools/activate \
#    && vargo build --release

#RUN code --install-extension rust-analyzer-0.5.0-dev.vsix