return {
    eng_mode = 'mqconsole',
    on_boot = {
        ntp_sync = false,
        script = 'boot'
    }
    --[[crontab = {
        {every = 1, job = 'color_upd'},
        {every = 20, job = 'random'},
    }]]    
}
