from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status

from apps.computers.models import ComputerModel
from apps.computers.serializers import ComputerSerializer


class ComputerListCreateView(APIView):
    def get(self, *args, **kwargs):
        computer = ComputerModel.objects.all()
        serializer = ComputerSerializer(instance=computer, many=True)
        return Response(serializer.data, status.HTTP_200_OK)

    def post(self, *args, **kwargs):
        data = self.request.data
        serializer = ComputerSerializer(data=data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status.HTTP_201_CREATED)

class ComputerRetrieveUpdateDestroyView(APIView):
    def get_computer(self, pk):
        return get_object_or_404(ComputerModel, pk=pk)

    def get(self, *args, **kwargs):
        computer = self.get_computer(kwargs['pk'])
        serializer = ComputerSerializer(computer)
        return Response(serializer.data, status.HTTP_200_OK)

    def put(self, *args, **kwargs):
        computer = self.get_computer(kwargs['pk'])
        data = self.request.data
        serializer = ComputerSerializer(instance=computer, data=data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status.HTTP_200_OK)

    def patch(self, *args, **kwargs):
        computer = self.get_computer(kwargs['pk'])
        data = self.request.data
        serializer = ComputerSerializer(instance=computer, data=data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status.HTTP_200_OK)

    def delete(self, *args, **kwargs):
        pk = kwargs['pk']
        computer = self.get_computer(pk)
        computer.delete()
        return Response(f"Computer {pk} deleted", status.HTTP_204_NO_CONTENT)