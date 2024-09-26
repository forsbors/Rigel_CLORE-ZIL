#!/bin/bash
ALGO="kawpow+zil" # тут можно поменять алго на какой захочется, кавычки оставь на месте, этот коммент не удаляй
POOL1="stratum+tcp://eu.clore.k1pool.com:5030" # тут меняй адрес пула CLORE на свой, кавычки оставь на месте, этот коммент не удаляй
WALLET1="Krf63bWe2Eme2R3PPnPepH8YQQoyQmvjNuY" # тут меняй адрес кошелька CLORE на свой, кавычки оставь на месте, этот коммент не удаляй
POOL2="stratum+tcp://eu.zil.k1pool.com:1111" # тут меняй адрес пула ZIL на свой, кавычки оставь на месте, этот коммент не удаляй
WALLET2="Krf63bWe2Eme2R3PPnPepH8YQQoyQmvjNuY" # тут меняй адрес кошелька ZIL на свой, кавычки оставь на месте, этот коммент не удаляй
WORKER="Rig10" # тут меняй имя рига, кавычки оставь на месте, этот коммент не удаляй

apt update -y
apt install screen -y
cd ~
wget https://github.com/rigelminer/rigel/releases/download/1.19.1/rigel-1.19.1-linux.tar.gz
tar -xvf rigel-1.19.1-linux.tar.gz
echo "/root/rigel-1.15.0-linux/rigel -a $ALGO -o [1]$POOL1 -u [1]$WALLET1 -o [2]$POOL2 -u [2]$WALLET2 -w $WORKER" > /root/mine.sh
screen -dmS mining bash /root/mine.sh
echo "" >> /etc/supervisor/conf.d/supervisord.conf
echo "[program:mining]" >> /etc/supervisor/conf.d/supervisord.conf
echo "command=/bin/bash -c 'screen -dmS mining bash /root/mine.sh && sleep infinity'" >> /etc/supervisor/conf.d/supervisord.conf
