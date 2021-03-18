# TextMaster Spell Check Service

In order to provide a spell check service we use
LanguageTool: http://wiki.languagetool.org/public-http-api

## Build

Port 8010 is used here only to avoid collisions.

```shell
docker build .
docker run -p 8010:80 <image_id>
```

## Add language

It is possible to add Hunspell/Morfologik dictionaries dynamically to Languagetool.
They will allow spell check but not grammar checks (which requires more rules).

To add more languages:

- Download Hunspell dictionary (.dic and .aff). Possibles sources are listed at [https://hunspell.github.io](https://hunspell.github.io). Put it in a new folder in `extra_dics`.
- Optionally, it should be possible to [convert them to Morfologik format](https://dev.languagetool.org/hunspell-support) (.dict) to obtain quicker suggestions.
- Download a list of the most common words in the new language from [there](https://github.com/mozilla-b2g/gaia/tree/master/apps/keyboard/js/imes/latin/dictionaries). Put the first 10K words in a `common_words.txt` file in the same directory. It is required by languagetool to be able to detect languages.
- Update `server.properties` to declare the new language. The language code in the key must match an entry in languagetool's list. For example:

```
lang-no = Norwegian Bokmål
lang-no-dictPath = /home/app/extra_dics/nb-NO/nb-NO.dic
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
