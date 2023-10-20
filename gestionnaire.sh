#!/bin/bash           
current_directory=$(pwd)

while true; do
        clear
        echo "répertoire actuel : $current_directory"
        echo "1.crée un reépertoire"
        echo "2.afficher le répertoire"
        echo "3.déplacer le fichier"
        echo "4.copier un fichier"
        echo "5.renommer un fichier"
        echo "6.supprimer un fichier"
        echo "7.rechercher un fichier"
        echo "8.compter les fichier dans un repertoire"
        echo "9.quitter"

        read -p "Saisissez le numéro de votre choix : " choix

        case $choix in
                1)
                        read -p "saissisez le nom du nouveau répertoire : " new_folder_name
                        mkdir "$current_directory/$new_folder_name"
                        echo "répertoire $new_folder_name crée avec succés."
                        read -p "appuyer sur entrée pour continuer. . ."
                        ;;
                2)

                        ls -1 "$current_directory"
                        read -p "appuyer sur entrée pour continuer. . ."
                        ;;
                3)
                        read -p "Chemin source : " source
                        read -p "nom du fichier à déplacer" destination
                        mv "$source" "$destination"
                        echo "fichier/repertoire déplacer avec succés."
			read -p "Appuyez sur Entrée pour continuer..."
                        ;;

                4)

                        read -p "Chemin source : " source
                        read -p "nom du fichier à copier : " copier
                        cp -r "$source" "$copier"
                        echo "fichier/repertoire copier avec succés"
                        read -p "Appuyez sur Entrée pour continuer..."
                        ;;

               5)
                        read -p "choisir le repertoire ou fichier a renommer :" renommer
                        read -p "nom du nouveau nom : " nouveau_nom
                        mv -u "$renommer" "$nouveau_nom"
                        echo "fichier/nom changer avec succès "
                        read -p "Appuyez sur Entrée pour continuer..."
                        ;;


              6)

                  read -p "Supprimer le fichier dans le répertoire :" supprimer
                  read -p "nom du fichier à supprimer : " nom_supprimer
                  rm -f "$supprimer" "$nom_supprimer"
                  echo "fichier/supprimer avec succés "
                  read -p "Appuyez sur Entrée pour continuer..."
                  ;;

             7)
                read -p "repertoire de depart pour la recherche : " repertoire
                read -p "nom du fichier a rechercher : " nom_fichier
                find "$repertoire" -type f -name "$nom_fichier"
                echo "fichier/recherche effectué "
		read -p "appuyer sur entrée pour continuer..."
                ;;

                8)
                        read -p "quelle repoertoire voulez vous compter :" repertoire
                              nombre_fichier=$(find "$repertoire" -type f| wc -l)
                              echo "il y a $nombre_fichier fichier dans '$repertoire'"
                              read -p "Appuyez sur Entrée pour continuer..."
                              ;;

                9)
                        echo "Au revoir !"
                        break
                        ;;
                *)
                        echo "Choix invalide"
                        read -p "appuyer sur entrée pour continuer. . ."
                        ;;
        esac
done