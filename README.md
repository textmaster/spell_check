# LanguageTool proofreading service

Dockerized LanguageTool proofreading service
http://wiki.languagetool.org/public-http-api

## Build & run

```shell
cd /path/to/repo
docker build .
docker tag <image_id> languagetool
docker run -p 8081:8081 languagetool
```

To get a list of available languages

`curl http://<docker_ip>:8081/v2/languages`

(pipe it to `| python -m json.tool` to pretty print the JSON)

To proofread text

`curl --data "language=en-US&text=The house are big." http://<docker_ip>:8081/v2/check`

yields

```
[...]
message: "Possible agreement error - use third-person verb forms for singular and mass nouns: "is"."
[...]
```
