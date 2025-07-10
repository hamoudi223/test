# Utilise une image officielle Node.js légère
FROM node:18-alpine

# Crée et positionne dans le dossier app
WORKDIR /app

# Copie les fichiers package.json et package-lock.json (si présent)
COPY package*.json ./

# Installe les dépendances (avec option --legacy-peer-deps si besoin)
RUN npm install --legacy-peer-deps

# Copie tout le contenu du projet dans le container
COPY . .

# Expose le port 3000 (optionnel, selon ton bot)
# EXPOSE 3000

# Définit la variable d'environnement OWNER_NUMBER par défaut (modifiable à la création du container)
ENV OWNER_NUMBER="22395064497"

# Lance le bot (adapte index.js si besoin)
CMD ["node", "deploy.js"]
