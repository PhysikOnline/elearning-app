FROM node:latest
# FROM jshimko/meteor-launchpad:latest
RUN curl https://install.meteor.com/ | sh
USER node
RUN ["meteor", "--version"]