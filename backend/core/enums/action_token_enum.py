from datetime import timedelta
from enum import Enum

# Перелік фіксованих значень для токена активації облікового запису

class ActionTokenEnum(Enum):
    ACTIVATE = (
        'activate',
        timedelta(minutes=30) # тривалість "життя" токена
    )
    RECOVERY = (
        'recovery',
        timedelta(minutes=10)
    )

    def __init__(self, token_type, lifetime):
        self.token_type = token_type
        self.lifetime = lifetime
