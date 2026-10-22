from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import exception_handler


# Кастомний обробник винятків, який розширює стандартну обробку DRF.
# exc — виняток, що виник під час обробки запиту.
# context — контекст запиту, зокрема інформація про view та request.
def error_handler(exc: Exception, context: dict):
    # Словник спеціальних обробників для певних винятків.
    handlers = {
        "JWTException": _jwt_validation_exception_handler
    }
    # Викликаємо стандартний обробник винятків DRF.
    response = exception_handler(exc, context)
    # Отримуємо назву класу винятку.
    exc_class = exc.__class__.__name__

    # Якщо для винятку є спеціальний обробник — викликаємо його.
    if exc_class in handlers:
        return handlers[exc_class](exc, context)

    return response

# Обробник помилок JWT: повертає повідомлення та статус 401.
def _jwt_validation_exception_handler(exc, context):
    return Response({"detail": "JWT expired or invalid"}, status.HTTP_401_UNAUTHORIZED)

# Підключаємо в /config/extra_conf/rest_conf.py