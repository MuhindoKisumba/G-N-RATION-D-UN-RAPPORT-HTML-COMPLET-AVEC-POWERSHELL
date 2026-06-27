###############################################################################
# GÉNÉRATION D'UN RAPPORT HTML COMPLET AVEC POWERSHELL
# Description :
#   - Collecte les informations système
#   - Récupère les services
#   - Liste les processus
#   - Affiche les disques
#   - Récupère les interfaces réseau
#   - Génère un rapport HTML professionnel
###############################################################################

# Emplacement du rapport
$Rapport = "C:\Rapport_Systeme.html"

# Date de génération
$Date = Get-Date -Format "dd/MM/yyyy HH:mm:ss"

###############################################################################
# INFORMATIONS SYSTÈME
###############################################################################

$OS = Get-CimInstance Win32_OperatingSystem

$Computer = Get-CimInstance Win32_ComputerSystem

$CPU = Get-CimInstance Win32_Processor

$RAM = [Math]::Round($Computer.TotalPhysicalMemory / 1GB,2)

###############################################################################
# SERVICES
###############################################################################

$Services = Get-Service |
Sort-Object Status,DisplayName |
Select-Object Status,DisplayName

###############################################################################
# PROCESSUS
###############################################################################

$Processus = Get-Process |
Sort-Object CPU -Descending |
Select-Object `
Name,
Id,
CPU,
@{
    Name="Mémoire(Mo)"
    Expression={ [Math]::Round($_.WorkingSet/1MB,2) }
} |
Select-Object -First 20

###############################################################################
# DISQUES
###############################################################################

$Disques = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
Select-Object `
DeviceID,
VolumeName,
@{
    Name="Capacité(Go)"
    Expression={ [Math]::Round($_.Size/1GB,2) }
},
@{
    Name="Libre(Go)"
    Expression={ [Math]::Round($_.FreeSpace/1GB,2) }
}

###############################################################################
# ADRESSES IP
###############################################################################

$Reseau = Get-NetIPAddress `
-AddressFamily IPv4 |
Where-Object {$_.IPAddress -ne "127.0.0.1"} |
Select-Object InterfaceAlias,IPAddress

###############################################################################
# STYLE CSS
###############################################################################

$Style = @"
<style>

body
{
    font-family:Segoe UI;
    background:#f4f6f8;
    margin:20px;
}

h1
{
    color:white;
    background:#0078D7;
    padding:15px;
    text-align:center;
}

h2
{
    color:#0078D7;
    border-bottom:2px solid #0078D7;
}

table
{
    border-collapse:collapse;
    width:100%;
    margin-bottom:30px;
}

th
{
    background:#0078D7;
    color:white;
    padding:8px;
}

td
{
    border:1px solid #ddd;
    padding:8px;
}

tr:nth-child(even)
{
    background:#f2f2f2;
}

.footer
{
    text-align:center;
    color:gray;
    margin-top:30px;
    font-size:12px;
}

</style>
"@

###############################################################################
# CONSTRUCTION DU RAPPORT HTML
###############################################################################

$HTML = @()

$HTML += "<html>"
$HTML += "<head>"
$HTML += $Style
$HTML += "</head>"
$HTML += "<body>"

$HTML += "<h1>RAPPORT COMPLET DU SYSTÈME</h1>"

$HTML += "<h2>Informations Générales</h2>"

$HTML += @"
<table>
<tr><th>Élément</th><th>Valeur</th></tr>
<tr><td>Ordinateur</td><td>$($Computer.Name)</td></tr>
<tr><td>Système</td><td>$($OS.Caption)</td></tr>
<tr><td>Version</td><td>$($OS.Version)</td></tr>
<tr><td>Architecture</td><td>$($OS.OSArchitecture)</td></tr>
<tr><td>Processeur</td><td>$($CPU.Name)</td></tr>
<tr><td>Mémoire RAM</td><td>$RAM Go</td></tr>
<tr><td>Date du rapport</td><td>$Date</td></tr>
</table>
"@

$HTML += "<h2>Disques</h2>"

$HTML += ($Disques | ConvertTo-Html -Fragment)

$HTML += "<h2>Interfaces Réseau</h2>"

$HTML += ($Reseau | ConvertTo-Html -Fragment)

$HTML += "<h2>Services Windows</h2>"

$HTML += ($Services | ConvertTo-Html -Fragment)

$HTML += "<h2>Top 20 Processus</h2>"

$HTML += ($Processus | ConvertTo-Html -Fragment)

$HTML += "<div class='footer'>"

$HTML += "Rapport généré automatiquement avec PowerShell"

$HTML += "</div>"

$HTML += "</body>"

$HTML += "</html>"

###############################################################################
# ENREGISTREMENT
###############################################################################

$HTML | Out-File `
-FilePath $Rapport `
-Encoding UTF8

###############################################################################
# OUVERTURE AUTOMATIQUE DU RAPPORT
###############################################################################

Start-Process $Rapport

Write-Host ""
Write-Host "==============================================="
Write-Host " RAPPORT HTML GÉNÉRÉ AVEC SUCCÈS"
Write-Host "==============================================="
Write-Host ""
Write-Host "Fichier : $Rapport"
Write-Host ""