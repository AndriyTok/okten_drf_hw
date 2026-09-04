from django.urls import path
from .views import *

urlpatterns = [
    path('', ComputerListCreateView.as_view(), name='computer_get_create'),
    path('/<int:pk>', ComputerRetrieveUpdateDestroyView.as_view(), name='computer_update_destroy')
]