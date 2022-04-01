FROM node:16 as build
WORKDIR /app
COPY . .

RUN npm ci
RUN npx quasar b

FROM nginx:1.20-alpine
COPY nginx/prod/configs/* /etc/nginx/
COPY --from=build /app/dist/spa /usr/share/nginx/html

COPY nginx/prod/run.sh /run-nginx.sh
RUN chmod +x /run-nginx.sh

EXPOSE 8080
USER nginx
CMD ["/run-nginx.sh"]
