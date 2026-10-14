# конфіг для simplejwt, що визначатиме, як працюватимуть JWT-токени: скільки вони живуть, як оновлюються

from datetime import timedelta  # для задання часу життя токенів

SIMPLE_JWT = {
    "ACCESS_TOKEN_LIFETIME": timedelta(minutes=10), # Час, протягом якого access-токен залишається дійсним
    "REFRESH_TOKEN_LIFETIME": timedelta(minutes=20), # Час, протягом якого refresh-токен залишається дійсним
    "ROTATE_REFRESH_TOKENS": True, # Після оновлення створюється новий refresh-токен
    "BLACKLIST_AFTER_ROTATION": True, # Старий refresh-токен після оновлення стає недійсним
    "UPDATE_LAST_LOGIN": True, # Оновлювати час останнього входу користувача
    "AUTH_HEADER_TYPES": ("Bearer",), # Для авторизації токен передається як Bearer-токен
}