return function()
    local modes = {
        'rainbow','random','blink','blink','blink',
        'wblink','wblink','wblink','run_rainbow','traffic',
        'run_random','slow_random','smooth_random',
    }
    clr_timers()
    local mode = ldfile(modes[math.random(1,#modes)] .. '.lua')
    if mode then mode() end
end
