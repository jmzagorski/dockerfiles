FROM adoptopenjdk/openjdk16:alpine
ENV PLANTUML_VERSION=1.2023.13
ENV LANG en_US.UTF-8

RUN \
  apk add --no-cache graphviz wget ttf-dejavu fontconfig && \
  wget "https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar" -O plantuml.jar && \
  apk del wget

RUN ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-version"]
RUN ["dot", "-version"]
ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-p"]
CMD ["-tsvg"]
