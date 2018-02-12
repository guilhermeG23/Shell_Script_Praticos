#!/bin/bash
#Entrada
echo "O Arquivo será armazenado no /usr/bin"
read -p "Digite o caminho e o programa: " arquivo
#permissao
chmod 777 $arquivo
#Mover
mv $arquivo /usr/bin
#Finalizar
echo "Arquivo está no /usr/bin"
