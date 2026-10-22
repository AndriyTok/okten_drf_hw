from celery.schedules import crontab

PERIODIC_TASKS = {
    "collect_statistics": {
        "task": "core.tasks.statistics.collect_statistics",
        "schedule": crontab(minute=0) # запускається щогодини
    },
    # "spam": {
    #     "task": "core.tasks.email.spam",
    #     "schedule": crontab()
    # }
}