from django.contrib.auth import get_user_model
# декоратор, що забезпечує атомарність транзакції
# або все виконується успішно, або зміни скасовуються при помилках
from django.db.transaction import atomic

from rest_framework import serializers

from core.services.email_service import EmailService
from core.services.jwt_service import ActivateToken, JWTService

from apps.user.models import ProfileModel

UserModel = get_user_model()

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProfileModel
        fields = (
            'id',
            'name',
            'surname',
            'age',
            'created_at',
            'updated_at'
        )

class UserSerializer(serializers.ModelSerializer):
    profile = ProfileSerializer()

    class Meta:
        model = UserModel
        fields = (
            'id',
            'email',
            'password',
            'is_active',
            'is_staff',
            'is_superuser',
            'last_login',
            'profile',
            'created_at',
            'updated_at'
        )
        read_only_fields = (
            'id',
            'is_active',
            'is_staff',
            'is_superuser',
            'last_login',
            'created_at',
            'updated_at'
        )
        extra_kwargs = {
            'password': {
                'write_only': True,
            }
        }
    @atomic
    def create(self, validated_data:dict):
        profile = validated_data.pop('profile')
        user = UserModel.objects.create_user(**validated_data)
        ProfileModel.objects.create(**profile, user=user)
        EmailService.register(user)
        return user

class AdminUserUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserModel
        fields = (
            'is_active',
            'is_staff',
        )