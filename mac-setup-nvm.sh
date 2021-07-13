#!/bin/bash

mkdir -p ~/.nvm

## LTS nodejs
nvm install --lts --latest-npm

nvm use "lts/*"
npm install -g typescript
npm install -g ts-node
