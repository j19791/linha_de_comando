# Prompt do Windows

- ferramentas na linha de comando podem ser controlados através de scripts: automação
- Prompt de comando (cmd):  terminal ou console do windows
- iniciar: prompt ou cmd
	- inicia automaticamente na pasta inicial
- prompt : > 
- C:\Users\caelum>
	- C: partição principal do computador
	- Users: pasta
	- caelum : sub-pasta de Users
	- \ contra barra: separador de diretórios da linha de comando
- evite acentos e espaços nos nomes dos diretórios: usar _ invés do espaço

## Comandos

### trabalhando com arquivos

- `echo Oi Mundo` : imprime no terminal
	- echo Oi Mundo > saida.txt : imprime no arquivo saida.txt
		- `>` pega a saída de um comando e grava no arquivo indicado ou repassa para outro comando
		- `>>` cria um arquivo novo quando o arquivo que pedimos não existir! Caso ele já exista, ele adiciona o novo conteúdo ao final do arquivo, sem sobrescrevê-lo
- `type saida.txt` : ve o conteúdo do arquivo 
- `del saida.txt`: apaga o arquivo
- `copy saida.txt saida2.txt` : cria uma cópia 
- `rename saida2.txt mensagem.txt` : renomear arquivo e pastas
- `move mensagem.txt .. ` : move arquivo ou pasta para outro diretório

### navegando entre diretórios

- `dir` : lista todos os arquivos e pastas
	- `dir .` : lista os arquivos e pastas do diretório atual (o ponto é opcional)
	- `dir ..` : lista os arquivos e pastas do diretório acima
	- `dir /O:s` : ordena a saida do comando dir pelo tamanho (s: size)
	- `dir /O:D` : ordena a saida do comando dir pela data
	- `dir /O:D  C:\` : mostra o conteúdo do diretório C:\ e ordena a saida do comando dir pela data
- `cd` : change directory - entra em uma subpasta
	- `cd .. ` : sobe na hierárquia de diretórios (diretório acima daquele que vc ja esta)
- `mkdir codigo` : make directory : cria novo diretório
- `rmdir codigo_java` : remove o diretório


### Outros comandos

- `cls` : limpa o terminal
- `help dir` : ajuda do comando