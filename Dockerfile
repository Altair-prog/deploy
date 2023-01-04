FROM python:3.10

WORKDIR /code
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY app.py .
COPY migrations migrations
COPY docker_config.py default_config.py

CMD gunicorn --bind 0.0.0.0:80 --access-logfile='-' --capture-output app:app



#FROM ubuntu:20.04

#RUN apt update && apt install -y nginx

#CMD nginx -g 'daemon off;'
