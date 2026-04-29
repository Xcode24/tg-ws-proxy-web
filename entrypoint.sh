#!/bin/bash
set -e

HOST="${HOST:-0.0.0.0}"
PORT="${PORT:-8446}"
SECRET="${SECRET:-}"
FAKE_TLS_DOMAIN="${FAKE_TLS_DOMAIN:-}"
PUBLIC_ADDRESS="${PUBLIC_ADDRESS:-}"
PUBLIC_PORT="${PUBLIC_PORT:-}"

# Определяем внешний IP, если не задан PUBLIC_ADDRESS
if [ -z "$PUBLIC_ADDRESS" ]; then
    echo "PUBLIC_ADDRESS not set, detecting external IP..."
    PUBLIC_ADDRESS=$(curl -sf --connect-timeout 3 ifconfig.me || echo "")
    if [ -z "$PUBLIC_ADDRESS" ]; then
        echo "WARNING: Could not detect external IP. Using 127.0.0.1"
        PUBLIC_ADDRESS="127.0.0.1"
    else
        echo "Detected external IP: $PUBLIC_ADDRESS"
    fi
fi

# Формируем ee-секрет с доменом, если включён Fake TLS
if [ -n "$FAKE_TLS_DOMAIN" ]; then
    DOMAIN_HEX=$(echo -n "$FAKE_TLS_DOMAIN" | xxd -p -u | tr -d '\n')
    SECRET_FULL="ee${SECRET}${DOMAIN_HEX}"
else
    SECRET_FULL="$SECRET"
fi

PROXY_PORT="${PUBLIC_PORT:-9443}"
LINK="tg://proxy?server=${PUBLIC_ADDRESS}&port=${PROXY_PORT}&secret=${SECRET_FULL}"
echo "============================================="
echo "   TG Proxy link:"
echo "   $LINK"
echo "============================================="

# Запуск прокси с необходимыми флагами
CMD="/opt/venv/bin/python /opt/tg-ws-proxy/proxy/tg_ws_proxy.py \
    --host $HOST \
    --port $PORT \
    --proxy-protocol"

[ -n "$SECRET" ] && CMD="$CMD --secret $SECRET"
[ -n "$FAKE_TLS_DOMAIN" ] && CMD="$CMD --fake-tls-domain $FAKE_TLS_DOMAIN"

echo "Starting proxy: $CMD"
exec $CMD
