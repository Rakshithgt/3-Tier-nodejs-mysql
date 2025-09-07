FROM node:14-alpine
WORKDIR /usr/src/app/client
COPY client/package*.json ./
RUN npm install
COPY client/ ./
RUN npm run build
WORKDIR /usr/src/app/server
COPY server/package*.json ./
RUN npm install
COPY server/ ./
RUN mkdir -p ./public && cp -R /usr/src/app/client/dist/* ./public/
EXPOSE 5000
CMD ["npm", "start"]

