from django.urls import path
from .views import *

# список url-маршрутів застосунку computers. підключаємо до основного списку ендпоінтів проекту через iclude()
urlpatterns = [
    #ендпоінт для отримання всіх компʼютерів та створення нового компʼютера, імпортуємо потрібну вʼюшку
    path('', ComputerListCreateView.as_view(), name='computer_get_create'),
    # ендпоінт для отримання компʼютера по id, оновлення, та видалення
    path('/<int:pk>', ComputerRetrieveUpdateDestroyView.as_view(), name='computer_update_destroy')
]