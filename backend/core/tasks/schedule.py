from celery.schedules import crontab

PERIODIC_TASKS = {
    "collect_statistics": {
        "task": "core.tasks.statistics.collect_statistics",
        "schedule": crontab(minute=0) # запускається щогодини
    },
    # "spam": { # celery task для надсилання спаму на пошти усіх користувачів щохвилини
    #     "task": "core.tasks.email.spam",
    #     "schedule": crontab()
    # }
}