FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    ca-certificates \
    curl \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Copy the entire project into the container's /app directory
COPY . /app

# Ensure entrypoint.sh is executable
RUN chmod +x /app/.github/scripts/entrypoint.sh

# Set entrypoint to run when container starts
ENTRYPOINT ["/app/.github/scripts/entrypoint.sh"]