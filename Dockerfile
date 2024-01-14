FROM phusion/baseimage:focal-1.2.0
# FROM ubuntu:focal

RUN apt-get update
RUN apt-get install -y --no-install-recommends wget

# RUN wget https://package.perforce.com/perforce.pubkey
# RUN mkdir /root/.gnupg
# RUN gpg -n --import --import-options import-show perforce.pubkey
# RUN gpg -n --import --import-options import-show perforce.pubkey | grep -q "E58131C0AEA7B082C6DC4C937123CB760FF18869" && echo "true"
RUN wget -qO - https://package.perforce.com/perforce.pubkey | apt-key add -
RUN echo 'deb http://package.perforce.com/apt/ubuntu focal release' > /etc/apt/sources.list.d/perforce.list

RUN apt-get update
RUN apt-get install -y --no-install-recommends helix-p4d
