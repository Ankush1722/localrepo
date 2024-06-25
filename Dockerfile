FROM node:slim

WORKDIR /app

COPY . /app

RUN npm init -y

RUN npm install -y

EXPOSE 3000

CMD ["node", "index.js"]
