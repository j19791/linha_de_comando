# Prompt do Windows

- ferramentas na linha de comando podem ser controlados através de scripts: automação
	- backup de arquivos
- Prompt de comando (cmd):  terminal ou console do windows
- iniciar: prompt ou cmd
	- inicia automaticamente na pasta inicial do usuário *Home* 
		- pasta com as configurações dos programas específicos
- prompt : > 
- C:\Users\caelum>
	- C: partição principal do computador
	- Users: pasta
	- caelum : sub-pasta de Users
	- \ contra barra: separador de diretórios da linha de comando
- evite acentos e espaços nos nomes dos diretórios: usar _ invés do espaço
- usar aspas duplas quando tem espaço no caminho do path

## Comandos

### trabalhando com arquivos e pastas

- `echo Oi Mundo` : imprime no terminal
	- `echo Oi Mundo > saida.txt` : imprime no arquivo saida.txt
		- `>` pega a saída de um comando e grava no arquivo indicado ou repassa para outro comando
		- `> NUL` oculta a mensagem de saída
		- `>>` cria um arquivo novo quando o arquivo que pedimos não existir! Caso ele já exista, ele adiciona o novo conteúdo ao final do arquivo, sem sobrescrevê-lo
	- **%variavel%** : para ver o conteúdo da variável
	- `echo %date%` : imprime a data atual
- `type saida.txt` : ve o conteúdo do arquivo todo de uma vez
- `more saida.txt` : exibir página por página do arquivo
	- Útil para ler arquivos de logs de uma aplicação que esta num servidor da núvem
	- `espaço`: navega de página e página
	- `enter`: navega linha a linha
	- `q` : sai da navegação do arquivo sem precisar chegar no final
- `del saida.txt`: apaga o arquivo
- `copy saida.txt saida2.txt` : cria uma cópia de arquivo
- `xcopy` : copia pastas
	- `xcopy /E /Y "C:\Users\caelum\codigo" "C:\Users\caelum\backup"` copia as sub-pastas e confirma automaticamente a sobreescrita de arquivos
- `rename saida2.txt mensagem.txt` : renomear arquivo e pastas
- `move mensagem.txt .. ` : move arquivo ou pasta para outro diretório

### navegando entre diretórios

- `dir` : lista todos os arquivos e pastas
	- `dir .` : lista os arquivos e pastas do diretório atual (o ponto é opcional)
	- `dir ..` : lista os arquivos e pastas do diretório acima
	- `dir /O:s` : ordena a saida do comando dir pelo tamanho (s: size)
	- `dir /O:D` : ordena a saida do comando dir pela data
	- `dir /O:D  C:\` : mostra o conteúdo do diretório C:\ e ordena a saida do comando dir pela data	
- `cd` : change directory` entra em uma subpasta
	- `cd .. ` : sobe na hierárquia de diretórios (diretório acima daquele que vc ja esta)
- `mkdir codigo` : make directory : cria novo diretório
- `rmdir codigo_java` : remove o diretório
- `tree`: mostra as pastas e subpastas organizadas em uma árvore

### Outros comandos

- `cls` : limpa o terminal
- `help dir` : ajuda do comando

### Scripts
- batch: executar vários comandos em lote
- pasta **bin**: pasta onde estão os executáveis e scripts das ferramentas
- `script.bat` executa o script
	- executar o script a partir de qualquer pasta, incluir no **PATH**
- `pause` pausa a execução dos comandos em lote e aguarda a confirmação do usuário para continuar sua execução
- `ctrl + c` : aborta a execução
- `@echo off` : desabilita a exibição dos comandos na execução do script. Começar o script com esse comando
- `@ECHO ON` mostra informações e mensagens nativas do prompt
- `ECHO.`  deixa uma linha em branco
- `@ECHO` oculta o prompt durante toda execução
- `EXIST` verifica se algo existe, uma variável por exemplo
- `GOTO` vai para um determinado ponto do arquivo
- `:NOME` ponto de parada que pode ser chamado através do GOTO NOME
- `FOR` estrutura de repetição
	```
		for %%f in (*.mp4) do (
			ffmpeg -i "%%f" -vn -ar 44100 -ac 2 -ab 192k -f mp3 "%%f".mp3
    	)
	```
- `MSG *` mostra um balão de aviso na tela
- `REM` usado para fazer comentários que não serão interpretados pelo prompt
- `START` inicializa um aplicativo
- `CALL "%variavel%"` abre um arquivo/programa com espaços no nome
- `IF NOT DEFINED "%variavel%" GOTO comando` se a variável não estiver definida vai para uma seção específica do arquivo

### Variáveis do ambiente 
- não é case-sensitive
- **HOMEPATH** : pasta raiz do usuário
- **PATH** : contendo o local padrão aonde se encontram os caminhos para os scripts. windows vai encontrar automaticamente os scripts aqui definidos
- **date**
- **time**
- **PROCESSOR_ARCHITECTURE**
- **username** nome da conta do usuário logado
- **userprofile** pasta do perfil do usuário
- **temp** pasta temporária
- **windir** pasta de instalação do Windows
- **systemroot** pasta raiz do sistema
- **userdomain** nome do domínio
- **systemdrive** letra do drive onde o sistema está instalado
- **cd** retorna o caminho do .bat
- **JAVA_HOME%** : aponta para o diretório raiz do java (sem bin)
	- X86 : 32 BITS
	- amd64 OU ia64: 64 BITS
- **set** : mostra todas as variáveis de ambiente
	- `set PATH=%PATH%;C:\Users\Jefferson\bin` : redefine o PATH, concatenando o novo caminho  até o terminal ser fechado
	- `set PASTA_CODIGO=%HOMEPATH%\bin` : cria uma nova variável de ambiente até o terminal ser fechado
- **setx**
	- `setx PATH "%PATH%;C:\Users\Jefferson\bin" /M`
		- /M : qdo queremos alterar uma variável do sistema
		- usar em modo administrador

### Chocolatey : gerenciador de pacotes
- instalador silencioso global para aplicativos e ferramentas
- instalação como administrador peo próprio cmd
```
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```
- (acha pacotes)[https://community.chocolatey.org/packages]
- `choco install python2` : baixa, instala e configura o ambiente para o Phyton 2.7
- `choco install -y nodejs.install -version 4.2.2` : indica versao e -y ja confirma a instalação
- `choco uninstall python2` remove o pacote
- `choco list <nome_do_pacote>` busca o pacote na internet para baixar
	- `choco list -l` lista os pacotes ja instalados localmente através do chocolatey

### outros
- wmic: Windows Management Instrumentation
	- `wmic OS get OSArchitecture` : arquitetura do processador
- RapidEE: editor de variáveis de ambiente
	- detecta caminhos inválidos
	- remove duplicatas e variáveis em branco
- cmder: linha de comando colorida
	- [https://cmder.app/]
	- versão mini. Descompactar
	- multiplas abas
	- copiar e colar + fácil