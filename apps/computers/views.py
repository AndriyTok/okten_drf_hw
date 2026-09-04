from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status

from apps.computers.models import ComputerModel
from apps.computers.serializers import ComputerSerializer


class ComputerListCreateView(APIView):
    @staticmethod
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
    @staticmethod
    def get(self, *args, **kwargs):
        pk = kwargs['pk']
        try:
            computer = ComputerModel.objects.get(pk=pk)
        except ComputerModel.DoesNotExist:
            return Response(f"Computer {pk} does not exist")

        serializer = ComputerSerializer(computer)
        return Response(serializer.data, status.HTTP_200_OK)

    def post(self, *args, **kwargs):
        pk = kwargs['pk']
        try:
            computer = ComputerModel.objects.get(pk=pk)
        except ComputerModel.DoesNotExist:
            return Response(f"Computer {pk} does not exist")
        data = self.request.data
        serializer = ComputerSerializer(instance=computer, data=data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status.HTTP_200_OK)

    @staticmethod
    def delete(self, *args, **kwargs):
        pk = kwargs['pk']
        try:
            computer = ComputerModel.objects.get(pk=pk).delete()
        except ComputerModel.DoesNotExist:
            return Response(f"Computer {pk} does not exist")

        return Response(f"Computer {pk} deleted")