FROM registry.internal/app:master-base-latest

MAINTAINER Sergii Nuzhdin <ipaq.lw@gmail.com>

ENV INSTALL_DIR=/app

RUN mkdir -p $INSTALL_DIR

WORKDIR $INSTALL_DIR

ADD . $INSTALL_DIR

EXPOSE 9000

CMD python manage.py runserver
