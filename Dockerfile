FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY graphzer/ ./graphzer/
COPY pyproject.toml .
COPY README.md .

# Install the package
RUN pip install -e .

# Create entrypoint script
RUN echo '#!/bin/bash\npython -m graphzer "$@"' > /usr/local/bin/graphzer && \
    chmod +x /usr/local/bin/graphzer

# Set entrypoint
ENTRYPOINT ["graphzer"]
CMD ["--help"]