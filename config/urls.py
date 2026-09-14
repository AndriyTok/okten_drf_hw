#головний список маршрутів усього проекту
from django.urls import include, path  # path створює маршрути, include підключає URL маршрути з застосунків

urlpatterns = [
    path('computers', include('apps.computers.urls')),
    path('computer_shops', include('apps.computer_shops.urls'))
]
