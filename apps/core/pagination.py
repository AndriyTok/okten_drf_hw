from typing import Any

from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response


class PagePagination(PageNumberPagination):
    page_size = 3
    max_page_size = 10
    page_size_query_param = 'size' #можливість задавати розмір масиву, що буде повертатись

    # функція для отримання кастомного Response
    def get_paginated_response(self, data:Any) -> Response:
        assert self.page is not None

        return Response({
            'total_items':self.page.paginator.count,
            'total_pages': self.page.paginator.num_pages,
            'prev': bool(self.get_previous_link()),
            'next': bool(self.get_next_link()),
            'data': data
        })
