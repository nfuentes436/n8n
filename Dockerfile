# Dockerfile pour n8n Web Service
FROM node:20-bullseye

WORKDIR /app

# Installer pnpm
RUN npm install -g pnpm

# Copier package.json et lockfile
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Copier le reste du projet
COPY . .

# Build n8n
RUN pnpm run build:n8n

# Variables par défaut
ENV N8N_RUNNERS_ENABLED=true
ENV N8N_RUNNERS_MODE=external
ENV N8N_RUNNERS_AUTH_TOKEN=test
ENV N8N_LOG_LEVEL=info
ENV N8N_TASK_BROKER_TYPE=redis
ENV N8N_TASK_BROKER_REDIS_HOST=render-redis
ENV N8N_TASK_BROKER_REDIS_PORT=6379
ENV N8N_TASK_BROKER_REDIS_PASSWORD=secretpassword
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678

EXPOSE 5678

CMD ["pnpm", "start"]
