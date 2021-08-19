
# 1 libs
create() {
    
    for lib in $1
    do
        echo "creating for $lib"

        # ios
        command="xcodebuild -create-xcframework "
        command+="-framework prebuilt/ios-xcframework/.tmp/ios-arm64/$lib.framework "
        command+="-framework prebuilt/ios-xcframework/.tmp/ios-x86_64/$lib.framework "
        command+="-framework prebuilt/ios-xcframework/.tmp/ios-x86_64-mac-catalyst/$lib.framework "
        
        # tvos
        command+="-framework prebuilt/tvos-xcframework/.tmp/tvos-arm64/$lib.framework "
        command+="-framework prebuilt/tvos-xcframework/.tmp/tvos-x86_64/$lib.framework "

        command+="-output prebuilt/universal-xcframework/$lib.xcframework"

        ${command}
    done
}

libs="gmp gnutls libavcodec libavdevice libavfilter libavformat libavutil libhogweed libnettle libswresample libswscale"

create_xcframeworks() {
    rm -rf prebuilt/universal-xcframework

    create "${libs[@]}"
}

create_xcframeworks