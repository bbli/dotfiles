#!/bin/bash
# If this can't work, just rsync key over to your local and copy

curl -u "USERNAME:PASSWORD" --data "{\"title\": \"TITLE\", \"key\": \"$(cat ~/.ssh/id_rsa.pub)\"}" https://api.github.com/user/keys
