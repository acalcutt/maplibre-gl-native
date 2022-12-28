#!/bin/bash

node -v
cat /etc/os-release
uname -m

cp -R /data /usr/src/app

cd /usr/src/app
npm run build

xvfb-run --auto-servernum ./build/mbgl-render-test-runner --manifestPath metrics/macos-xcode11-release-style.json
xvfb-run --auto-servernum npm test