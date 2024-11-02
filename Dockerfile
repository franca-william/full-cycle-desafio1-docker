# Build stage 
FROM golang:1.20 AS builder

WORKDIR /app

COPY . /app

RUN go build  main.go

# Final stage
FROM scratch

COPY --from=builder /app/main /

CMD ["/main"]