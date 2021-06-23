FROM node as base
RUN apt-get update
RUN yarn global add typescript ts-node pm2

FROM base as install
COPY service/ /home/service
WORKDIR /home/service
RUN chmod a+x *.sh
#Uncomment line below on production to install dependencies
#RUN yarn install

FROM install as prod
CMD yarn run start

FROM install as dev
RUN apt-get install -y rsync
CMD while sleep 60; do : ; done