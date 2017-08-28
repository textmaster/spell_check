FROM textmasterapps/spell-checker:0.2

ENV HOME /home/app

WORKDIR $HOME

CMD ["java", "-cp", "languagetool-server.jar", "org.languagetool.server.HTTPServer", "--port", "80", "--public", "--allow-origin", "'*'"]
EXPOSE 80
