return {
    on_boot_script = 'boot',
    cron = {
        cycle = 1000,
        dsleep = false,
        cycle_cell = 21,
        watchdog_interval = 5000,
    },
    crontab = {
        {every = 1, job = 'cronjob'},
    }
}
