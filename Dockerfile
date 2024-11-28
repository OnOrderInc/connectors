FROM python:3.11-slim-bookworm
RUN apt update && apt upgrade -y && apt install make git gcc -y
COPY . /app
WORKDIR /app
RUN make clean install
RUN ln -s .venv/bin /app/bin
ENTRYPOINT ["/app/bin/elastic-ingest"]
CMD ["-c", "/app/config.yml"]
