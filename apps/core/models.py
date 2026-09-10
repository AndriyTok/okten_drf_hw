from django.db import models

# щоб не створювати певні базові поля для кожної моделі, простіше створити "базову" абстрактну модель
# від якої наслідуватимемо моделі інших "аппів"
class BaseModel(models.Model):
    class Meta:
        abstract = True

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)