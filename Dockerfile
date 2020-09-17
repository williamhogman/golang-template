# build stage
FROM golang:alpine as builder

ENV GO111MODULE=on
WORKDIR /app

COPY go.mod go.sum /app/
RUN go mod download
COPY *.go /app/
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app

# final stage
FROM scratch
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /app/app /app/
ENTRYPOINT ["/app/app"]