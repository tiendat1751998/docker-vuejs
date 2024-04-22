# build stages
FROM node:16-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm cache clean --force
RUN npm i esbuild-linux-64
RUN npm install -g npm@8.5.0
COPY . .
RUN npm run build

# production stages
FROM nginx:stable-alpine as production-stage
COPY /nginx/nginx.conf /etc/nginx/nginx.conf
COPY my-site.crt /etc/nginx/ssl/my-site.crt
COPY my-site.key /etc/nginx/ssl/my-site.key
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
