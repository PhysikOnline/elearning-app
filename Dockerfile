FROM node:latest
# FROM jshimko/meteor-launchpad:latest
USER node
RUN curl https://install.meteor.com/ | sh