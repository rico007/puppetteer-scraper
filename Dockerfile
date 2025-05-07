FROM node:20-slim

# Install dependencies for Chromium
RUN apt-get update && apt-get install -y \
  chromium \
  fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 \
  libatk1.0-0 libcups2 libdbus-1-3 libgdk-pixbuf2.0-0 libnspr4 \
  libnss3 libx11-xcb1 libxcomposite1 libxdamage1 libxrandr2 \
  xdg-utils libu2f-udev libvulkan1 --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

# Install puppeteer
COPY package.json .
RUN npm install

# Copy source
COPY index.js .

# Expose port and start
EXPOSE 3000
CMD ["node", "index.js"]
