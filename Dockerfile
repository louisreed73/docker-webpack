FROM node:9-alpine

# Needed to Ctrl-C when using --watch
RUN apk add --no-cache tini curl
ENTRYPOINT ["/sbin/tini", "--"]

WORKDIR /app

RUN npm install -g webpack@~4 webpack-cli
RUN npm install -g --unsafe-perm node-sass
RUN npm install -g typescript@~2.8 ts-loader sass-loader style-loader css-loader resolve-url-loader file-loader url-loader html-webpack-plugin extract-text-webpack-plugin@^4.0.0-beta.0 clean-webpack-plugin webpack-manifest-plugin
RUN npm install -g webpack-dev-server

# global binary apps won't run without this
ENV NODE_PATH /usr/local/lib/node_modules

CMD ["webpack", "-p"]
