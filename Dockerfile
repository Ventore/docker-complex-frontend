FROM node as builder

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build

FROM nginx

EXPOSE 80

COPY --from=builder /app/dist /usr/share/nginx/html