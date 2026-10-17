from django.apps import AppConfig

# у core прописуємо загальні для всього проекту сервіси, абстрактний клас моделі, та інші reusable елементи

class CoreConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'core'
