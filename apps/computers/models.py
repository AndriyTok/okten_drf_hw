from django.core.validators import MinValueValidator, MaxValueValidator
# для задання мін/макс значення певного
# поля сутності
from django.db import models

from apps.core.models import BaseModel
# наслідуємо модель з core для того, щоб не прописувати наново поля, які ми хотіли б, щоб були у всіх моделей
# у всіх апках

class ComputerModel(BaseModel):
    # спеціальний внутрішній клас для метаданих моделі (як django має працювати з цією моделлю)
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
