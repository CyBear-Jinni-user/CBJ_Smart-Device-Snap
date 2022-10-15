#!/bin/bash

echo "Making native executable of the project"

scripts/bashScripts/dartSdkDownload.sh # Downloading dart-sdk for the correct architecture.

unzip dartsdk-*.zip
rm dartsdk-*.zip

dart-sdk/bin/pub get --no-precompile
dart-sdk/bin/dart run build_runner build --delete-conflicting-outputs


#chmod -R +rx dart-sdk/
dart-sdk/bin/dart2native cbj_smart-device/bin/main.dart -o Cbj-Smart-Device
# sudo dart-sdk/bin/dart cbj_smart-device/bin/main.dart .

rm -r dart-sdk/
