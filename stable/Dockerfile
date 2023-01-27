FROM nginx:1.22.1

ENV NGX_MRUBY_VERSION 2.2.5

COPY build_config.rb /tmp/

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
    git \
    curl \
    build-essential \
    rake \
    bison \
    libssl-dev \
    libpcre3-dev \
    zlib1g-dev \
 \
 && cd /usr/local/src \
 && git clone --branch v$NGX_MRUBY_VERSION --depth 1 https://github.com/matsumotory/ngx_mruby.git \
 && curl -s -OL http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz && tar -xf nginx-$NGINX_VERSION.tar.gz \
 \
 && cd /usr/local/src/ngx_mruby \
 && cp /tmp/build_config.rb . \
 && ./configure --enable-dynamic-module --with-ngx-src-root=../nginx-$NGINX_VERSION \
 && make build_mruby \
 && make generate_gems_config_dynamic \
 \
 && cd /usr/local/src/nginx-$NGINX_VERSION \
 && ./configure \
    --with-compat \
    --add-dynamic-module=../ngx_mruby \
    --add-dynamic-module=../ngx_mruby/dependence/ngx_devel_kit \
 && make modules

FROM nginx:1.22.1

ENV NGX_MRUBY_VERSION 2.2.5

COPY --from=0 /usr/local/src/nginx-$NGINX_VERSION/objs/*.so /etc/nginx/modules/
COPY nginx.conf /etc/nginx/nginx.conf
