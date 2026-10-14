from django_filters import rest_framework as filters

from apps.computers.models import ComputerModel


class ComputerFilter(filters.FilterSet):
    ram_in = filters.BaseInFilter(field_name='ram')
    order = filters.OrderingFilter(
        fields=(
            'id',
            'brand',
            'model',
            'price',
            'year',
            'avail_status',
            'cpu',
            'ram',
            'ram_type'
        )
    )

    class Meta:
        model = ComputerModel
        fields = { # fields в класі Meta дозволяють прописувати одному полю одразу кілька lookup-expressions
            'brand': ['startswith', 'endswith', 'contains'],
            'model': ['startswith', 'endswith', 'contains'],
            'cpu': ['startswith', 'endswith', 'contains'],
            'price': ['lt', 'lte', 'gt', 'gte', 'range'],
            'year': ['lt', 'lte', 'gt', 'gte', 'range'],
            'ram': ['lt', 'lte', 'gt', 'gte', 'range'],
            'ram_type': ['exact', 'startswith', 'endswith', 'contains'],
            # 'ram_type': ['exact'] -> ram_type = filters.ChoiceFilter('ram_type',choices=RAMTypeChoices.choices)
        }
