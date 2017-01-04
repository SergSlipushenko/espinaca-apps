return function()
    local modes = {
        'rainbow','random','run_color','run_rainbow',
        'run_random','slow_random','smooth_random',
        'spark_rainbow','spark_random','traffic'
    }
    clr_timers()
    local mode = ldfile(modes[math.random(1,#modes)] .. '.lua')
    if mode then mode() end
end
