FROM ubuntu:20.04

LABEL maintainer="Rachel Lee <ralee@lambda.compute.cmc.edu>"

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip python3-dev && \
    apt-get clean

WORKDIR /app
# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

RUN python3 -m pip install --no-cache-dir -r /app/requirements.txt

COPY . /app





CMD [ "python3", "/app/app.py" ]

