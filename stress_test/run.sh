#!/usr/bin/env bash

threads=10
connections=300
test_length=60s
wrk -t$threads -c$connections -d$test_length -s ./post.lua http://api.spell-checker.services.textmasterstaging.com/v2/check
