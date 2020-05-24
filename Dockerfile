FROM webdevops/php-apache:7.2

ENV VERSION 1.11.10
VOLUME /chamilo-data/ /app/chamilo/
RUN curl -fSL https://github.com/chamilo/chamilo-lms/releases/download/v${VERSION}/chamilo-${VERSION}-php7.tar.gz -o chamilo.tar.gz
RUN mkdir -p /app \
    && tar -xzf chamilo.tar.gz --directory /app/ \
    && mv /app/chamilo* /app/chamilo \
    && rm -fr chamilo.tar.gz
RUN chown application:application -R /app/chamilo/app /app/chamilo/web /app/chamilo/main

ENV WEB_DOCUMENT_ROOT "/app/chamilo"

EXPOSE 80