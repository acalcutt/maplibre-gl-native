#!/bin/bash

node -v
cat /etc/os-release
uname -m

cd /data
npm run build

xvfb-run --auto-servernum ./build/mbgl-render-test-runner --manifestPath metrics/macos-xcode11-release-style.json
xvfb-run --auto-servernum npm test