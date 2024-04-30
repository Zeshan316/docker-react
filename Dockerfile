FROM node:alpine3.18 as builder

WORKDIR /app

COPY package.json .
RUN npm install --force

#RUN rm -rf build
COPY . .
RUN npm run build


FROM nginx
# COPY /app/build /usr/share/nginx/html
COPY --from=builder /app/build /usr/share/nginx/html