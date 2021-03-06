#!/bin/bash

echo "[{\"nickname\":\"slack\",\"server\":\"irc.freenode.org\",\"token\":\"${SLACK_TOKEN}\",\"channelMapping\":{\"#general\":\"#kiwix\"}}]" > slack-irc.config.json
cat slack-irc.config.json

slack-irc                                                                  \
    --config="slack-irc.config.json"                                       &

while [ 42 ] ; do ./watcherbot.js                                          \
    --twitterKey="${TWITTER_KEY}"                                          \
    --twitterSecret="${TWITTER_SECRET}"                                    \
    --twitterTokenKey="${TWITTER_TOKEN_KEY}"                               \
    --twitterTokenSecret="${TWITTER_TOKEN_SECRET}"                         \
    --kiwixGithubToken="${KIWIX_GITHUB_TOKEN}"                             \
    --openzimGithubToken="${OPENZIM_GITHUB_TOKEN}" ;                       \
    sleep 60 ;                                                             \
done
