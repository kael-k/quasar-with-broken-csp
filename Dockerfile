FROM node:16 as build
WORKDIR /app
COPY . .

RUN npm ci
RUN npx quasar b

FROM nginx:1.20-alpine
COPY --from=build /app/dist/spa /usr/share/nginx/html
EXPOSE 80
