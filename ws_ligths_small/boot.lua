return function()
    leds = require 'leds'
    total = 17
    ws2812.init()
    ftr.sleep(42)
    buf = ws2812.newBuffer(total, 3)
    buf:fill(255,255,255)
    ws2812.write(buf)
    timers = {}
    clr_timers = function()
        while #timers > 0 do
            local tt = table.remove(timers)
            tt:unregister()
        end
    end
    ldfile('slow_random.lua')()
    dofile("mqconsole.lc")()
    nt.mqtt:subscribe('tree2/mode',0, function(msg)
        print('!!',msg)
        clr_timers()
        local mode = ldfile(msg .. '.lua')
        if mode then mode() end
    end)
end
