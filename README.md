# TG WS Proxy (Docker + Web Panel)

Fork of [Flowseal/tg-ws-proxy](https://github.com/Flowseal/tg-ws-proxy) with Docker Compose, Nginx stream, Fake TLS support, and a web page displaying the proxy link.

## Features

- **Docker Compose** – quick deployment in containers  
- **Fake TLS** – traffic obfuscation without real certificates  
- **Nginx stream** – TCP forwarding with client IP preservation  
- **Web panel** – page with ready-to-use `tg://proxy` link (separate port)  
- **Flexible configuration** – all settings via `.env` (ports, secret, domain)  

---

## Quick Start

Clone the repository:

```bash
git clone https://github.com/Xcode24/tg-ws-proxy-web.git
cd tg-ws-proxy-web
```

Create `.env` file:

```bash
cp .env.example .env
```

Generate a secret:

```bash
openssl rand -hex 16
```

Start the stack:

```bash
docker compose up -d --build
```

Check logs to get the proxy link:

```bash
docker logs -f tg-proxy-backend
```

Proxy → `PUBLIC_PORT`  
Web panel → `WEB_PORT`

---

## Configuration

Edit `.env`:

- `SECRET` – paste generated secret  
- `FAKE_TLS_DOMAIN` – domain for Fake TLS (optional)  
- `PUBLIC_PORT` – proxy port  
- `WEB_PORT` – web panel port  
- `PUBLIC_ADDRESS` – optional (auto-detected if empty)  

---

## Management

| Command | Description |
|--------|------------|
| `docker compose up -d --build` | Build and start |
| `docker logs -f tg-proxy-backend` | View logs |
| `docker compose down` | Stop |
| `docker compose down -v` | Stop + remove volumes |

---

## Environment Variables (.env)

| Variable | Description |
|----------|------------|
| `PUBLIC_PORT` | Proxy port |
| `WEB_PORT` | Web panel port |
| `SECRET` | 32 hex chars (`openssl rand -hex 16`) |
| `FAKE_TLS_DOMAIN` | Fake TLS domain |
| `PUBLIC_ADDRESS` | External IP/domain |

---

# TG WS Proxy (Docker + веб-панель)

## Быстрый старт

```bash
git clone https://github.com/Xcode24/tg-ws-proxy-web.git
cd tg-ws-proxy-web
cp .env.example .env
openssl rand -hex 16
docker compose up -d --build
```

Логи:

```bash
docker logs -f tg-proxy-backend
```

---

## Настройка

Отредактируйте `.env`:

- `SECRET` – секрет  
- `FAKE_TLS_DOMAIN` – домен (опционально)  
- `PUBLIC_PORT` – порт прокси  
- `WEB_PORT` – порт вебки  
- `PUBLIC_ADDRESS` – IP/домен  

---

## Управление

| Команда | Описание |
|--------|----------|
| `docker compose up -d --build` | Запуск |
| `docker logs -f tg-proxy-backend` | Логи |
| `docker compose down` | Стоп |
| `docker compose down -v` | Стоп + очистка |

---

## Переменные окружения

| Переменная | Описание |
|------------|----------|
| `PUBLIC_PORT` | Порт прокси |
| `WEB_PORT` | Порт вебки |
| `SECRET` | 32 hex |
| `FAKE_TLS_DOMAIN` | Домен |
| `PUBLIC_ADDRESS` | IP/домен |
