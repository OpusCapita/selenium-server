FROM selenium/standalone-chrome
MAINTAINER gr4per

WORKDIR /home/seluser
COPY package.json .

RUN sudo apt-get update && sudo apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install -y nodejs build-essential
RUN npm install

CMD [ "npm", "run test" ]