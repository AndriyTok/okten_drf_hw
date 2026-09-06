from rest_framework import serializers
from apps.computers.models import ComputerModel
from django.core.validators import MinValueValidator, MaxValueValidator

class ComputerSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    brand = serializers.CharField(max_length=20)
    model = serializers.CharField(max_length=20)
    year = serializers.IntegerField(
        validators=[
            MinValueValidator(2000),
            MaxValueValidator(2027)
        ]
    )
    avail_status = serializers.BooleanField()
    cpu = serializers.CharField(max_length=15)
    ram = serializers.IntegerField(
        validators=[MinValueValidator(4)]
    )

    def create(self, validated_data:dict):
        computer = ComputerModel.objects.create(**validated_data)
        return computer

    def update(self, instance, validated_data:dict):
        for k,v in validated_data.items():
            setattr(instance, k, v)
        instance.save()
        return instance