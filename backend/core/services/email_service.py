from django.contrib.auth import get_user_model

from core.services.jwt_service import ActivateToken, JWTService, RecoveryToken
from core.tasks.email import send_email

UserModel = get_user_model()


class EmailService:
    #send_email перенесено в ./tasks/email.py

    @classmethod
    def register(cls, user):
        token = JWTService.create_token(user, ActivateToken)
        url = f'http://localhost/activate/{token}'
        # Передаємо надсилання листа в Celery для фонового виконання.
        # Метод delay() ставить завдання в чергу, не очікуючи його завершення.
        send_email.delay(
            to=user.email,
            template_name='register.html',
            context={
                'name': user.profile.name,
                'url': url
            },
            subject="Register"
        )

    @classmethod
    def recovery(cls, user):
        token = JWTService.create_token(user, RecoveryToken)
        url = f'http://localhost/recovery/{token}'
        send_email(
            to=user.email,
            template_name='recovery.html',
            context={
                'url': url
            },
            subject="Password recovery"
        )

