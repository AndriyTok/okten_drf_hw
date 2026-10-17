from typing import Type

from django.contrib.auth import get_user_model

from rest_framework.generics import get_object_or_404

from core.enums.action_token_enum import ActionTokenEnum
from core.exceptions.jwt_exception import JWTException
# from rest_framework_simplejwt.tokens import BlacklistMixin, Token
from rest_framework_simplejwt.tokens import Token

UserModel = get_user_model()
# Тип для класів токенів. Type [...] означає, що очікується саме клас, а не його екземпляр
# ActionTokenClassType = Type[BlacklistMixin | Token]
ActionTokenClassType = Type[Token]

# Базовий клас для токенів, які підтримують blacklist
# BlackList дозволяє позначити токен як відкликаний і відхиляти повторне використання токена
# найчастіше використовується при активації акаунту, скиданні пароля, або при виході із системи
# class ActionToken(BlacklistMixin, Token):
#     pass
class ActionToken(Token):
    pass


# Токен для активації облікового запису (дані беремо зі кастомного enum)
class ActivateToken(ActionToken):
    token_type = ActionTokenEnum.ACTIVATE.token_type
    lifetime = ActionTokenEnum.ACTIVATE.lifetime

class RecoveryToken(ActionToken):
    token_type = ActionTokenEnum.RECOVERY.token_type
    lifetime = ActionTokenEnum.RECOVERY.lifetime

class JWTService:
    @staticmethod
    def create_token(user, token_class: ActionTokenClassType):
        # створюємо токен для конкретного користувача (метод for_user() з бібліотеки SimpleJWT)
        return token_class.for_user(user)

    @staticmethod
    def verify_token(token, token_class: ActionTokenClassType):
        try:
            # Створюємо обʼєкт токена з переданого рядка. Бібліотека перевіряє формат і валідність
            token_res = token_class(token)
            # token_res.check_blacklist()
        except Exception:
            raise JWTException('Помилка JWT')

        # Додаємо токен у blacklist, щоб його не можна було повторно використати після успішної перевірки
        # token_res.blacklist()
        user_id = token_res.payload.get('user_id')
        # Знаходимо користувача в базі даних по ID. Якщо його немає, DRF поверне 404
        return get_object_or_404(UserModel, pk=user_id)