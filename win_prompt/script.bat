cls 
echo Realmente quer fazer backup ? 
pause
cls
echo ok, fazendo backup...
cd C:\Users\Jefferson
mkdir backup
xcopy /E /Y "C:\Users\Jefferson\Desktop\reciclagem\linha_de_comando\linha_de_comando\win_prompt" "C:\Users\Jefferson\backup"
echo Listando os arquivos de backup
dir C:\Users\Jefferson\backup
