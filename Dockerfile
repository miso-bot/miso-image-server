# syntax=docker/dockerfile:1

FROM golang:1.23-alpine

RUN apk update && apk upgrade
# CJK glyphs are packaged separately from the base Noto fonts.
RUN apk add chromium font-noto font-noto-cjk font-noto-emoji

WORKDIR /app

COPY go.mod .
RUN go mod download

COPY . .

RUN go build -o /main
EXPOSE 3000
CMD [ "/main" ]
