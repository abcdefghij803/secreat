# Updated base image (Python 3.11 + Node.js 20, Bullseye based)
FROM nikolaik/python-nodejs:python3.11-nodejs20

# Install ffmpeg and clean up
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy app code
COPY . /app/
WORKDIR /app/

# Install Python dependencies
RUN pip3 install --no-cache-dir -U -r requirements.txt

# Start the app
CMD ["bash", "start"]
