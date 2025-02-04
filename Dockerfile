FROM registry.access.redhat.com/ubi8/ubi

RUN yum install -y nginx && \
    sed -i 's/80 default_server/8080 default_server/' /etc/nginx/nginx.conf && \
    echo "daemon off;" >> /etc/nginx/nginx.conf && \
    sed -i 's!error_log.*!error_log /dev/stderr;!' /etc/nginx/nginx.conf && \
    sed -i 's!access_log.*!access_log /dev/stdout main;!' /etc/nginx/nginx.conf && \
    sed -i 's/user nginx;//' /etc/nginx/nginx.conf  && \
    sed -i 's!pid /run/nginx.pid;!pid /tmp/nginx.pid;!' /etc/nginx/nginx.conf  && \
    yum -y clean all --enablerepo='*'

ENTRYPOINT ["nginx"]

