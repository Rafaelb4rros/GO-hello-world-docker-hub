FROM golang:1.15 as builder

WORKDIR /app

COPY . /app/
RUN go build -o /gochallenge

FROM scratch
COPY --from=builder /gochallenge /gochallenge

CMD ["/gochallenge"]