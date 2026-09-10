#головний список маршрутів усього проекту
from django.urls import path, include # path створює маршрути, include підключає URL маршрути з застосунків

urlpatterns = [
    path('computers', include('apps.computers.urls'))
]
