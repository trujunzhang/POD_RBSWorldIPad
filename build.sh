#!/bin/sh
xctool \
    -workspace RBSWorldIPad.xcworkspace \
    -scheme RBSWorldIPad \
    -sdk iphonesimulator8.1 \
    build 
