from django.apps import AppConfig

# кастомна модель user, де ми можемо змінювати поля та прописувати свій функціонал
# змінюємо AUTH_USER_MODEL в settings, щоб використовувати саме цього user

class UserConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'apps.user'
