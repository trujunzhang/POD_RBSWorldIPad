#!/bin/sh


PROJECT_DIR="/Volumes/AppCache/shared_copy/untitled folder 3/test/RBSWorldIPad"
PROJECT_NAME="RBSWorldIPad"

sketchtool \
       export artboards "/Volumes/AppCache/shared_copy/untitled folder 3/test/iOS-icons.sketch" \
       --output="$PROJECT_DIR"/"$PROJECT_NAME"/Images.xcassets/AppIcon.appiconset \
       --formats="png"