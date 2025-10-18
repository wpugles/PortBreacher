#!/usr/bin/env bash

# ==============================================================================
# Instalador para a ferramenta Port Breacher
# Este script deve ser executado com privilégios de root (sudo).
# ==============================================================================

VERMELHO='\033[0;31m'
VERDE='\033[0;32m'
AZUL='\033[0;34m'
SEM_COR='\033[0m'

NOME_SCRIPT="port-breacher"
DIRETORIO_INSTALACAO="/usr/local/bin"

info() {
    echo -e "${AZUL}[*] $1${SEM_COR}"
}

sucesso() {
    echo -e "${VERDE}[+] $1${SEM_COR}"
}

erro() {
    echo -e "${VERMELHO}[-] $1${SEM_COR}"
    exit 1
}

info "Iniciando a instalação do ${NOME_SCRIPT}..."

if [ "$EUID" -ne 0 ]; then
  erro "Por favor, execute este script com sudo: sudo ./install.sh"
fi

if ! command -v nmap &> /dev/null; then
    erro "Dependência não encontrada: 'nmap'. Por favor, instale-o antes de continuar (ex: sudo dnf install nmap)."
fi
sucesso "Dependência 'nmap' encontrada."

if [ ! -f "$NOME_SCRIPT" ]; then
    erro "O arquivo do script '${NOME_SCRIPT}' não foi encontrado. Certifique-se de que ele está na mesma pasta que o instalador."
fi
sucesso "Arquivo do script '${NOME_SCRIPT}' encontrado."

info "Copiando '${NOME_SCRIPT}' para '${DIRETORIO_INSTALACAO}'..."
cp "$NOME_SCRIPT" "$DIRETORIO_INSTALACAO/$NOME_SCRIPT" || erro "Falha ao copiar o arquivo."
sucesso "Arquivo copiado com sucesso."

info "Aplicando permissões de execução..."
chmod +x "$DIRETORIO_INSTALACAO/$NOME_SCRIPT" || erro "Falha ao aplicar permissões."
sucesso "Permissões aplicadas."

if command -v "$NOME_SCRIPT" &> /dev/null; then
    sucesso "Instalação concluída com sucesso!"
    info "Agora você pode usar o comando '${NOME_SCRIPT}' de qualquer lugar no terminal."
    info "Exemplo de uso: sudo ${NOME_SCRIPT} 127.0.0.1"
else
    erro "A instalação parece ter falhado. O comando '${NOME_SCRIPT}' não foi encontrado no PATH."
fi

exit 0
