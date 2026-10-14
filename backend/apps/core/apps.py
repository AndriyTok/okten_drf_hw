from django.apps import AppConfig

# у apps.core прописуємо загальні для всього проекту сервіси, абстрактний клас моделі, та інші reusable елементи

class CoreConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'apps.core'
