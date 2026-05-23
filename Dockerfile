FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /usr/local/bin/

COPY pyproject.toml README.md LICENSE ./
COPY src ./src

RUN uv pip install --system .

EXPOSE 8000

CMD fastmcp run grok_search.server:mcp --transport streamable-http --host 0.0.0.0 --port ${PORT:-8000} --path /mcp/ --no-banner
