# Dockerfiles
> Personal Dockerfiles

This repository contains Dockerfiles for images I use daily or every once in a
while so I can experiment/use binaries/programs without having to install the
dependencies. Most of my time is spent developing in a container with vim and
other dependencies required by the project or application.

All images can be built on your host using `docker compose build <service>` for your
convenience. See the [compose file](./compose.yml) for the details and environment
variables to customize the image.

Additionally, all images can be pulled from https://ghcr.io/jmzagorski, using the image name
and optional tag as the last path parameter. See the table below for more details.

## [scripts](./scripts)
Docker commands when custom images are not needed.

## bin images
Images prefixed with **bin** are meant to be run, removed and the output mapped
to the host. These are cli tools with dependencies.

## dev images
Images prefixed with **dev** are meant to be a full development environment to
code with all dependencies for the application/project, VIM, and VIM
dependencies.

## [examples](./examples)
I provide some examples on how to setup a container if additional configuration
is needed or if it improves the container experience. When building images and running
containers, I use a `.env` file to store personal preferences. See the examples
for more details.

## Images


| Dockerfile | Service | Summary | Running |
|------------|---------|---------|---------|
| [Plantuml](./plantuml/Dockerfile) | [plantuml](./compose.yaml#L3) | https://plantuml.com/ | `cat diagram.puml \| docker run --rm -i ghcr.io/jmzagorski/bin/plantuml > output.svg` |
| [Toilet](./toilet/Dockerfile) | [toilet](./compose.yaml#L7) | http://caca.zoy.org/wiki/toilet/ | `docker run --rm ghcr.io/jmzagorski/bin/toilet -w 200 -f letter Hello World` |
| [Dotnet](./dotnet/Dockerfile) | [dotnet](./compose.yaml#L11) | Personal [dotnet](https://dotnet.microsoft.com/en-us/download/visual-studio-sdks/) dev environment | `docker run -it --rm ghcr.io/jmzagorski/dev/dotnet bash` or see [compose example](./examples/compose.yamlL#3) |
| [Puppeteer](./puppeteer/Dockerfile) | [puppeteer](./compose.yaml#L21) | Personal [puppeteer](https://pptr.dev/) dev environment | `docker run -it --rm ghcr.io/jmzagorski/dev/puppeteer bash` or see [compose example](./examples/compose.yaml#L23) |
| [JWT](./jwt/Dockerfile) | [jwt](./compose.yaml#L28) | [JWT](https://jwt.io) generator | `docker run -it --rm ghcr.io/jmzagorski/bin/jwt 'mysecreet' '"aud":"you","sub":"me"'` |
