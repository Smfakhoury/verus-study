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
      clang \
    && apt-get clean -y

# Create a new user and give them sudo rights
ARG USER=vscode
RUN useradd -d /home/$USER -s /bin/bash -m $USER
RUN echo "$USER ALL=NOPASSWD: ALL" >> /etc/sudoers
USER $USER
ENV HOME /home/$USER
WORKDIR $HOME
RUN mkdir -p $HOME/bin

ENV DIR /workspaces/verus-study

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
    #&& ./tools/get-z3.sh \
    #&& source ../tools/activate \
    #&& vargo build --release
#RUN mkdir study
#COPY . /study
#ENV DIR /study
#RUN cd $DIR \
#    && git clone --branch infra https://github.com/verus-lang/verus-analyzer.git \
#    && cd verus-analyzer/editors/code/src \
#    && rm client.ts \
#    && rm commands.ts \
#    && rm main.ts

#RUN cp $DIR/telemetry-hook-files/client.ts $DIR/verus-analyzer/editors/code/src/client.ts \
#    && cp $DIR/telemetry-hook-files/commands.ts $DIR/verus-analyzer/editors/code/src/commands.ts \
#    && cp $DIR/telemetry-hook-files/main.ts $DIR/verus-analyzer/editors/code/src/main.ts



#COPY telemetry-hook-files/client.ts $HOME/verus-analyzer/editors/code/src/client.ts
#COPY telemetry-hook-files/commands.ts $HOME/verus-analyzer/editors/code/src/commands.ts

#RUN cd $HOME/verus-analyzer/editors/code \
#    && npm install \
#    && npm add @vscode/extension-telemetry \
#    && npm add @vscode/vsce

#RUN cd $HOME/verus-analyzer \
#    && cargo xtask dist \
#    && gunzip dist/verus-analyzer-x86_64-unknown-linux-gnu.gz \
#    && chmod +x dist/verus-analyzer-x86_64-unknown-linux-gnu

#RUN cd $HOME/verus-analyzer/editors/code \
#    && vsce package