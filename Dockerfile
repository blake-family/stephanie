from node:8-alpine

RUN yarn global add bower grunt-cli

RUN apk --update --no-cache add bash git openssh-client

USER node
