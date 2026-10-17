from django.conf import settings
from django.conf.urls.static import static
from django.urls import include, path

urlpatterns = [
    path('api/computers', include('apps.computers.urls')),
    path('api/computer_shops', include('apps.computer_shops.urls')),
    path('api/auth', include('apps.auth.urls')),
    path('api/user', include('apps.user.urls')),
]

# додаємо маршрути для доступу до медіафайлів у режимі розробки
urlpatterns += static(
    settings.MEDIA_URL,
    document_root=settings.MEDIA_ROOT
)