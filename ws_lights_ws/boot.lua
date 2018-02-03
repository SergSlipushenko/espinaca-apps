return function()
    dofile('wsconsole.lua')()
    leds = require 'leds'
    sat = 255
    val = 255
    total = 101
    ws2812.init()
    buf = ws2812.newBuffer(total, 3)
    buf1 = ws2812.newBuffer(total, 3)
    buf2 = ws2812.newBuffer(total, 3)
    buf:fill(255,255,255)
    buf1:fill(0,0,0)
    buf2:fill(0,0,0)
    buf:set(1, 0, 0, 0)
    ws2812.write(buf)
    timers = {}
    mode = function(mode_name)
        local _mode = ldfile(mode_name .. '.lua')
        if _mode then _mode() end
    end
    clr_timers = function()
        while #timers > 0 do
            local tt = table.remove(timers)
            tt:unregister()
        end
    end
    timer=tmr.create()
    timer:alarm(500, tmr.ALARM_AUTO, function() timer:interval(100000); ldfile('any.lua')() end)    
end
