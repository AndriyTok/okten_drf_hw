from django.db.models import QuerySet
from django.http import QueryDict
from rest_framework.exceptions import ValidationError

from apps.computers.models import ComputerModel

def filter_computer(query: QueryDict) -> QuerySet:
    qs = ComputerModel.objects.all()

    for k,v in query.items():
        match k:
            case 'price__gt':
                qs = qs.filter(price__gt=v)
            case 'price__lt':
                qs = qs.filter(price__lt=v)
            case _:
                raise ValidationError({'detail': f'"{k}" is not allowed'})

    return qs