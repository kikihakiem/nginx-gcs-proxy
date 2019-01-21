FROM openresty:1.13.6.2-2-alpine-fat
RUN /usr/local/openresty/luajit/bin/luarocks install lua2go

# Install and configure Go
RUN apk add --no-cache git musl-dev go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH
RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin
RUN go get -u github.com/kikihakiem/gcs-signed-url-generator


