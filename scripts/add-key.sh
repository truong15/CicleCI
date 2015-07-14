#!/bin/bash

main()
{

    security create-keychain -p "$keychain_password" ios-build.keychain
    security import "./scripts/apple.cer" -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
    security import "./scripts/dist.cer" -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
    security import "./scripts/dist.p12" -k ~/Library/Keychains/ios-build.keychain -P "$p12_file_password" -T /usr/bin/codesign
    security list-keychain -s ~/Library/Keychains/ios-build.keychain
    security unlock-keychain -p "" ~/Library/Keychains/ios-build.keychain

    mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
    cp "./scripts"/*.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
}

#main "./certificates" "$P12_FILE_PASSWORD"

