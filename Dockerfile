FROM golang:1.18.0-alpine AS builder

RUN apk add --no-cache git

WORKDIR /app



COPY . /app/
RUN go build -o /gochallenge

FROM scratch
COPY --from=builder /gochallenge /gochallenge

CMD ["/gochallenge"]