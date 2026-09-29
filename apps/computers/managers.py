from django.db import models


# Власний QuerySet для додаткових методів фільтрації
class ComputerQuerySet(models.QuerySet):
    def less_than_price(self, price):
        return self.filter(price__lt=price)

    def only_brand(self, brand):
        return self.filter(brand=brand)

# Власний Manager для роботи з ComputerQuerySet
class ComputerManager(models.Manager):
    def get_queryset(self) -> ComputerQuerySet:
        return ComputerQuerySet(self.model)

    def less_than_price(self, size):
        return self.get_queryset().less_than_price(size)
    # Manager дозволяє безпосередньо звертатися до кастомних функцій для роботи з БД, якщо підключити у models.py

    def only_brand(self, brand):
        return self.get_queryset().only_brand(brand)
