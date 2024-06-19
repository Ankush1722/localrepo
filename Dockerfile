FROM node:slim

WORKDIR /app

COPY . /app

RUN npm install -y

EXPOSE 4300

CMD ["npm", "start"]
