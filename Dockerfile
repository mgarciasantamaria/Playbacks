# imagen linux requerida
FROM python:alpine
# Se copia todo el contenido del proyecto a la carpeta /home/app del contenedor
COPY . /home/app
# ejecucion de los comandos
# 1 se establece el archivo main como ejecutable
RUN python -m pip install awscli
RUN aws configure set aws_access_key_id AKIAXUR4IDG54UNZJGPX --profile pythonapps
RUN aws configure set aws_secret_access_key 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 --profile pythonapps
RUN aws configure set region us-east-1 --profile pythonapps
RUN aws configure set output json --profile pythonapps
RUN pip install -r /home/app/requirements.txt
RUN echo "15 00 * * * python /home/app/src/main.py" >> /var/spool/cron/crontabs/root
CMD cp /usr/share/zoneinfo/America/Bogota /etc/localtime && crond -l 2 -f /dev/stdout