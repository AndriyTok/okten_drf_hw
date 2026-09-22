from django_filters import rest_framework as filters

from apps.computers.models import RAMTypeChoices


class ComputerFilter(filters.FilterSet):
    brand_startswith = filters.CharFilter(field_name='brand', lookup_expr='startswith')
    brand_endswith = filters.CharFilter(field_name='brand', lookup_expr='endswith')
    brand_contains = filters.CharFilter(field_name='brand', lookup_expr='contains')
    model_startswith = filters.CharFilter(field_name='model', lookup_expr='startswith')
    model_endswith = filters.CharFilter(field_name='model', lookup_expr='endswith')
    model_contains = filters.CharFilter(field_name='model', lookup_expr='contains')
    cpu_startswith = filters.CharFilter(field_name='cpu', lookup_expr='startswith')
    cpu_endswith = filters.CharFilter(field_name='cpu', lookup_expr='endswith')
    cpu_contains = filters.CharFilter(field_name='cpu', lookup_expr='contains')
    price_lt = filters.NumberFilter(field_name='price', lookup_expr='lt')
    price_gt = filters.NumberFilter(field_name='price', lookup_expr='gt')
    price_range = filters.RangeFilter(field_name='price')
    year_gt = filters.NumberFilter(field_name='year', lookup_expr='gt')
    year_lt = filters.NumberFilter(field_name='year', lookup_expr='lt')
    year_range = filters.RangeFilter(field_name='year')
    ram_gt = filters.NumberFilter(field_name='ram', lookup_expr='gt')
    ram_gte = filters.NumberFilter(field_name='ram', lookup_expr='gte')
    ram_lt = filters.NumberFilter(field_name='ram', lookup_expr='lt')
    ram_lte = filters.NumberFilter(field_name='ram', lookup_expr='lte')
    ram_in = filters.BaseInFilter(field_name='ram')
    ram_type = filters.ChoiceFilter('ram_type', choices=RAMTypeChoices.choices)
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
