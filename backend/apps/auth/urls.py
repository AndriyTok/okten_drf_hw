from django.urls import path

from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

urlpatterns = [
    # Отримання access та refresh токенів
    path('', TokenObtainPairView.as_view(), name='auth_login'),
    # Оновлення access токена
    path('/refresh', TokenRefreshView.as_view(), name='auth_refresh'),
]
