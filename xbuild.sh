#$1 = scheme name. usually project name.
 
export ARCHIVE_PATH=/Volumes/Home/Developing/elance.com/iPad/POD_RBSWorldIPad/RBSWorldIPad/build/archive
#/usr/home/source/archives
#rm -rf $ARCHIVE_PATH/RBSWorldIPad*
 
#rm -rf build
#mkdir build
 
#xcodebuild -workspace RBSWorldIPad.xcworkspace -scheme RBSWorldIPad archive -archivePath $ARCHIVE_PATH/$1.xcarchive
 
xcodebuild -exportArchive -exportFormat IPA -exportPath "build/RBSWorldIPad.ipa" -archivePath  "$ARCHIVE_PATH/RBSWorldIPad.xcarchive" 
#-exportProvisioningProfile "iOS Team Provisioning Profile: *"
 
#1. use testflight
#2. open using itunes to sync it up to the client device.