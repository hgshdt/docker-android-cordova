# docker-android-cordova

## Docker build

```sh
$ docker build -t docker-android-cordova .
```

## Docker run

```sh
$ docker run -it --rm -v `pwd`:/workspace docker-android-cordova --version
$ docker run -it --rm -v `pwd`:/workspace docker-android-cordova create test com.example.test test
$ cd test
$ docker run -it --rm -v `pwd`:/workspace docker-android-cordova platform add android@9.1.0
$ docker run -it --rm -v `pwd`:/workspace docker-android-cordova build android
```
