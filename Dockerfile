# Utilisez une image Flutter en tant qu'image de base
FROM mobiledevops/flutter-sdk-image

# Créez un répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le fichier pubspec.yaml séparément pour tirer parti du cache Docker
COPY pubspec.yaml pubspec.yaml

# Copiez les fichiers restants dans le conteneur
COPY . .
RUN flutter -v

# Obtenez les dépendances du projet et mettez à niveau les packages
RUN flutter pub upgrade && flutter pub get

# Nettoyez le cache Flutter
RUN flutter clean

# Construisez l'application Flutter
RUN flutter build apk --release

# Commande par défaut pour exécuter l'application (changez-la selon vos besoins)
CMD ["flutter", "run", "--no-sound-null-safety"]