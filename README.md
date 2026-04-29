# TG WS Proxy (Docker + Web Panel)

Fork of [Flowseal/tg-ws-proxy](https://github.com/Flowseal/tg-ws-proxy) with Docker Compose, Nginx stream, Fake TLS support, and a web page displaying the proxy link.

## Features
- **Docker Compose** – quick deployment in containers
- **Fake TLS** – traffic obfuscation without real certificates
- **Nginx stream** – TCP forwarding with client IP preservation
- **Web panel** – page with ready-to-use `tg://proxy` link (separate port)
- **Flexible configuration** – all settings via `.env` (ports, secret, domain)

## Quick Start
1. Clone the repository
2. Generate a secret: `openssl rand -hex 16`
3. Fill in `.env` (secret, domain for obfuscation, ports)
4. `docker compose up -d --build`

The proxy will be available on `PUBLIC_PORT`, the web panel on `WEB_PORT`.

## Environment Variables (`.env`)
| Variable | Description |
|------------|----------|
| `PUBLIC_PORT` | External port for proxy (clients connect here) |
| `WEB_PORT` | External port for the web page with the link |
| `SECRET` | 32 hex characters (generate with `openssl rand -hex 16`) |
| `FAKE_TLS_DOMAIN` | Domain for Fake TLS obfuscation (leave empty to disable) |
| `PUBLIC_ADDRESS` | Server external IP/domain (auto-detected if empty) |

# TG WS Proxy (Docker + веб-панель)

Форк проекта [Flowseal/tg-ws-proxy](https://github.com/Flowseal/tg-ws-proxy) с удобным Docker‑развёртыванием, веб‑страницей для получения ссылки и поддержкой Fake TLS через Nginx stream.

## Особенности
- **Docker Compose** – всё в контейнере, быстрый старт
- **Fake TLS** – маскировка трафика без реальных сертификатов
- **Nginx stream** – проброс TCP с сохранением реальных IP клиентов
- **Веб-панель** – страница с готовой `tg://proxy` ссылкой (отдельный порт)
- **Гибкая настройка** – все параметры через `.env` (порты, секрет, домен)

## Быстрый старт
1. Склонируйте репозиторий
2. Сгенерируйте секрет: `openssl rand -hex 16`
3. Заполните `.env` (секрет, домен для маскировки, порты)
4. `docker compose up -d --build`

Прокси будет доступен на порту `PUBLIC_PORT`, веб-панель – на `WEB_PORT`.

## Переменные окружения (`.env`)
| Переменная | Описание |
|------------|----------|
| `PUBLIC_PORT` | Внешний порт для прокси (клиенты подключаются сюда) |
| `WEB_PORT` | Внешний порт для веб-страницы со ссылкой |
| `SECRET` | 32 hex символа (генерируется `openssl rand -hex 16`) |
| `FAKE_TLS_DOMAIN` | Домен для обфускации Fake TLS (если не нужен – оставить пустым) |
| `PUBLIC_ADDRESS` | Внешний IP/домен сервера (если пусто – определится автоматически) |