#!/bin/sh

# 0 - Variables set within GH Secrets
HOST="github.com"
PROTCOL="https"
URL="$PROTCOL://$USERNAME:$TOKEN@$HOST"
REPO="$URL/$ORG/$REPO_NAME"
TYPE=$CHART_TYPE
BRANCH="main"

# Pre - Setup git with $EMAIL and $NAME variables
/usr/bin/git config --global user.email "$EMAIL"
/usr/bin/git config --global user.name "$NAME"

# 1 - Clone a new copy of the repo into a tmp directory
/usr/bin/git clone $REPO $REPO_NAME-tmp
cd "$REPO_NAME-tmp"
/usr/bin/git checkout $BRANCH 

# 2 - Swap out the IMAGE:TAG for the current latest built tag.
# If CHART_TYPE == helm, use tag: \S* regex, otherwise default to $IMAGE:v[0-9]\+\.[0-9]\+\.[0-9]\+\)
if [ "$TYPE" = "helm" ]; then
  /usr/bin/find $PATH -type f -exec /usr/bin/sed -i -e "s|tag: \S*|tag: \"$TAG\"|" {} \;
else
  /usr/bin/find $PATH -type f -exec /usr/bin/sed -i -e "s|\($IMAGE:v[0-9]\+\.[0-9]\+\.[0-9]\+\)|$IMAGE:$TAG|" {} \;
fi

# 3 - Commit and Push to the gitops directory
/usr/bin/git --no-pager diff
/usr/bin/git add .
/usr/bin/git commit -m "Updating image to $IMAGE:$TAG" --no-gpg-sign
/usr/bin/git push $REPO main

# 4 - Cleanup
cd ..
/usr/bin/rm -rf $REPO_NAME-tmp
