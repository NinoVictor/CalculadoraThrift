FROM ubuntu:20.04
WORKDIR /server/
RUN apt-get update
RUN apt-get install -y python3-pip
RUN pip3 install thrift
EXPOSE 9090
CMD [ "python3","server.py" ]