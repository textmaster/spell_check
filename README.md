# TextMaster Spell Check Service

In order to provide a spell check service we use
LanguageTool: http://wiki.languagetool.org/public-http-api

## Build

Port 8010 is used here only to avoid collisions.

```shell
docker build .
docker run -p 8010:80 <image_id>
```

### Push/pull Docker image

Docker Hub automatically builds the image on every push and adds the `latest` tag to it.
It can then be pulled with `docker pull textmasterapps/spell_check`

To tag it and push it manually run:

```shell
docker build -t textmasterapps/spell_check:<image_tag> .
docker login
docker push textmasterapps/spell_check:<image_tag>
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
