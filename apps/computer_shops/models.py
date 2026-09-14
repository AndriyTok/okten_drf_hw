from django.db import models

from apps.core.models import BaseModel


class ComputerShopModel(BaseModel):
    class Meta:
        db_table = 'computer_shops'

    name = models.CharField(max_length=20)
