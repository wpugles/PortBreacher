#!/usr/bin/env bash

# ==============================================================================
# Desinstalador para a ferramenta Port Breacher
# ==============================================================================

VERMELHO='\033[0;31m'
VERDE='\033[0;32m'
AZUL='\033[0;34m'
SEM_COR='\033[0m'

NOME_SCRIPT="port-breacher"
CAMINHO_INSTALACAO="/usr/local/bin/${NOME_SCRIPT}"

info() { echo -e "${AZUL}[*] $1${SEM_COR}"; }
sucesso() { echo -e "${VERDE}[+] $1${SEM_COR}"; }
erro() { echo -e "${VERMELHO}[-] $1${SEM_COR}"; exit 1; }

info "Iniciando a desinstalação do ${NOME_SCRIPT}..."

if [ "$EUID" -ne 0 ]; then
  erro "Por favor, execute como root: sudo ./uninstall.sh"
fi

if [ -f "$CAMINHO_INSTALACAO" ]; then
    info "Removendo '${CAMINHO_INSTALACAO}'..."
    rm "$CAMINHO_INSTALACAO" || erro "Falha ao remover o arquivo."
    sucesso "${NOME_SCRIPT} foi desinstalado com sucesso."
else
    info "O script '${NOME_SCRIPT}' não parece estar instalado em '${CAMINHO_INSTALACAO}'. Nada a fazer."
fi

exit 0
