FROM python:3.11-slim

WORKDIR /opt/tg-ws-proxy

RUN apt-get update && \
    apt-get install -y --no-install-recommends git curl xxd && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Flowseal/tg-ws-proxy.git /opt/tg-ws-proxy

RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir -e .

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENV PATH="/opt/venv/bin:$PATH"
ENV HOST=0.0.0.0
ENV PORT=8446
ENV FAKE_TLS_DOMAIN=""
ENV SECRET=""
ENV PUBLIC_ADDRESS=""
ENV PUBLIC_PORT=""

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
