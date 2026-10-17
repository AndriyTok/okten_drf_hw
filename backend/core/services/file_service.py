import os
from uuid import uuid1

# uuid - універсальний унікальний ідентифікатор (щоб генерувати id, які не повторюватимуться)
# uuid1() генерує UUID на основі: 1) поточного часу, 2) ід вузла (MAC-адреса), 3) додаткова інф. для унікальності

def upload_computer_photo(instance, filename: str) -> str:
    # отримуємо розширення файлу
    ext = filename.split('.')[-1]

    # формуємо шлях, куди буде завантажено фото
    return os.path.join(
        instance.computer_shop.name,
        f'{uuid1()}.{ext}'
    )