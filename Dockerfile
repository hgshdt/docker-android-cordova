FROM alvrme/alpine-android:android-29

ENV CORDOVA_CLI "10.0.0"
ENV GRADLE_VERSION "6.5"

# Install required dependencies
RUN apk add --no-cache nodejs npm wget

# Install npm packages
RUN npm install -g cordova@${CORDOVA_CLI} && \
    npm install -g commander && \
    cordova telemetry off
ENV NODE_PATH "/usr/lib/node_modules"

# Install gradle
ARG gradle_dists="/root/.gradle/wrapper/dists"
RUN mkdir -p $gradle_dists && \
    wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip -O $gradle_dists/gradle-${GRADLE_VERSION}-all.zip && \
    unzip -q -d $gradle_dists $gradle_dists/gradle-${GRADLE_VERSION}-all.zip
ENV CORDOVA_ANDROID_GRADLE_DISTRIBUTION_URL file://$gradle_dists/gradle-${GRADLE_VERSION}-all.zip
ENV PATH $PATH:$gradle_dists/gradle-${GRADLE_VERSION}/bin

VOLUME /workspace
WORKDIR /workspace

ENTRYPOINT [ "cordova" ]
