#! /bin/bash

set -euo pipefail

rm -f  site/index.html
rm -rf site/dist

mkdir -p site/dist

function buildcsshtml {
    bun ./node_modules/clean-css-cli/bin/cleancss -O3 -b site/index.css -o site/dist;
    bun ./node_modules/html-minifier/cli.js site/index.max.html --collapse-whitespace -o site/index.html;
}

buildcsshtml
