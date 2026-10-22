import os

from django.contrib.auth import get_user_model
from django.core.mail import EmailMultiAlternatives
from django.template.loader import get_template

from config.celery import app

UserModel = get_user_model()


@app.task  # декоратор, що реєструє функцію як завдання доступне до виконання через Celery
def send_email(to: str, template_name: str, context: dict, subject: str) -> None:
    template = get_template(template_name)
    html_content = template.render(context)
    msg = EmailMultiAlternatives(
        to=[to],
        from_email=os.environ.get('EMAIL_HOST_USER'),
        subject=subject
    )
    msg.attach_alternative(html_content, "text/html")
    msg.send()


# Реєструємо Celery-завдання для розсилки листів усім користувачам.
@app.task
def spam():
    for user in UserModel.objects.all():
        send_email(
            to=user.email,
            template_name='spam.html',
            context={},
            subject='SPAM'
        )
