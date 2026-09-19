from enum import Enum


class RegexEnum(Enum):
    CPU = (
        r'^(Intel Core|AMD Ryzen|Apple Silicon) ([A-Z][0-9]+|[0-9]+|[0-9]+ [0-9]+|[A-Z][0-9]+ [A-Z][a-z]+)$',
        'CPU field must consist Intel Core/AMD Ryzen/Apple Silicon + valid model name'
    )
    CAPITAL_START = (
        r'^[A-Z]',
        'Brand/model name must start with a capital!'
    )

    def __init__(self, pattern:str, msg: str):
        self.pattern = pattern
        self.msg = msg
