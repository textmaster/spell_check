# from https://github.com/techknowlogick/languagetool-docker

FROM openjdk:8-jre-alpine

ENV LANGUAGETOOL_VERSION 3.8

RUN apk update && \
  apk add \
  curl unzip && \
  cd /srv && \
  curl -o LanguageTool-$LANGUAGETOOL_VERSION.zip https://www.languagetool.org/download/LanguageTool-$LANGUAGETOOL_VERSION.zip && \
  unzip LanguageTool-$LANGUAGETOOL_VERSION.zip && \
  rm LanguageTool-$LANGUAGETOOL_VERSION.zip && \
  rm -rf /var/cache/apk/*

EXPOSE 8081

WORKDIR /srv/LanguageTool-$LANGUAGETOOL_VERSION

CMD java -cp languagetool-server.jar org.languagetool.server.HTTPServer --public --port 8081
