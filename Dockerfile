FROM node:alpine3.18 as builder

WORKDIR '/app'


RUN npm install -g pnpm

COPY package.json .
RUN pnpm install


COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html