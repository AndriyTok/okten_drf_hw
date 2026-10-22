from django.core.management.base import BaseCommand

from core.tasks.schedule import PERIODIC_TASKS
# noinspection PyPackageRequirements
from django_celery_beat.models import CrontabSchedule, PeriodicTask


class Command(BaseCommand):
    help = "Sync periodic Celery tasks in DB with PERIODIC_TASKS definition in code"

    def handle(self, *args, **options):
        defined_names = set(PERIODIC_TASKS.keys())

        for name, config in PERIODIC_TASKS.items():
            schedule = CrontabSchedule.from_schedule(config["schedule"])
            schedule.save()

            PeriodicTask.objects.update_or_create(
                name=name,
                defaults={
                    "task": config["task"],
                    "crontab": schedule,
                    "enabled": True,
                },
            )
            self.stdout.write(self.style.SUCCESS(f"Synced: {name}"))

        removed, _ = PeriodicTask.objects.exclude(name__in=defined_names).delete()
        if removed:
            self.stdout.write(self.style.WARNING(f"Removed {removed} stale task(s)"))