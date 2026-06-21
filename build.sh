#!/usr/bin/env bash

rm -rf build

echo "* Creating build folder"
mkdir build

echo "* Copying files"
cp -r src/* build/

echo "* packing tar.gz file"
tar -czf PEKI.tar.gz -C build .
rm -rf build/*
rm -rf build/.*
mv PEKI.tar.gz build/