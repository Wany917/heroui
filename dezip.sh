#!/bin/bash

# Parcourir tous les fichiers .zip dans le dossier actuel
for zipfile in *.zip; do
    [ -e "$zipfile" ] || continue

    # Nom du dossier sans l'extension .zip
    dirname="${zipfile%.zip}"

    echo "Décompression de $zipfile dans $dirname..."

    # Créer le dossier de destination
    mkdir -p "$dirname"

    # Décompresser dans ce dossier
    if unzip -q "$zipfile" -d "$dirname"; then
        echo "Suppression de $zipfile..."
        rm "$zipfile"
    else
        echo "Erreur lors de la décompression de $zipfile"
    fi
done

echo "Décompression terminée pour tous les fichiers .zip."
