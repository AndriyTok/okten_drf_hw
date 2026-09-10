from rest_framework import serializers
from apps.computers.models import ComputerModel

class ComputerSerializer(serializers.ModelSerializer):
    class Meta:
        model = ComputerModel
        fields = (
            'id',
            'brand',
            'model',
            'price',
            'year',
            'avail_status',
            'cpu',
            'ram'
        )