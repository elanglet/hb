# Définition d'une variable. Sa valeur pourra être remplacée au moment du build avec l'option --build-arg
ARG version=latest
FROM ubuntu:$version
#MAINTAINER JCD "jcd717@outlook.com"

LABEL maintainer="JCD <jcd717@outlook.com>" \
      description="test" \
      auteur="bruno dubois"

COPY heartbeat.sh /entrypoint.sh
# Copie de répertoire
COPY work/ travail/test/

RUN chmod +x /entrypoint.sh ; \
    echo coucou >test.txt

ARG hbs=3
ENV HEARTBEATSTEP $hbs


# information de port réseau utile
EXPOSE 1234/udp 4321/tcp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["Coucou"]

RUN useradd etienne
USER etienne

HEALTHCHECK --interval=60s --timeout=30s --start-period=60s --retries=1 CMD false
