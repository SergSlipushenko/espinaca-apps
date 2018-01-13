return function()
    dofile('wsconsole.lua')()
    leds = require 'leds'
    total = 101
    ws2812.init()
    buf = ws2812.newBuffer(total, 3)
    buf:fill(255,255,255)
    buf:set(1, 0, 0, 0)
    ws2812.write(buf)
    timers = {}
    clr_timers = function()
        while #timers > 0 do
            local tt = table.remove(timers)
            tt:unregister()
        end
    end
    timer=tmr.create()
    timer:alarm(500, tmr.ALARM_AUTO, function() timer:interval(100000); ldfile('any.lua')() end)    
end
