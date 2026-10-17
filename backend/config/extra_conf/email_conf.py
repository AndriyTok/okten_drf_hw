import os

EMAIL_HOST = os.environ.get('EMAIL_HOST')  # адреса SMTP-сервера, через який надсилатимуться листи
EMAIL_HOST_USER = os.environ.get('EMAIL_HOST_USER')
EMAIL_HOST_PASSWORD = os.environ.get('EMAIL_HOST_PASSWORD')
EMAIL_PORT = os.environ.get('EMAIL_PORT')  # порт SMTP-сервера
EMAIL_USE_TLS = True

# SMTP = Simple Main Transfer Protocol. Це протокол для надсилання листів між поштовими сервісами
# TLS = Transport Layer Security. Протокол шифрування зʼєднання