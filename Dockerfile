FROM node:10

USER node
WORKDIR /home/node

RUN npm install \
       yo \
	   generator-openapi-repo

# path obtained from `npm bin`
ENV PATH=/home/node/node_modules/.bin:$PATH
