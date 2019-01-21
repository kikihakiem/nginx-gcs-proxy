FROM golang:1.11-alpine AS builder
COPY gcs-signed-url-generator /go/src
WORKDIR /go/src
RUN go build -buildmode=c-shared -o ../bin/generator.so generator.go credential.go

FROM openresty:1.13.6.2-2-alpine-fat
RUN /usr/local/openresty/luajit/bin/luarocks install lua2go
WORKDIR /lua2go/
COPY --from=builder /go/bin/ ./
COPY generator.lua ./
COPY nginx.conf ./conf/

CMD ["/usr/local/openresty/bin/openresty", "-c", "/lua2go/conf/nginx.conf", "-g", "daemon off;"]
