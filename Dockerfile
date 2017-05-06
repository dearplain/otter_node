FROM java:8-alpine
MAINTAINER lw6c@qq.com
RUN apk add --update aria2 ca-certificates && rm -rf /var/cache/apk/*
ADD aria2.conf /etc/aria2.conf
RUN mkdir node && cd node && wget https://github.com/alibaba/otter/releases/download/otter-4.2.13/node.deployer-4.2.13.tar.gz && tar -xzf node.deployer-4.2.13.tar.gz && rm node.deployer-4.2.13.tar.gz
RUN sed -i s/"-server -Xms2048m -Xmx3072m -Xmn1024m"/"-server -Xms32m -Xmx3072m"/g /node/bin/startup.sh && sed -i s/"-server -Xms1024m -Xmx1024m -XX:NewSize=256m -XX:MaxNewSize=256m"/"-server -Xms32m -Xmx1024m"/g /node/bin/startup.sh
RUN chmod +x docker-entrypoint.sh
CMD ["docker-entrypoint.sh"]