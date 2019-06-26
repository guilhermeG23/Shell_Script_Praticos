#!/bin/sh

#Alarme improvisado
#Alarme MAc ou Linux
while [ true ]; do
    date > saida_hora
    valor=`cat saida | awk '{print $4}'`
    valor_hora=`echo $valor | cut -c1,2`
    valor_minuto=`echo $valor | cut -c4,5`

    hora=11
    minuto_inicio=10
    minuto_final=12

    if [ $valor_hora -eq $hora ]
    then
        if [ $valor_minuto >= $minuto_inicio]
        then
            if [ $valor_minuto <= $minuto_final]
            then
                # Mac -> say "Alarme"
                # Linux -> echo "Alarme"
            fi
        fi
    fi

    echo "" > saida_hora
    sleep 60
done