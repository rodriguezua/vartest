#FROM ubuntu:18.04
FROM node:lts-buster-slim
RUN mkdir /code
WORKDIR /code
ADD package.json /code/
RUN npm install
ADD . /code/

# ssh
ENV SSH_PASSWD "root:Docker!"
ENV HELLO "TestVar"
RUN apt-get update \
        && apt-get install -y --no-install-recommends apt-utils dialog openssh-server \
        && apt-get install -y gettext-base \
        && apt-get install -y nano \
	&& echo "$SSH_PASSWD" | chpasswd 

COPY sshd_config /etc/ssh/
COPY init.sh /usr/local/bin/
RUN chmod u+x /usr/local/bin/init.sh

EXPOSE 3000 2222
ENTRYPOINT ["init.sh"]
