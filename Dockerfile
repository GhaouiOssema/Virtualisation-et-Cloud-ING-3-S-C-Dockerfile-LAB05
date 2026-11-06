# Image nginx officielle version fixe
FROM nginx:1.28-alpine

# Auteur
LABEL auteur="Oussama Ghaoui"

# Version
LABEL version="1.1"

# Documentation du port
EXPOSE 80

# Copie des pages web
COPY site/ /usr/share/nginx/html/

# Copie de la configuration nginx
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Vérification de santé
HEALTHCHECK --interval=30s --timeout=5s \
CMD wget -q -O /dev/null http://localhost/ || exit 1
