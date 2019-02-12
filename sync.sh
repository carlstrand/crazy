#!/bin/sh

echo "Clean"
git clean -x -f

echo "Download"
git fetch origin

echo "Apply the fetched source"
git reset --hard origin/master