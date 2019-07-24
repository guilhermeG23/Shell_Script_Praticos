#!/bin/bash

imprimir() {
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	echo Permissao: $1
	echo Arquivo: $2
	
	valor=`echo $1 | cut -c1`
	if [ $valor = '-' ]; then 
		echo Tipo $valor '-> Arquivo regular'
	elif [ $valor = 'd' ]; then 
		echo Tipo $valor '-> Diretorio'
	elif [ $valor = 'i' ]; then 
		echo Tipo $valor '-> Link simbolico'
	fi
		
	Escrita=`echo $1 | cut -c2`
	Leitura=`echo $1 | cut -c3`
	Execucao=`echo $1 | cut -c4`
	
	echo Dono '->' Escrita $Escrita '|' Leitura $Leitura '|' Execucao $Execucao

	Escrita=`echo $1 | cut -c5`
	Leitura=`echo $1 | cut -c6`
	Execucao=`echo $1 | cut -c7`
	
	echo Grupo '->' Escrita $Escrita '|' Leitura $Leitura '|' Execucao $Execucao

	Escrita=`echo $1 | cut -c8`
	Leitura=`echo $1 | cut -c9`
	Execucao=`echo $1 | cut -c10`

	echo Outros '->' Escrita $Escrita '|' Leitura $Leitura '|' Execucao $Execucao

	Link=`echo $1 | cut -c11`
	if [ "$Link" ]; then
		echo Link '->' $Link 
	fi
	echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=
}

ls -la | awk '{ print $1,$9 }' | sed '1d' > saida.txt
while read linha; do 
	imprimir $linha
done < saida.txt
rm -rf saida.txt
