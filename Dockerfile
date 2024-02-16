# FROM nginx:1.23.3
FROM node:alpine as builder

WORKDIR '/app'
COPY  package.json .
RUN  npm install -g npm@10.4.0
COPY  . .
RUN  npm i esbuild-linux-64
RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
