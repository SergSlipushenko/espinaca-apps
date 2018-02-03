return function()
    local modes = {
        'rainbow','random','run_color','run_rainbow',
        'run_random','slow_random','smooth_random',
        'spark_rainbow','spark_random',
        'pulse_rainbow', 'wave_rainbow', 'smooth_rainbow',
        'wblink', 'blink','cblink', 'mix_colors', 'lorenz'
    }
    clr_timers()
    local _mode = modes[node.random(1,#modes)]
    print(_mode)
    mode(_mode)
end
