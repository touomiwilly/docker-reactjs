# Phase I : Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# Phase II : Prod phase
FROM nginx
#EXPOSE 80
ENV PORT 8080
COPY --from=builder /app/build /usr/share/nginx/html
