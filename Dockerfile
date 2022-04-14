FROM richardtin/docker-android-sdk:api-30-ndk-r21d

RUN apt-get -qq update
RUN apt-get -y -qq install gradle
RUN git clone --recurse-submodules --depth 1 https://github.com/love2d/love-android
RUN cd love-android
RUN chmod +x gradlew

#apk generation
RUN ./gradlew assembleEmbedNoRecordRelease

#for the aab
RUN ./gradlew bundleEmbedNoRecordRelease

ENTRYPOINT bash