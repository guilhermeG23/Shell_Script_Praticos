#Obter a temperatura do server
#teste para obter a temperatura
curl http://medidor/values.xml > teste.xml && echo Temperatura: $(grep -E "<Value\>" teste.xml | cut -c 10-13) $(date) >> SaidaTemperatura.txt && rm -rf teste.xml && cat SaidaTemperatura.txt 
#Isso e para a aplicacao
#cat SaidaTemperatura.txt | awk '{print $2}' > T.txt 
