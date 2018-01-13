return function()
    local modes = {
        'rainbow','random','run_color','run_rainbow',
        'run_random','slow_random','smooth_random',
        'spark_rainbow','spark_random','traffic',
        'pulse_rainbow', 'wave_rainbow', 'smooth_rainbow',
        'wblink','wblink', 'blink','blink'
    }
    clr_timers()
    local _mode = modes[math.random(1,#modes)]
    print('**', _mode)
    local mode = ldfile(_mode .. '.lua')
    if mode then mode() end
end
