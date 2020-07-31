FROM crystallang/crystal:0.35.1 AS luckybuild

RUN git clone https://github.com/luckyframework/lucky_cli.git
WORKDIR /lucky_cli
RUN git checkout -b v0.23.0
RUN shards install
RUN crystal build src/lucky.cr --release --no-debug

FROM crystallang/crystal:0.35.1
COPY --from=luckybuild /lucky_cli/lucky /usr/local/bin
RUN sh -c 'apt-get update && apt-get install -y wget tmux postgresql-client && rm -rf /var/lib/apt/lists/*'
RUN wget -O - https://github.com/DarthSim/overmind/releases/download/v2.0.0.beta1/overmind-v2.0.0.beta1-linux-amd64.gz | gunzip -c > /usr/local/bin/overmind
RUN chmod +x /usr/local/bin/overmind
RUN wget https://github.com/watchexec/watchexec/releases/download/1.10.0/watchexec-1.10.0-x86_64-unknown-linux-gnu.deb && dpkg -i watchexec*.deb && rm watchexec*.deb

RUN apt-get update \
    && apt-get install -y curl \
    && apt-get install -y libargon2-0-dev \
    && apt-get -y autoclean \
	&& apt-get -y install build-essential 

COPY ./simple_server /app
WORKDIR /app

# $(pwd)/docker-app/simple_server