FROM openresty/openresty:alpine

RUN apk add --no-cache luarocks lua5.1-dev openssl-dev gcc musl-dev

RUN luarocks install lapis
RUN luarocks install lua-cjson
RUN luarocks install luacrypto

RUN mkdir -p /home/supersam

COPY supersam.lua /home/supersam/supersam.lua
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

RUN mkdir -p /home/supersam/static

EXPOSE 8080

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
