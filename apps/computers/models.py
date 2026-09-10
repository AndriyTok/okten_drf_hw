from django.core.validators import MinValueValidator, MaxValueValidator
from django.db import models

from apps.core.models import BaseModel


class ComputerModel(BaseModel):
    class Meta:
        db_table = 'computers'

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
