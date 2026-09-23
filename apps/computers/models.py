from django.core.validators import MaxValueValidator, MinValueValidator, RegexValidator
from django.db import models
from django.db.models import CASCADE

from apps.computer_shops.models import ComputerShopModel
from apps.core.enums.regex_enum import RegexEnum
from apps.core.models import BaseModel


class RAMTypeChoices(models.TextChoices):
    DDR3 = 'DDR3'
    DDR4 = 'DDR4'
    DDR5 = 'DDR5'


class ComputerModel(BaseModel):
    class Meta:
        db_table = 'computers'
        ordering = ('id',)

    brand = models.CharField(
        db_index = True,
        max_length=20,
        validators=[RegexValidator(RegexEnum.CAPITAL_START.pattern, RegexEnum.CAPITAL_START.msg)]
    )
    model = models.CharField(
        max_length=20,
        validators=[RegexValidator(RegexEnum.CAPITAL_START.pattern, RegexEnum.CAPITAL_START.msg)]
    )
    price = models.IntegerField(db_index=True, validators=[MinValueValidator(1000)])
    year = models.IntegerField(
        db_index=True,
        validators=[
            MinValueValidator(2000),
            MaxValueValidator(2027)
        ]
    )
    avail_status = models.BooleanField(default=True)
    cpu = models.CharField(
        max_length=20,
        validators=[RegexValidator(RegexEnum.CPU.pattern, RegexEnum.CPU.msg)])
    ram = models.IntegerField(db_index = True, validators=[MinValueValidator(4)])
    ram_type = models.CharField(max_length=4, choices=RAMTypeChoices.choices)

    computer_shop = models.ForeignKey(
        ComputerShopModel,
        on_delete=CASCADE,
        related_name='computers'
    )
