FROM node:latest
# FROM jshimko/meteor-launchpad:latest
RUN curl https://install.meteor.com/ | sh
# USER root
# RUN mkdir /usr/src/app
# ENV PATH="$HOME/.meteor"
COPY ./ /usr/src/app
USER node
RUN ["meteor", "--version"]
WORKDIR /usr/src/app


# USER root
ENV PORT=3000
ENV MONGO_URL=mongodb://$MONGO_URL:$MONGO_PORT/$MONGO_DB
ENV ROOT_URL=http://$APP_DOMAIN:$APP_PORT/

USER root
RUN [ "npm", "install" ]
USER node

CMD [ "meteor" ]
EXPOSE 3000