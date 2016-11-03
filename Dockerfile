FROM node:boron
MAINTAINER Wxy

# Install app dependencies
RUN apt-get update && apt-get install -y python3-pip pdftk

RUN useradd -ms /bin/bash nicp_node
USER nicp_node

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Bundle app source
COPY . /usr/src/app

RUN pip3 install -r requirement.txt && npm install

EXPOSE 3000
CMD [ "npm", "start" ]