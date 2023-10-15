#!/bin/sh

swift package --allow-writing-to-directory docs generate-documentation --target Romita --disable-indexing --include-extended-types --transform-for-static-hosting --hosting-base-path https://kosoku.github.io/Romita/ --output-path docs --platform "name=iOS,version=14.0.0"