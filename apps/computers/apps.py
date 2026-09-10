from django.apps import AppConfig


# клас конфігурації застосунку
class ComputersConfig(AppConfig):
    # Вказуємо тип поля, яке Django автоматично використовуватиме як первинний ключ (id),
    # якщо він явно не визначений у моделі.
    default_auto_field = 'django.db.models.BigAutoField' # це ціле число великого діапазону,
                                                # яке автоматично збільшується при створенні нових записів.
    name = 'apps.computers'
