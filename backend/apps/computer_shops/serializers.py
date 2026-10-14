from rest_framework import serializers

from apps.computer_shops.models import ComputerShopModel
from apps.computers.serializers import ComputerSerializer


class ComputerShopSerializer(serializers.ModelSerializer):
    # замість depth визначаємо поле для серіалізації пов'язаних об'єктів
    computers = ComputerSerializer(many=True, read_only=True)
    class Meta:
        model = ComputerShopModel
        fields = (
            'id',
            'name',
            'computers'
        )
        # depth = 1 -> глибина серіалізації. перехід від поточного обʼєкта до обʼєкта з яким він повʼязаний
        # не дозволяє серіалізувати привʼязані обʼєкти (не можемо керувати, які поля показувати)
