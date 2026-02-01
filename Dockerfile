FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app/
COPY start.sh .
RUN chmod +x start.sh

# Railway sets PORT env var; default to 8000 for local development
ENV PORT=8000
EXPOSE 8000

# Use startup script to ensure proper variable expansion
CMD ["./start.sh"]
