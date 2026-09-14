# Глобальні розширені налаштування DRF

REST_FRAMEWORK = {
    # Визначаємо renderer — компонент, який перетворює
    # дані Python/serializer у формат HTTP-відповіді.
    'DEFAULT_RENDERER_CLASSES': [
        'rest_framework.renderers.JSONRenderer', #формує відповіді API у форматі JSON.
    ],
}
