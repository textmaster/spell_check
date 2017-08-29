# TextMaster Spell Check Service

In order to provide a spell check service we use
LanguageTool: http://wiki.languagetool.org/public-http-api

## Build & run

We use port 8010 here only to avoid collisions.

```shell
cd /path/to/repo
docker build .
docker tag <image_id> spell_check
docker run -p 8010:80 spell_check
```

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
