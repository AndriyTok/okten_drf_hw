from django.db import models

class ComputerModel(models.Model):
    class Meta:
        db_table = 'computers'

    brand = models.CharField(max_length=20)
    model = models.CharField(max_length=20)
    year = models.IntegerField()
    avail_status = models.BooleanField()
    cpu = models.CharField(max_length=15)
    ram = models.IntegerField()