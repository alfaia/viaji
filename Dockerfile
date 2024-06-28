FROM python:3.12-alpine

ENV PYTHONDONTWRITEBYTECODE 1

ENV PYTHONUNBUFFERED 1

COPY viaji /viaji

WORKDIR /viaji

RUN apk update \
    && apk add --no-cache gcc musl-dev libffi-dev postgresql-dev \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del gcc musl-dev libffi-dev

# ENV PATH="/scripts:/venv/bin:$PATH"

EXPOSE 8000
