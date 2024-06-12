FROM node

WORKDIR /app

COPY . /app

RUN npm install -y

EXPOSE 3000

ENTRYPOINT npm start
