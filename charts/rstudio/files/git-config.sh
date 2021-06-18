#!/bin/bash
set -ex

if [ $# -lt 3 ]; then
  echo 1>&2 "usage: $0 USERNAME FULLNAME EMAIL"
  exit 2
fi

USERNAME=$1
FULLNAME=$2
EMAIL=$3

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Make sure username doesn't contain any "../otheruser" shenanigans
USER_HOME=$( cd /home/${USERNAME} && pwd)
if [[ "$USER_HOME" != "/home/${USERNAME}" ]]; then
  exit 0
fi


# ~/.gitignore
GIT_IGNORE=$USER_HOME/.gitignore

if [ ! -f $GIT_IGNORE ]; then
  cp $SCRIPT_PATH/gitignore $GIT_IGNORE
fi


# ~/.git-templates
GIT_TEMPLATES=$USER_HOME/.git-templates

if [ ! -d $GIT_TEMPLATES ]; then
  mkdir -p $GIT_TEMPLATES
fi


# ~/.git-templates/hooks
GIT_HOOK_TEMPLATES=$GIT_TEMPLATES/hooks

if [ ! -d $GIT_HOOK_TEMPLATES ]; then
  mkdir -p $GIT_HOOK_TEMPLATES
fi


# ~/.git-templates/hooks/pre-push
cp $SCRIPT_PATH/pre-push $GIT_HOOK_TEMPLATES/pre-push

# ~/.git-templates/hooks/pre-commit
cp $SCRIPT_PATH/pre-commit $GIT_HOOK_TEMPLATES/pre-commit

# ~/.gitconfig
GIT_CONFIG=$USER_HOME/.gitconfig

git config -f $GIT_CONFIG user.email $EMAIL
git config -f $GIT_CONFIG user.name "${FULLNAME}"
git config -f $GIT_CONFIG core.excludesfile $GIT_IGNORE
git config -f $GIT_CONFIG init.templatedir '~/.git-templates'

chown 1001:staff $GIT_CONFIG
chown -R 1001:staff $GIT_TEMPLATES
