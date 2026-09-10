from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView

from apps.computers.models import ComputerModel
from apps.computers.serializers import ComputerSerializer
from apps.computers.filters import filter_computer

class ComputerListCreateView(ListCreateAPIView):
    serializer_class = ComputerSerializer

    def get_queryset(self):
        request = self.request
        return filter_computer(request.query_params)

class ComputerRetrieveUpdateDestroyView(RetrieveUpdateDestroyAPIView):
    serializer_class = ComputerSerializer
    queryset = ComputerModel.objects.all()
    http_method_names = ['get', 'put', 'patch', 'delete']
