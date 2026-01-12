# Claude Development Environment
# Isolated container with full development tools

FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set timezone
ENV TZ=UTC

# Install system dependencies and development tools
RUN apt-get update && apt-get install -y \
    # Basic utilities
    curl \
    wget \
    git \
    vim \
    nano \
    unzip \
    zip \
    tree \
    jq \
    htop \
    # Build tools
    build-essential \
    gcc \
    g++ \
    make \
    cmake \
    # Python
    python3 \
    python3-pip \
    python3-venv \
    # Network tools
    net-tools \
    iputils-ping \
    dnsutils \
    # Locale support
    locales \
    # Other useful tools
    sudo \
    ca-certificates \
    gnupg \
    lsb-release \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure locale
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Install Node.js (LTS version)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install common Node.js tools globally
RUN npm install -g \
    yarn \
    typescript \
    ts-node \
    nodemon

# Create a non-root user for development
RUN useradd -m -s /bin/bash -G sudo claude \
    && echo "claude ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set up working directory
WORKDIR /workspace

# Give ownership to claude user
RUN chown -R claude:claude /workspace

# Switch to non-root user
USER claude

# Set environment variables
ENV HOME=/home/claude
ENV PATH="${HOME}/.local/bin:${PATH}"

# Create common directories
RUN mkdir -p ${HOME}/.local/bin ${HOME}/projects

# Set the default shell
SHELL ["/bin/bash", "-c"]

# Default command
CMD ["/bin/bash"]
