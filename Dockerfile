FROM golang:1.17-alpine3.14 AS builder

WORKDIR /go/src/app
COPY . .

RUN go mod init
RUN go get -d -v ./...
RUN go install -v ./...
RUN go build

FROM scratch
COPY --from=builder /go/bin/app /go/bin/

CMD ["/go/bin/app"]

