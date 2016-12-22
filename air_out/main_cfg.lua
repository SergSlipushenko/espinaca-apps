return {
    on_boot = {
    },
    cron = {
        cycle = 180*1000,
        dsleep = true,
        cycle_cell = 21,
        watchdog_interval = 20*1000
    },
    crontab = {
        {every = 1, job = 'measure'},
        {every = 1, job = 'send'},
    }
}
