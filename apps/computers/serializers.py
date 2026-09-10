# Serializer відповідає за перетворення даних між Python/Django-об'єктами
# та JSON-представленням API, а також виконує валідацію вхідних даних.

from rest_framework import serializers
from apps.computers.models import ComputerModel

class ComputerSerializer(serializers.ModelSerializer):
    # ModelSerializer автоматично створює поля serializer на основі полів моделі
    # та забезпечує стандартну логіку створення й оновлення об'єктів моделі (а в звичайному Serializer вручну)
    class Meta:
        model = ComputerModel
        fields = ( # Визначаємо, які поля моделі будуть доступні через API.
            'id',
            'brand',
            'model',
            'price',
            'year',
            'avail_status',
            'cpu',
            'ram'
        )