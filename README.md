# TextMaster Spell Check Service

In order to provide a spell check service we use
LanguageTool: http://wiki.languagetool.org/public-http-api

## Build

We use port 8010 here only to avoid collisions.

```shell
docker build .
docker run -p 8010:80 <image_id>
```

### Push Docker image

```shell
docker build -t textmasterapps/spell-check:<image_tag> .
docker login
docker push textmasterapps/spell-check:<image_tag>
```

### Endpoints

To get a list of available languages

`curl http://<docker_ip>:8010/v2/languages`

(pipe it to `| python -m json.tool` to pretty print the JSON)

To proofread text

`curl --data "language=en-US&text=The house are big." http://<docker_ip>:8010/v2/check`

yields

```
[...]
message: "Possible agreement error - use third-person verb forms for singular and mass nouns: "is"."
[...]
```
