#!/usr/bin/env bash

set -a

cd ios || exit
flutter clean
flutter pub get
rm Podfile.lock
pod install
git add .
