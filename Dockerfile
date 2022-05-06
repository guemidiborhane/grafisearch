FROM golang:1.18-alpine3.14

RUN apk add --no-cache make npm curl
RUN npm install -g pnpm

RUN go install github.com/mitranim/gow@latest
ARG BASE_PATH=/go
ARG APP_PATH=$BASE_PATH/src

# Create user and set it as default
RUN adduser -h $BASE_PATH -s /bin/bash -DH app
RUN mkdir -p $APP_PATH
RUN chown -R app:app $BASE_PATH

USER app
WORKDIR $APP_PATH
VOLUME $APP_PATH
ENV PORT=8042
EXPOSE $PORT
EXPOSE 3000

CMD ["make -j 2", "frontdev", "dev"]
