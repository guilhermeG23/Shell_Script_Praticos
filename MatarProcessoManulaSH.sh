#!/bin/bash
#Entrada
read -p "Digite o nome do processo a ser encerrado: " comando
#Variavel PID
fim=$(pgrep $comando)
#Matar processo
kill -9 $fim
