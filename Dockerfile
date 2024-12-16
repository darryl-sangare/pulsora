FROM node:23 AS build

WORKDIR /app

COPY package*.json .

RUN npm i

COPY . .

RUN npm run build

FROM nginx:1.27.2

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]