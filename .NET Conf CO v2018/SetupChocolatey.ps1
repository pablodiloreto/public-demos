###########################################################################
# Script generado para DEMO || NO UTILIZAR EN PRODUCCION ||
# Autor: Pablo Ariel Di Loreto
# Email: pablodiloreto@hotmail.com
# Social: @PabloDiLoreto
# Contexto: .NET Conf CO v2018
###########################################################################
# Objetivo: instalación de Chocolatey, gestor de paquetes para Windows
# Consideraciones: ninguna.
# Fecha de actualización: 08/11/2018
###########################################################################

# Powershell Execution Policy bypassed to run these scripts
Set-ExecutionPolicy Bypass -Scope Process -Force

# Instalamos Chocolatey directamente desde linea de comandos
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Fin del script