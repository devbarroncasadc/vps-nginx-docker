FROM node:carbon

WORKDIR /usr/src/app

COPY crud-node-postgres/package*.json ./
RUN npm install 

COPY ./crud-node-postgres/ .

RUN npm install -g bower
COPY crud-node-postgres/bower*.json ./
RUN bower install --allow-root

# esta exposta internamente p o docker
EXPOSE 3090 

CMD ["node", "server.js"]
