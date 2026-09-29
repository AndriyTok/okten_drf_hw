from typing import Any

from django.contrib.auth.models import UserManager as Manager


#власний manager для створення користувачів
class UserManager(Manager):
    # створення звичайного користувача (нижче коментар, щоб не було зайвих підкреслень від IDE)
    # noinspection PyMethodOverriding
    def create_user(self, email=None, password=None, **extrafields):
        # Електронна скринька та пароль - обовʼязкові поля
        if not email:
            raise ValueError('Email must be provided')

        if not password:
            raise ValueError('Password must be provided')

        email = self.normalize_email(email) # нормалізація емейлу (приведення домену до нижнього регістру)
        user = self.model(email=email, **extrafields)
        user.set_password(password)
        user.save()

        return user

    # створення адміна
    # noinspection PyMethodOverriding
    def create_superuser(self, email=None, password=None, **extra_fields: Any):
        # права адміністратора
        extra_fields.setdefault('is_active', True)
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        # перевіряємо, чи має юзер права адміністратора
        if extra_fields['is_active'] is not True:
            raise ValueError('Superuser must have status is_active=True')
        if extra_fields['is_staff'] is not True:
            raise ValueError('Superuser must have status is_staff=True')
        if extra_fields['is_superuser'] is not True:
            raise ValueError('Superuser must have status is_superuser=True')

        # після перевірок, створюємо користувача через звичайний метод
        user = self.create_user(email=email, password=password, **extra_fields)
        return user
