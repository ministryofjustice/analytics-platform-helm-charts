#!/bin/sh

curl -o /usr/local/bin/fly "$CONCOURSE_URL/api/v1/cli?arch=amd64&platform=linux"

chmod +x /usr/local/bin/fly

fly -t default login \
    -c $CONCOURSE_URL \
    -u $FLY_USERNAME \
    -p $FLY_PASSWORD \
    -n $CONCOURSE_TEAM

fly -t default set-pipeline \
    -n $CONCOURSE_TEAM \
    -p $1 \
    -c /scripts/pipeline.yaml \
    -v concourse-team=$CONCOURSE_TEAM \
    -v concourse-url=$CONCOURSE_URL \
    -v fly-username=$FLY_USERNAME \
    -v fly-password=$FLY_PASSWORD \
    -v github-access-token=$GITHUB_ACCESS_TOKEN \
    -v github-org=$1 \
    -v github-org-resource-image=$GITHUB_ORG_RESOURCE_IMAGE \
    -v github-org-resource-tag=$GITHUB_ORG_RESOURCE_TAG \
    -v github-webhook-token=$GITHUB_WEBHOOK_TOKEN \
    -v kubernetes-ca-cert=$KUBERNETES_CA_CERT \
    -v kubernetes-token=$KUBERNETES_TOKEN
