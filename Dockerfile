FROM golang AS builder

WORKDIR /go/src

COPY . .

ENTRYPOINT ["go", "run", "."]