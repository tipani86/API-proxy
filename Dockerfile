# syntax=docker/dockerfile:1.3-labs

# Build a docker image for serving API proxy

FROM python:3.11-slim

COPY requirements.txt /api/

RUN <<EOF
set -e
python3 -m pip install --no-cache-dir -r /api/requirements.txt
EOF

# Copy the code layer
ADD __api.tar.gz /api
WORKDIR /api

# Add default startup command
CMD ["uvicorn", "main:app", "--host", "0.0.0.0"]
