FROM node:alpine3.18 as builder

WORKDIR '/app'

RUN rm -rf build
RUN rm -rf node_modules

COPY package.json .
RUN npm install --verbose


COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html