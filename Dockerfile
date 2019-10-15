# Base image
FROM node:12.12.0-alpine

# Base dependencies
RUN apk add --no-cache \
  curl

# DynamoDB Admin
ADD package.json package-lock.json /application/
WORKDIR /application
RUN npm install

# Expose ports
EXPOSE 8001

# Healthcheck
ADD ./docker-healthcheck.sh /usr/local/bin/docker-healthcheck
RUN chmod +x /usr/local/bin/docker-healthcheck
HEALTHCHECK CMD docker-healthcheck

# Startup
ENTRYPOINT ["/application/node_modules/.bin/dynamodb-admin"]
