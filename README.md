# Génération d'un Rapport HTML Complet avec PowerShell

## Description

Ce projet PowerShell permet de générer automatiquement un rapport HTML professionnel contenant les principales informations d'un ordinateur Windows.

Le script collecte les données système, les services Windows, les processus actifs, les informations sur les disques ainsi que les interfaces réseau, puis les présente dans une page HTML élégante avec une feuille de style CSS intégrée.

Le rapport est ensuite enregistré sur le disque et ouvert automatiquement dans le navigateur par défaut.

---

# Objectifs

- Automatiser la collecte d'informations système
- Générer un rapport HTML lisible et professionnel
- Faciliter les audits informatiques
- Réaliser un inventaire rapide d'une machine Windows
- Produire un rapport prêt à être partagé ou archivé

---

# Fonctionnalités

- Informations générales de l'ordinateur
- Nom du poste
- Version de Windows
- Architecture du système
- Informations sur le processeur
- Quantité de mémoire RAM
- Date et heure de génération
- Liste des services Windows
- Top 20 des processus consommant le plus de CPU
- Inventaire des disques locaux
- Capacité totale des disques
- Espace disque disponible
- Liste des interfaces réseau IPv4
- Génération automatique d'un rapport HTML
- Mise en forme CSS professionnelle
- Ouverture automatique du rapport

---

# Informations collectées

## Système

- Nom de l'ordinateur
- Nom du système d'exploitation
- Version Windows
- Architecture (32 ou 64 bits)
- Processeur
- Mémoire physique

---

## Services Windows

Le script récupère tous les services installés avec leur état.

Exemple :

- Running
- Stopped
- Paused

---

## Processus

Les 20 processus utilisant le plus de ressources processeur sont affichés avec :

- Nom
- PID
- Temps CPU
- Consommation mémoire

---

## Disques

Pour chaque disque local :

- Lettre
- Nom du volume
- Capacité totale
- Espace libre

---

## Réseau

Le rapport affiche :

- Nom de l'interface
- Adresse IPv4

Les adresses localhost sont automatiquement ignorées.

---

# Technologies utilisées

- PowerShell
- CIM (Common Information Model)
- Win32_OperatingSystem
- Win32_ComputerSystem
- Win32_Processor
- Win32_LogicalDisk
- ConvertTo-Html
- CSS intégré
- HTML5

---

# Structure du script

Le script est organisé en plusieurs parties :

1. Déclaration des variables
2. Collecte des informations système
3. Inventaire des services
4. Inventaire des processus
5. Inventaire des disques
6. Inventaire réseau
7. Création de la feuille CSS
8. Construction du document HTML
9. Enregistrement du fichier
10. Ouverture automatique

---

# Mise en forme HTML

Le rapport utilise une feuille de style CSS intégrée offrant :

- Couleurs modernes
- En-têtes bleus
- Tableaux professionnels
- Lignes alternées
- Police Segoe UI
- Mise en page responsive
- Présentation claire

---

# Exemple de rapport

Le rapport contient plusieurs sections :

- Informations Générales
- Disques
- Interfaces Réseau
- Services Windows
- Top 20 Processus

Chaque section est présentée sous forme de tableau HTML.

---

# Prérequis

- Windows 10 ou supérieur
- Windows Server 2016+
- PowerShell 5.1 ou PowerShell 7
- Droits de lecture sur les informations système

---

# Exécution

Exécuter simplement :

```powershell
.\Rapport_Systeme.ps1
```

Le rapport est automatiquement généré puis ouvert.

---

# Emplacement du rapport

Par défaut :

```text
C:\Rapport_Systeme.html
```

Vous pouvez modifier ce chemin en changeant la variable :

```powershell
$Rapport
```

---

# Personnalisation

Le script peut être facilement enrichi avec :

- Utilisateurs locaux
- Groupes locaux
- Logiciels installés
- Mises à jour Windows
- Journaux d'événements
- Tâches planifiées
- Cartes réseau
- Imprimantes
- Sessions ouvertes
- Variables d'environnement
- Pare-feu Windows
- Antivirus
- État de BitLocker
- Partages réseau
- Ports TCP/UDP
- Connexions réseau
- Statistiques système

---

# Cas d'utilisation

Ce script est particulièrement utile pour :

- Administration système
- Audit informatique
- Support technique
- Inventaire matériel
- Inventaire logiciel
- Cybersécurité
- Forensic
- Pentest défensif
- Documentation informatique
- Supervision
- Contrôle qualité
- Diagnostic système
- Reporting automatique

---

# Avantages

- 100 % PowerShell
- Aucune dépendance externe
- Génération rapide
- Rapport HTML moderne
- Code facilement personnalisable
- Compatible Windows
- Automatisation complète
- Lecture intuitive
- Export partageable
- Maintenance simplifiée

---

# Évolutions possibles

Le projet peut être complété par :

- Export PDF
- Export Excel
- Export CSV
- Tableau de bord interactif
- Graphiques HTML
- Intégration Bootstrap
- Mode sombre
- Historisation des rapports
- Envoi automatique par e-mail
- Exécution planifiée via le Planificateur de tâches Windows
- Supervision de plusieurs ordinateurs
- Rapports centralisés
- Intégration avec Active Directory
- Collecte distante via PowerShell Remoting

---

# Conclusion

Ce projet constitue une excellente base pour automatiser les audits et la génération de rapports sous Windows. Grâce à PowerShell et à `ConvertTo-Html`, il produit un document HTML professionnel regroupant les principales informations système, facilitant ainsi la supervision, le diagnostic, la maintenance et la documentation des postes de travail ou des serveurs.
