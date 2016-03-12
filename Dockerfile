FROM cakkineni/oss-base

ADD sensu.repo /etc/yum.repos.d/sensu.repo

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install logrotate rabbitmq-server redis sensu python  uchiwa; yum clean all
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN /usr/lib/rabbitmq/bin/rabbitmq-plugins enable rabbitmq_management

ENV RABBITMQ_LOG_BASE /data/log
ENV RABBITMQ_MNESIA_BASE /data/mnesia

VOLUME ["/data/log", "/data/mnesia"]

ADD sensu.sh /usr/sbin/sensu
RUN chmod 755 /usr/sbin/sensu

EXPOSE 5672 15672 6379 4567 5671
