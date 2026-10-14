from rest_framework import status
from rest_framework.generics import GenericAPIView, ListCreateAPIView, RetrieveUpdateDestroyAPIView, get_object_or_404
from rest_framework.response import Response

from apps.computer_shops.models import ComputerShopModel
from apps.computer_shops.serializers import ComputerShopSerializer
from apps.computers.serializers import ComputerSerializer


# Create your views here.
class ComputerShopListCreateView(ListCreateAPIView):
    serializer_class = ComputerShopSerializer
    queryset = ComputerShopModel.objects.all()

class ComputerShopRetrieveUpdateDestroyView(RetrieveUpdateDestroyAPIView):
    serializer_class = ComputerShopSerializer
    queryset = ComputerShopModel.objects.all()
    http_method_names = ['get', 'put', 'patch', 'delete']

class ComputerShopAddComputerView(GenericAPIView):
    queryset = ComputerShopModel.objects.all()

    def post(self, *args, **kwargs):
        computer_shop = self.get_object() # в urls вказуємо <int:pk> і get_object() сама перевірить, чи є такий
                                                                        # shop і викине exception якщо не знайде
        data = self.request.data
        serializer = ComputerSerializer(data=data)
        serializer.is_valid(raise_exception=True)
        serializer.save(computer_shop=computer_shop) # додатково передаємо в create()
        # значення ForeignKey, яке не було передане у request.data.
        shop_serializer = ComputerShopSerializer(computer_shop)
        return Response(shop_serializer.data, status.HTTP_201_CREATED)
