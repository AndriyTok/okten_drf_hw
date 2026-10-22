# Адреса Redis, який Celery використовує як брокер повідомлень між Django та воркерами.
# redis — назва сервісу Redis у Docker Compose.
# 6379 — стандартний порт Redis, 0 — номер бази даних Redis.
CELERY_BROKER_URL = 'redis://redis:6379/0'

# Зберігання результатів виконання Celery-задач у базі даних Django.
CELERY_RESULTS_BACKEND = 'django-db'

# Дозволені формати даних, які Celery може отримувати та обробляти.
CELERY_ACCEPT_CONTENT = ['application/json']

# Формат серіалізації аргументів під час передавання задач до Celery.
CELERY_TASK_SERIALIZER = 'json'

# Формат серіалізації результатів виконання задач.
CELERY_RESULT_SERIALIZER = 'json'

# Планувальник Celery Beat, який зберігає розклад періодичних задач у базі даних Django.
CELERY_BEAT_SCHEDULER = 'django_celery_beat.schedulers:DatabaseScheduler'