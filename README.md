# 🛡️ Port Breacher - Scanner Nmap Inteligente

<b>Port Breacher</b> não é apenas mais um script de Nmap. É um wrapper inteligente, projetado para otimizar o fluxo de trabalho de pentesters, automatizando uma varredura em duas fases para máxima eficiência e detalhe.

Cansado de esperar por varreduras ```-p-``` completas para só depois descobrir quais serviços rodar? O Port Breacher resolve isso. Ele primeiro descobre rapidamente quais portas estão abertas em todos os alvos e, em seguida, executa uma varredura profunda e detalhada apenas nessas portas.

<img width="882" height="472" alt="image" src="https://github.com/user-attachments/assets/e18d17b2-979b-44c3-9c5f-013ebb7efb54" />


## ✨ Como Funciona? A Lógica de Duas Fases

A eficiência do Port Breacher vem de sua abordagem estratégica:

<b>1. Fase 1: Reconhecimento Rápido (Batedor)</b>

  * O script dispara uma varredura ```nmap -sS -p-``` em cada alvo.

  * Esta é uma varredura SYN (stealth), otimizada para ser rápida e leve.

  * O objetivo é unicamente mapear todas as portas TCP abertas (de 1 a 65535) sem perder tempo com serviços.

<b>2. Fase 2: Mergulho Profundo (Caçador)</b>

  * Com a lista de portas abertas para um host específico, o script inicia uma segunda varredura, muito mais focada e detalhada.
  
  * Ele executa ```nmap -sV -A --script vuln``` apenas nas portas que foram encontradas abertas.
  
  * Isso garante que o tempo e os recursos sejam gastos onde realmente importa, investigando serviços, versões, sistemas operacionais e vulnerabilidades conhecidas.

Ao final, todos os resultados detalhados são compilados e salvos em um único arquivo de texto, nomeado com os alvos e a data da varredura para fácil organização.


## 🚀 Instalação

A instalação é projetada para ser simples e direta. O pacote inclui um script que cuida de tudo para você.


### Pré-requisitos

1. <b>Git</b>: Para clonar o repositório. ```sudo dnf install git``` ou ```sudo apt install git```.

2. <b>Nmap</b>: A ferramenta precisa estar instalada no seu sistema.

    * Para Fedora/CentOS:
     
          sudo dnf install nmap
        
    * Para Debian/Ubuntu:
     
          sudo apt install nmap


### Passos para Instalar

1. Clone o repositório do GitHub:

        git clone https://github.com/wpugles/PortBreacher.git

2. Entre no diretório clonado:

        cd PortBreacher

3. Execute o instalador com privilégios de root:

        sudo ./install.sh

O script irá verificar as dependências, copiar o ```port-breacher``` para ```/usr/local/bin``` e dar as permissões necessárias. Após a conclusão, o comando estará disponível globalmente no seu terminal.


## Como Usar

A sintaxe do comando é simples. Lembre-se que, por utilizar a técnica de SYN Scan, o script sempre precisa ser executado com ```sudo```.


### Sintaxe Básica

    sudo port-breacher <alvo1,alvo2,alvo3...>


### Exemplos de Uso

1. Escanear um único alvo:

        sudo port-breacher 192.168.1.100

2. Escanear múltiplos alvos (separados por vírgula):

        sudo port-breacher 192.168.1.100,192.168.1.105,scanme.nmap.org

3. Escanear múltiplos alvos (separados por espaço):
   
    O script também aceita alvos separados por espaço se estiverem entre aspas.

        sudo port-breacher "192.168.1.100 192.168.1.105"

Após a execução, um arquivo de log como Varredura_192_168_1_100-192_168_1_105_2025-10-18_12-52-00.txt será criado no diretório onde você executou o comando.


## ❌ Desinstalação

Se precisar remover a ferramenta, o processo é igualmente simples.

Navegue até a pasta do projeto que você clonou.

Execute o script de desinstalação com sudo:

    sudo ./uninstall.sh

Isso removerá o executável de ```/usr/local/bin``` de forma limpa.
