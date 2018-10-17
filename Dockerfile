from node:8-alpine

RUN apk --update --no-cache add bash git openssh-client ruby ruby-dev ruby-io-console build-base

RUN yarn global add bower grunt-cli

# The rdoc install succeeds but gives an error so just ignore it an move on
RUN gem install rdoc || gem install sass

USER node
