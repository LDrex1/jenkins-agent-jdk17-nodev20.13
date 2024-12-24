FROM jenkins/agent:jdk17

# Switch to root user to install Node.js
USER root

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g pnpm

# Clean up APT to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to Jenkins user
USER jenkins