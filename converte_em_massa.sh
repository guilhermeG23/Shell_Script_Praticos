#!/bin/sh
#apt install imagemagick

#tentar fazer para multiplos sistemas, Linux e BSD

#Convertendo imagens no server remoto e passando para o novo
#condicao da pasta, conta se existe
contadorFotos=`ls | grep fotos | wc -l`
contadorServer=`ls | grep server | wc -l`
#Decisoes se existe a pasta
#Fotos
if [ "$contadorFotos" -eq "0" ]; then
	mkdir fotos
else
	rm -rf fotos/*
fi
#Server
if [ "$contadorServer" -eq "0" ]; then
	mkdir server
else
	umount server
fi
#Permissao da pasta
chmod 600 fotos
chmod 500 server
#monsta o server
mount <caminho da unidade> server -o username="usuario",password="senha"
#Entra na pasta do server
cd server
#Copia o conteudo
#Titulo de preguica mas funciona
cp -r *.jpg ../fotos
cp -r *.JPG ../fotos
cp -r *.jpeg ../fotos
cp -r *.JPEG ../fotos
cp -r *.png ../fotos
cp -r *.PNG ../fotos
#cp -r *.* ../fotos
#Entra nas fotos
cd ../fotos
#Renomeia
#Pequena filtragem
rename -v 'y/ /_/' * > /dev/null
rename -v 'y.././' * > /dev/null
#Converte. reduz o tamanho da imagem e sua qualidade
for IMAGEM in * ; do convert -resize "160x220" -quality 60% $IMAGEM $IMAGEM ; done
#Renomeia
rename -v 'y/_/ /' * > /dev/null
#volta para a pasta anterior
cd ..
#Desmonta a server
#Desmontar umount /root/server por exemplo
umount server
#Apaga a pasta do server desmontado
rm -rf server
