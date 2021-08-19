./ios.sh -f -x \
            --enable-gmp \
            --enable-gnutls \
            --disable-armv7 \
            --disable-armv7s \
            --disable-i386 \
            --enable-ios-audiotoolbox \
            --enable-ios-avfoundation \
            --enable-ios-bzip2 \
            --enable-ios-zlib \
            --enable-ios-libiconv


            --disable-x86-64 \
            --disable-x86-64-mac-catalyst \

./tvos.sh -f \
            --enable-gmp \
            --enable-gnutls \
            --enable-tvos-audiotoolbox \
            --enable-tvos-bzip2 \
            --enable-tvos-videotoolbox \
            --enable-tvos-zlib \
            --enable-tvos-libiconv

./android.sh -f \
            --redownload-gmp \
            --redownload-gnutls \
            --reconf-gmp \
            --reconf-gnutls \
            --rebuild-gmp \
            --rebuild-gnutls \
            --enable-gmp \
            --enable-gnutls \
            --disable-x86 \
            --disable-x86-64 \
            --lts

./android.sh -f \
            --no-output-redirection -d \
            --enable-gnutls \
            --disable-x86-64 \
            --disable-x86 \
            --disable-arm64-v8a \
            --disable-arm-v7a-neon \
            --lts

./android.sh -f \
            --no-output-redirection -d \
            --enable-gnutls \
            --disable-x86 \
            --disable-arm64-v8a \
            --disable-arm-v7a-neon \
            --disable-arm-v7a \
            --lts

./android.sh -f \
            --enable-gmp \
            --enable-gnutls \
            --disable-x86 \
            --disable-x86-64 \
            --disable-arm-v7a-neon \
            --disable-arm-v7a \
            --lts


// final 
./android.sh -f \
            --no-output-redirection -d \
            --enable-gnutls \
            --lts
            