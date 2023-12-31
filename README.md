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

| Dockerfile | Service | Summary | Pull | Running |
|------------|---------|---------|---------|---------|
| [Plantuml](./plantuml/Dockerfile) | [plantuml](./compose.yaml#L2) | See https://plantuml.com/ | `docker pull https://ghcr.io/jmzagorski/bin/plantuml` | `cat diagram.puml \| docker run --rm -i ghcr.io/jmzagorski/bin/plantuml > output.svg` |
