from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models
from django.db.models import CASCADE

from apps.computer_shops.models import ComputerShopModel
from apps.core.models import BaseModel


class ComputerModel(BaseModel):
    class Meta:
        db_table = 'computers'
        #вказуємо назву таблиці

    brand = models.CharField(max_length=20)
    model = models.CharField(max_length=20)
    price = models.IntegerField(
        validators=[
            MinValueValidator(1000)
        ]
    )
    year = models.IntegerField(
        validators=[
            MinValueValidator(2000),
            MaxValueValidator(2027)
        ]
    )
    avail_status = models.BooleanField(default=True)
    cpu = models.CharField(max_length=15)
    ram = models.IntegerField(
        validators=[MinValueValidator(4)]
    )
    # звʼязок "багато до одного" -->  ComputerShop --> Computer 1, Computer 2, ...
    computer_shop = models.ForeignKey(  # привʼязуємо "компʼютер" до відповідного "магазину"
        ComputerShopModel, # вказуємо модель, з якою встановлюється звʼязок
        on_delete=CASCADE, # визначаємо, що робити, якщо повʼязаний магазин буде видалений
        related_name='computers' # Назва зворотного зв'язку від магазину до його комп'ютерів
                                    # (юзаємо в computer_shops/serializers)
    )
    # CASCADE - якщо видаляється батьківський обʼєкт, автоматично видаляються всі повʼязані дочірні елементи
    # PROTECTED - не дозволяє видалити батьківський обʼєкт, якщо існує хоч один дочірній
    # SET_NULL - при видаленні батьківського елементу, поле, що було привʼязане у дочірньому елементі, стає нулем
                                # при видаленні магазину, computer_shop у повʼязаних сутностей computer стане 0
