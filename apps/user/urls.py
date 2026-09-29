from django.urls import path

from apps.user.views import UserListCreateView, UserUpdateView

urlpatterns = [
    path('', UserListCreateView.as_view(), name='user_list_create'),
    path('/update/<int:pk>', UserUpdateView.as_view(), name='admin_user_update')
]