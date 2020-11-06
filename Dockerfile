
FROM node:10-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


# to build this
# sudo docker build .
# sudo docker run -p 8080:80 ee52910891c9