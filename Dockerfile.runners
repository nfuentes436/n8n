# On utilise l'image officielle des Task Runners qui inclut Python
FROM n8nio/runners:latest

# Travail en root pour installer des modules Python
USER root

# Copier un fichier requirements (optionnel) pour installer des libs supplémentaires
COPY requirements.txt /tmp/requirements.txt

# Installer les dépendances Python listées dans requirements.txt
# (l’image runners contient déjà Python et pip)
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# (Optionnel) nettoyer le fichier
RUN rm /tmp/requirements.txt

# Remettre l’utilisateur non-root (sécurité)
#USER node

# Par défaut, cette image lance le launcher de runners
CMD ["launcher"]
