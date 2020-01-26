# docker-sdkman
Minimal docker image providing sdkman for quick JVM-based image building

The image is based on the latest ubuntu minimal image (~24mb) and provides:

* bash 5.0 (default shell)
* curl
* (un)zip
* sdk

Note: `sdk` is usable from `RUN` but **not** from `ENTRYPOINT` or `CMD`

## Docker example

Creating slim docker containers with any combination of Java, Scala and sbt is as simple as:

  ```docker
  FROM matticala/sdkman

  RUN sdk install java 11.0.6.j9-adpt
  RUN sdk install sbt
  RUN sdk install scala 2.11.12
  ```

or, GraalVM:

  ```docker
  FROM matticala/sdkman

  RUN sdk install java 19.3.1.r11-grl
  ...
  ```

## Available JDKs and SDKs

See https://sdkman.io/jdks and https://sdkman.io/sdks

## `sdk` commands

See https://sdkman.io/usage
