FROM node:latest

# install meteor
RUN curl https://install.meteor.com/ | sh


COPY ./ /usr/src/app
USER node

# this command seems useless, but meteor is installing some stuff 
# when you execute it the first time. This is why we run it here
RUN ["meteor", "--version"]

# setting the working directory
WORKDIR /usr/src/app


# USER root
ENV PORT=3000
# ENV MONGO_URL=mongodb://$MONGO_URL:$MONGO_PORT/$MONGO_DB
ENV ROOT_URL=http://$APP_DOMAIN:$APP_PORT/

# install npm dependencies
USER root
RUN [ "npm", "install" ]
RUN chown -R node:node /usr/src/app/*
USER node

# run the code
CMD [ "meteor" ]
EXPOSE 3000