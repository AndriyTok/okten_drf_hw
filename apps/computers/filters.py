from django.db.models import QuerySet # -> повертає Django ORM (Object Reference Model)
from django.http import QueryDict # -> використовується для зберігання параметрів HTTP-запиту
from rest_framework.exceptions import ValidationError

from apps.computers.models import ComputerModel

# приймаємо параметри http-запиту та повертаємо queryset
def filter_computer(query: QueryDict) -> QuerySet:
    qs = ComputerModel.objects.all() #дістаємо всі обʼєкти з бд

    for k,v in query.items():
        match k:
            case 'price__gt':
                qs = qs.filter(price__gt=v)
            case 'price__lt':
                qs = qs.filter(price__lt=v)
            #дефолтний кейс
            case _:
                raise ValidationError({'detail': f'"{k}" is not allowed'})

    return qs