FROM ubuntu:20.04
COPY . /server/
WORKDIR /server/
RUN apt-get update
RUN apt-get install -y thrift-compiler
RUN apt-get install -y python3-pip
RUN pip3 install -r requeriments.txt
EXPOSE 9090
CMD [ "python3","server.py" ]