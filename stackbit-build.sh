#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e6e2bdac11be8001a7835ad/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e6e2bdac11be8001a7835ad
curl -s -X POST https://api.stackbit.com/project/5e6e2bdac11be8001a7835ad/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e6e2bdac11be8001a7835ad/webhook/build/publish > /dev/null
