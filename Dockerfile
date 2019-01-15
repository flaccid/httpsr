FROM golang as builder

COPY main.go /usr/src/httpsr/main.go

WORKDIR /usr/src/httpsr

RUN CGO_ENABLED=0 GOOS=linux go build -o httpsr main.go

FROM scratch

COPY --from=builder /usr/src/httpsr/httpsr /usr/local/bin/httpsr

CMD ["/usr/local/bin/httpsr"]
