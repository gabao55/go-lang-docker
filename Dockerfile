FROM golang AS builder

WORKDIR /go/src

COPY ./src .

ENV CGO_ENABLED=0

RUN GOOS=linux go build

RUN chmod a+x ./hello

FROM scratch

WORKDIR /go/src

COPY --from=builder /go/src .

ENTRYPOINT [ "./hello" ]