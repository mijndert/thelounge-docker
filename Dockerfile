FROM node:8-alpine

ENV NODE_ENV production
ENV THELOUNGE_HOME "/var/opt/thelounge"
ENV PORT 9000

ARG THELOUNGE_VERSION=3.0.0-pre.6
RUN apk --update add --no-cache sudo \
    && yarn global add thelounge@${THELOUNGE_VERSION} --exact \
    && yarn cache clean

EXPOSE ${PORT}
VOLUME "${THELOUNGE_HOME}"

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [""]
