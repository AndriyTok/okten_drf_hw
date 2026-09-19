from rest_framework.generics import ListAPIView, RetrieveUpdateDestroyAPIView

from apps.computers.filters import ComputerFilter
from apps.computers.models import ComputerModel
from apps.computers.serializers import ComputerSerializer


# змінюємо на ListApiView, щоб прописати створення вже у computer_shops
class ComputerListCreateView(ListAPIView):
    serializer_class = ComputerSerializer
    queryset = ComputerModel.objects.all()
    filterset_class = ComputerFilter

class ComputerRetrieveUpdateDestroyView(RetrieveUpdateDestroyAPIView):
    serializer_class = ComputerSerializer
    queryset = ComputerModel.objects.all()
    http_method_names = ['get', 'put', 'patch', 'delete']
