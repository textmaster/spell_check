# TextMaster Spell Check Service

In order to provide a spell check service we use
LanguageTool: http://wiki.languagetool.org/public-http-api

## Build & run

```shell
cd /path/to/repo
docker-compose up
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
