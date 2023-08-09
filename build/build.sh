#!/bin/bash
echo "\nStarting build...\n"
rm -rf dev/ dist/
mkdir dev/ dist/
echo "Target cleared...\n"
tsc -p build/tsconfig.types.json &
webpack --config build/webpack.config.js &
echo "export * from '../dist/index';" | tee dev/index.d.ts dev/index.bundle.d.ts > /dev/null &
echo "export * from './index';" | tee dist/index.bundle.d.ts > /dev/null &
wait
echo "\nBuild done!"