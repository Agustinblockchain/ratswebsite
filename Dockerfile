FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy over project source
COPY . .

# Install package dependencies
RUN yarn install
RUN yarn prisma migrate

# Install sass
RUN yarn global add sass

# Expose the http port
EXPOSE ${HTTP_PORT}

RUN yarn tsc
RUN yarn sass --style=compressed ./static/stylesheets/style.scss ./static/stylesheets/style.css

CMD [ "node", "dist/index.js" ]