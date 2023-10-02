#take base image
FROM python:3.9-slim

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

#
WORKDIR /app


#copy code 
COPY . .

RUN pip install --upgrade pip \
    && pip install mysqlclient \
    && pip install -r requirements.txt


CMD ["python","app.py"]

