#!/bin/bash

curl -u "USERNAME:PASSWORD" --data "{\"title\": \"TITLE\", \"key\": \"$(cat ~/.ssh/id_rsa.pub)\"}" https://api.github.com/user/keys
