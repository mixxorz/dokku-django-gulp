FROM python:2.7
ENV PYTHONUNBUFFERED 1

# Install Node
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys 7937DFD2AB06298B2293C3187D33FF9D0246406D 114F43EE0176B71C7BC219DD50A3051F888C628D
RUN NODE_VERSION=$(curl https://semver.io/node/stable) \
    && NPM_VERSION=$(curl https://semver.io/npm/stable) \
    && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
    && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
    && gpg --verify SHASUMS256.txt.asc \
    && grep " node-v$NODE_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
    && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
    && rm "node-v$NODE_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc \
    && npm install -g npm@"$NPM_VERSION" \
    && npm cache clear

# Install Gulp
RUN npm install -g gulp

RUN mkdir /webapp
WORKDIR /webapp/

# Install npm dependencies
COPY package.json package.json
RUN npm install

# Install pip dependencies
COPY requirements.txt requirements.txt
COPY prod-requirements.txt prod-requirements.txt
RUN pip install -r requirements.txt \
    && pip install -r prod-requirements.txt

# Copy the project
COPY . /webapp/

# Build the assets
RUN gulp sass

EXPOSE 5000

CMD ["./deploy/deploy_script.sh"]
