import os

# клас Django для створення листів, які можуть містити текст і альтернативний HTML-вміст
from django.core.mail import EmailMultiAlternatives
# функція для завантаження HTML-шаблонів Django
from django.template.loader import get_template

from core.services.jwt_service import ActivateToken, JWTService, RecoveryToken


class EmailService:
    @classmethod
    def __send_email(cls, to: str, template_name: str, context: dict, subject: str) -> None:
        # завантажуємо шаблон за назвою (templates/register.html)
        template = get_template(template_name)
        # рендеримо шаблон (передаємо дані в html і отримуємо готовий HTML-код листа)
        html_content = template.render(context)
        # створюємо обʼєкт електронного листа
        msg = EmailMultiAlternatives(
            to=[to], # список адресатів
            from_email=os.environ.get('EMAIL_HOST_USER'), # адреса відправника
            subject=subject # тема листа
        )
        # додаємо html-версію листа
        msg.attach_alternative(html_content, "text/html")
        # відправляємо лист
        msg.send()

    @classmethod
    def register(cls, user):
        token = JWTService.create_token(user, ActivateToken)
        url = f'http://localhost/activate/{token}' # посилання, за яким user активує акаунт
        cls.__send_email(
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
        cls.__send_email(
            to=user.email,
            template_name='recovery.html',
            context={
                'url': url
            },
            subject="Password recovery"
        )