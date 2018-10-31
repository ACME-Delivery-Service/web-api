FROM node:10

# This Dockerfile can be used to scaffold new OpenAPI repo.
# It provides youman and relevant "openapi-repo" generator.
#
# Usage:
#
# > docker build -t generator-openapi-repo .
# > docker run -it --rm -v"/absolute/path/to/repo:/repo" generator-openapi-repo
# > # Unfortunately, due to user ids diversity inside container and on the host
# > chown -R $UID:$GID .

USER node
WORKDIR /home/node
# Install node modules in node user's home directory
RUN npm install \
	yo \
	generator-openapi-repo

# path obtained from `npm bin`
ENV PATH=/home/node/node_modules/.bin:$PATH

VOLUME /repo
WORKDIR /repo
CMD yo openapi-repo
