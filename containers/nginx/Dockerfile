FROM nginx:1.18.0

RUN rm -f /etc/nginx/conf.d/*

# コンテナにNginxの設定ファイルをコピーする
ADD nginx.conf /etc/nginx/conf.d/docker_rails.conf

# ビルドの完了後、Nginxを起動する
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf