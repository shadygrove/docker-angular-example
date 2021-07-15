# base image
FROM node:16.5.0 as base

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json

FROM base as dev
RUN npm install
# add app src
COPY . /app
# start app
CMD ng serve --host 0.0.0.0

FROM base as test
# install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -y google-chrome-stable xvfb procps
# Install dependencies
RUN npm install
# add app src
COPY . /app
# start app
CMD npm run test