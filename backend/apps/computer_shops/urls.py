from django.urls import path

from apps.computer_shops.views import (
    ComputerShopAddComputerView,
    ComputerShopListCreateView,
    ComputerShopRetrieveUpdateDestroyView,
)

urlpatterns = [
    path('', ComputerShopListCreateView.as_view(), name='create-list_computerShops'),
    path('/<int:pk>', ComputerShopRetrieveUpdateDestroyView.as_view(), name='retrieve-update-delete_computerShops'),
    path('/<int:pk>/computers', ComputerShopAddComputerView.as_view(), name='add_computer_from_computerShop')
]