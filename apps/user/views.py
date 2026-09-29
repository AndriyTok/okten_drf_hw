from django.contrib.auth import get_user_model

from rest_framework.generics import ListCreateAPIView
from rest_framework.permissions import AllowAny, IsAdminUser

from apps.user.serializers import UserSerializer

# щоб уникнути конфліктів з вбудованими моделями, краще скористатися цією функцією, щоб отримати наш UserModel
UserModel = get_user_model()

class UserListCreateView(ListCreateAPIView):
    queryset = UserModel.objects.all()
    serializer_class = UserSerializer

    #даємо дозвіл ендпоінту /user на створення юзера та профіля ще без аутентифікації
    def get_permissions(self):
        if self.request.method == 'POST':
            return [AllowAny()]
        return [IsAdminUser]



