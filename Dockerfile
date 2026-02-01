FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app/

# Railway sets PORT env var; default to 8000 for local development
ENV PORT=8000
EXPOSE 8000

# Use shell form to ensure $PORT is expanded at runtime
CMD ["/bin/sh", "-c", "uvicorn app.main:app --host 0.0.0.0 --port ${PORT}"]
