from django.apps import AppConfig


class AuthConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'apps.auth'
    label = 'auth_' # Унікальний label, щоб не конфліктувати з django.contrib.auth
