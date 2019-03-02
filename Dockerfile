# Phase I : Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# Phase II : Prod phase
FROM nginx as prod
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
