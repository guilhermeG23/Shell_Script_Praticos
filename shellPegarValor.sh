#Obter a temperatura do server
#teste para obter a temperatura
curl http://192.168.112.97/values.xml > teste.xml && echo Temperatura: $(grep -E "<Value\>" teste.xml | cut -c 10-13) $(date) > SaidaTemperatura.txt && rm -rf teste.xml && cat SaidaTemperatura.txt >> History.txt && cat SaidaTemperatura.txt && cat SaidaTemperatura.txt | awk '{print $2}' > ProgramaTemperatura.txt 