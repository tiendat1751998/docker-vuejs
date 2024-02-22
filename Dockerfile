# FROM nginx:1.23.3
# FROM node:alpine as builder

# WORKDIR '/app'
# COPY  package.json .
# RUN  npm i esbuild-linux-64
# RUN  npm install -g npm@10.4.0
# COPY  . .
# RUN npm run build


# FROM nginx
# COPY --from=builder /app/dist /usr/share/nginx/html

# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN  npm i esbuild-linux-64
RUN npm install -g npm@8.5.0
RUN node -v
RUN npm -v
COPY . .
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80:80
CMD ["nginx", "-g", "daemon off;"]
