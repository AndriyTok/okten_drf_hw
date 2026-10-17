from rest_framework.generics import ListAPIView, RetrieveUpdateDestroyAPIView, UpdateAPIView
from rest_framework.permissions import AllowAny

from apps.computers.models import ComputerModel
from apps.computers.serializers import ComputerPhotoSerializer, ComputerSerializer


class ComputerListCreateView(ListAPIView):
    serializer_class = ComputerSerializer
    queryset = ComputerModel.objects.all()
    permission_classes = (AllowAny,)
    # queryset = ComputerModel.objects.less_than_price(40000) # звертаємося до функції з ComputerManager

class ComputerRetrieveUpdateDestroyView(RetrieveUpdateDestroyAPIView):
    serializer_class = ComputerSerializer
    queryset = ComputerModel.objects.all()
    http_method_names = ['get', 'put', 'patch', 'delete']

class ComputerAddPhotoView(UpdateAPIView):
    serializer_class = ComputerPhotoSerializer
    queryset = ComputerModel.objects.all()
    http_method_names = ['put']
    permission_classes = (AllowAny,)

    def perform_update(self, serializer):
        computer = self.get_object()
        computer.photo.delete()
        super().perform_update(serializer)