#!/bin/sh
#Backup BSD
#Backup do banco de fotos
contador=$(ls | grep atual.sql | wc -l)
#Existe algum arquivo
#Se sim, move o dia atual com o nome do dia anterior
# -eq = igual
if [ "$contador" -eq "1" ]; then
	mv atual.sql `date -v-1d +%d-%m-%y`.sql
fi
#Se tem mais de 1 semana de arquivos, apaga o da semana passada
# -gt = maior que
if  [ "`ls | grep sql | wc -l`" -gt "7" ]; then
	rm -rf `date -v-7d +%d-%m-%y`.sql
fi
#Comando do backup
mysqldump -h <host> -u<user> -p<senha> <banco> > atual.sql