# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Arguments for creating a vscode user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create vscode user and configure sudoers
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Switch from root to vscode user
USER $USERNAME

# Add user to video group to allow access to webcam
RUN sudo usermod --append --groups video $USERNAME

# Install general dependencies
RUN sudo apt update && sudo apt upgrade -y 

# Install Flutter dependencies
RUN sudo apt install -y curl git unzip xz-utils zip libglu1-mesa tmux

# Install Zsh and Oh My Zsh
RUN sudo apt install -y zsh && \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change default shell to Zsh
SHELL ["/bin/zsh", "-c"]

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /home/$USERNAME/flutter 

# Switch to the stable branch
RUN cd /home/$USERNAME/flutter && git checkout stable

# Add Flutter to PATH
ENV PATH="/home/$USERNAME/flutter/bin:$PATH"

# Run basic flutter commands to download Dart SDK and other dependencies
RUN flutter precache

# Enable Flutter web
RUN flutter config --enable-web

# Install very_good_cli
RUN dart pub global activate very_good_cli

# Add Dart SDK and Dart Pub Cache to PATH (comes with Flutter)
ENV PATH="$PATH:/home/$USERNAME/flutter/bin/cache/dart-sdk/bin:/home/$USERNAME/.pub-cache/bin"

# Cleanup to reduce image size
RUN sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* /usr/share/man/?? /usr/share/man/??_*

# Add tmux configuration
RUN echo "set -g base-index 1\n\
    set -g pane-base-index 1\n\
    set -g status-style bg=default\n\
    bind H resize-pane -L 5\n\
    bind J resize-pane -D 5\n\
    bind K resize-pane -U 5\n\
    bind L resize-pane -R 5\n\
    bind h select-pane -L\n\
    bind l select-pane -R\n\
    bind k select-pane -U\n\
    bind j select-pane -D" >> ~/.tmux.conf

# Set the working directory
WORKDIR /home/$USERNAME

# Default command to start Zsh
CMD ["/bin/zsh"]
