FROM node:8

#COPY sources.list /etc/apt/sources.list

RUN apt-get -y update && apt-get install -y nodejs \
	npm \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

COPY package.json /usr/src/app

RUN npm install

COPY . /usr/src/app

CMD ["node", "app.js"]
