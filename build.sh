#!/usr/bin/env bash

set -e

rm -rf build

echo "* Creating build folder"
mkdir build

echo "* packing KUAL jar"
PACKED_KUAL_DATA=$(cat src/KUAL.jar | xz -9 | base64 -w 0)
cat src/KUAL.sh | sed -e "s|PACKED_KUAL_DATA|$PACKED_KUAL_DATA|g" > build/KUAL.sh

echo "* packing tar.gz file"
tar -czf PEKI.tar.gz -C build .
rm -rf build/*
rm -rf build/.*
mv PEKI.tar.gz build/