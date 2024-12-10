FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y wget ca-certificates && rm -rf /var/lib/apt/lists/*

# Download and install a precompiled Pandoc release (check https://github.com/jgm/pandoc/releases for the latest)
RUN wget https://github.com/jgm/pandoc/releases/download/3.1.6/pandoc-3.1.6-1-amd64.deb \
    && apt-get update \
    && apt-get install -y ./pandoc-3.1.6-1-amd64.deb \
    && rm pandoc-3.1.6-1-amd64.deb

# Verify installation
RUN pandoc --version

# Set default command if needed
CMD ["pandoc", "--help"]
