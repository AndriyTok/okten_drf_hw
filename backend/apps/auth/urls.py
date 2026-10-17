from django.urls import path

from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

from apps.auth.views import ActivateUserView, RecoveryPasswordView, RecoveryRequestView

urlpatterns = [
    # Отримання access та refresh токенів
    path('', TokenObtainPairView.as_view(), name='auth_login'),
    # Оновлення access токена
    path('/refresh', TokenRefreshView.as_view(), name='auth_refresh'),
    path('/activate/<str:token>', ActivateUserView.as_view(), name='auth_activate'),
    path('/recovery', RecoveryRequestView.as_view(), name='recovery_request'),
    path('/recovery/<str:token>', RecoveryPasswordView.as_view(), name='password_reset')
]
