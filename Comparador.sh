#!/bin/bash
#Entradas
read -p "Primeiro arquivo: " arqui1
read -p "Segundo arquivo: " arqui2
#Comparacao
diff $arqui1 $arqui2 | grep -iv 'Com' | grep -iv 'Bina'| grep -Ei "$arqui2" > saida.txt
#Saida
cat saida.txt | more
