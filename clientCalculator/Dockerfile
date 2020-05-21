FROM ubuntu:20.04
COPY . /client/
WORKDIR /client/
RUN apt-get update
RUN apt-get install -y thrift-compiler ruby-thrift
RUN apt-get install -y ruby ri ruby-dev 
EXPOSE 9090