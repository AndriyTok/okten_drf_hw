from django.apps import AppConfig

# створюємо "ап" для магазинів компʼютерів, щоб продемонструвати звʼязок "один до багатьох"


class ComputerShopsConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'apps.computer_shops'
