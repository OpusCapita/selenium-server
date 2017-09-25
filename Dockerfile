FROM selenium/standalone-firefox:3.4.0-dysprosium
MAINTAINER gr4per

WORKDIR /home/seluser
COPY package.json .

RUN sudo apt-get update && sudo apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install -y nodejs build-essential
RUN sudo npm install -g nodemon
RUN npm install
RUN mkdir result
COPY startup.sh startup.sh

ENTRYPOINT [ "bash", "startup.sh" ]