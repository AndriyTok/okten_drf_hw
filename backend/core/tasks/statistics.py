import logging

from django.contrib.auth import get_user_model

from config.celery import app

from apps.computer_shops.models import ComputerShopModel
from apps.computers.models import ComputerModel

# Створюємо logger із назвою поточного модуля.
logger = logging.getLogger(__name__)

UserModel = get_user_model()

@app.task
def collect_statistics():
    users_count = UserModel.objects.count()
    computers_count = ComputerModel.objects.count()
    shops_count = ComputerShopModel.objects.count()

    logger.info(
    "Statistics: users_count=%s, computers_count=%s, computer_shops_count=%s",
    users_count, computers_count, shops_count,
)

