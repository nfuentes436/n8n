# Dockerfile pour n8n
FROM n8nio/n8n:2.2.5

# Variables d'environnement générales
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http

EXPOSE 5678
