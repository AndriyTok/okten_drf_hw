# базовий образ на базі Alpine-Linux
FROM python:3.14-alpine

# автор dockerfile
MAINTAINER andrii_dev

# змінні середовища
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VERSION=2.3.2 \
    POETRY_NO_INTERACTION=1 \
    DEBIAN_FRONTEND=noninteractive \
    COLUMNS=88

# оновлення репозиторію linux
RUN apk update

# Встановлюємо системні пакети, необхідні для роботи та збирання Python-залежностей
RUN apk add --no-cache gcc musl-dev mariadb-dev curl

# створюємо директорію для файлів проєкту всередині контейнера
RUN mkdir /app
# робимо ./app робочою директорією за замовчуванням
WORKDIR /app

# вказуємо директорію, у яку буде встановлено poetry
ENV POETRY_HOME=/usr/local/poetry
# завантажуємо та запускаємо офіційний інсталятор poetry
RUN curl -sSl https://install.python-poetry.org | python3
# додаємо poetry до змінних середовища, щоб викликати його з будь-якої директорії
ENV PATH=$POETRY_HOME/bin:$PATH

# копіюємо конфіг залежностей нашого проекту в ./app
COPY pyproject.toml /app/

# вимикаємо створення віртуальних середовищ poetry
# залежності будуть встановлюватися безпосередньо в середовище python-контейнера
RUN poetry config virtualenvs.create false
RUN poetry lock
RUN poetry install