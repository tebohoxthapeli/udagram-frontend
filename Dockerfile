## Build
FROM beevelop/ionic:latest AS ionic
#new
RUN apt-get -y update
# new
RUN mkdir -p /usr/src/app
RUN mkdir -p /usr/share/nginx/html
# Create app directory
WORKDIR /usr/src/app
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json /usr/src/app
# Install app dependencies
# RUN npm ci
RUN npm clean-install -f
# Bundle app source
COPY . /usr/src/app
RUN ionic build
# new
EXPOSE 8100
# Run
FROM nginx:alpine
#COPY www /usr/share/nginx/html
COPY --from=ionic  /usr/src/app/www /usr/share/nginx/html
CMD [ "/bin/sh", "ionic", "serve" ]