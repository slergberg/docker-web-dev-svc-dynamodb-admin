# Base image
FROM node:alpine

# Base dependencies
RUN apk add --no-cache \
  curl

# DynamoDB Admin
RUN npm install -g dynamodb-admin

# Expose ports
EXPOSE 8001

# Healthcheck
ADD ./docker-healthcheck.sh /usr/local/bin/docker-healthcheck
RUN chmod +x /usr/local/bin/docker-healthcheck
HEALTHCHECK CMD docker-healthcheck

# Startup
ENTRYPOINT ["dynamodb-admin"]
