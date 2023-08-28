FROM ubuntu:20.04

LABEL "com.github.actions.name"="Regex Image Updater"
LABEL "com.github.actions.description"="Sets a very simple regex to replace an image version in a specific file"
LABEL "com.github.actions.icon"="copy"
LABEL "com.github.actions.color"="green"

LABEL version="0.0.1"
LABEL repository="https://github.com/steadweb/action-regex-image-replacer"
LABEL homepage="https://github.com/steadweb/action-regex-image-replacer"
LABEL maintainer="Luke Steadman <ljsteadman@gmail.com>"

RUN apt update && apt install git-core -y
RUN mkdir -p /root/.ssh/
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
