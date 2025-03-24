
ARG EX_VSN=1.16.0
ARG OTP_VSN=26.2.1
ARG DEB_VSN=bullseye-20231009-slim

ARG BUILDER_IMG="hexpm/elixir:${EX_VSN}-erlang-${OTP_VSN}-debian-${DEB_VSN}"

FROM ${BUILDER_IMG}

ENV ERL_FLAGS="+JPperf true"

WORKDIR /app

RUN apt-get update && apt-get install -y openssl ca-certificates
RUN update-ca-certificates

RUN mix local.hex --force && mix local.rebar --force

ENV MIX_ENV="prod"
COPY mix.exs mix.lock ./

RUN mix deps.get --only ${MIX_ENV}

RUN mkdir config
COPY config/config.exs config/${MIX_ENV}.exs config/
RUN mix deps.compile
COPY priv priv
COPY lib lib
COPY assets assets
RUN mix assets.deploy
RUN mix compile

COPY config/runtime.exs config/
COPY rel rel
RUN mix release

CMD ["/app/_build/prod/rel/kanban/bin/kanban", "start"]
