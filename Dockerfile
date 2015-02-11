FROM debian:jessie

RUN apt-get update
RUN apt-get install -y -qq curl git python-pip
WORKDIR /opt
RUN git clone https://github.com/ianmiell/shutit.git
WORKDIR shutit
RUN pip install -r requirements.txt

WORKDIR /space/git
RUN git clone https://github.com/ianmiell/docker-dev-tools-image.git #
WORKDIR /space/git/docker-dev-tools-image
RUN /opt/shutit/shutit build --shutit_module_path /opt/shutit/library --delivery bash

USER imiell

CMD ["/bin/bash"] 
