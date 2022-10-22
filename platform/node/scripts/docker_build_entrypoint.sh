#!/bin/bash

node -v
cat /etc/os-release
uname -m

cd /usr/src/app
npm ci --ignore-scripts
npm run build
cp -R ./lib/ /data/lib/

xvfb-run --auto-servernum ./build/mbgl-render-test-runner --manifestPath metrics/macos-xcode11-release-style.json
xvfb-run --auto-servernum npm test