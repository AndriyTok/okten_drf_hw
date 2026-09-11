from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView # готові generic views
# можна використовувати більш низькорівневі views:
# 1) ApiView - самі прописуємо логіку http-запитів (минулий таск)
# 2) GenericApiView - додає базову функціональність для роботи з моделями та serializer-ами
# 3) GenericApiView + Mixins - кожен відповідає за свою "операцію" (http-запит)
# приклад з лекції:
# class PizzaListCreateView(GenericAPIView, ListModelMixin, CreateModelMixin):
#     # queryset = PizzaModel.objects.all()
#     serializer_class = PizzaSerializer
#
#     def get_queryset(self):
#         request:Request = self.request
#         return filter_pizza(request.query_params)
#
#     def get(self, request, *args, **kwargs):
#         return super().list(request, *args, **kwargs)
#
#     def post(self, request, *args, **kwargs):
#         return super().create(request, *args, **kwargs)
# 4) Готові views з rest_framework.generics

from apps.computers.models import ComputerModel
from apps.computers.serializers import ComputerSerializer
from apps.computers.filters import filter_computer

class ComputerListCreateView(ListCreateAPIView):
    # ListCreateAPIView - автоматично дає list() та create() функції, правильні статус-коди та серіалізацію
    serializer_class = ComputerSerializer

    def get_queryset(self):
        request = self.request # отримуємо поточний http-запит
        return filter_computer(request.query_params) # повертаємо відфільтрований qs

class ComputerRetrieveUpdateDestroyView(RetrieveUpdateDestroyAPIView): # same але функції retrieve(), update(), destroy()
    serializer_class = ComputerSerializer
    queryset = ComputerModel.objects.all() #базовий qs, з якого django знаходить потрібний обʼєкт (за pk з url)
    http_method_names = ['get', 'put', 'patch', 'delete'] # дозволені для цього view http-методи
