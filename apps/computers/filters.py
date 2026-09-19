from django_filters import rest_framework as filters

from apps.computers.models import RAMTypeChoices
from apps.core.enums.regex_enum import RegexEnum


class ComputerFilter(filters.FilterSet):
    brand_startswith = filters.CharFilter(field_name='brand', lookup_expr='startswith')
    model_startswith = filters.CharFilter(field_name='model', lookup_expr='startswith')
    price_lt = filters.NumberFilter(field_name='price', lookup_expr='lt')
    price_gt = filters.NumberFilter(field_name='price', lookup_expr='gt')
    price_range = filters.RangeFilter(field_name='price')
    year_range = filters.RangeFilter(field_name='year')
    ram_in = filters.BaseInFilter(field_name='ram')
    ram_type = filters.ChoiceFilter('ram_type', choices=RAMTypeChoices.choices)
    order = filters.OrderingFilter(
        fields = (
            'id',
            'price',
            'brand'
        )
    )
