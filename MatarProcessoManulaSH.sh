#Matar processo
read -p "Digite o nome do processo a ser encerrado: " comando
fim=$(pgrep $comando)
kill -9 $fim
