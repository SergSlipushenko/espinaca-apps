return function()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    local g, r, b
    tt:alarm(100, tmr.ALARM_AUTO, function()
        if ii%20 == 0 then 
            g, r, b = leds.hsv2grb(math.random(0,11)*30, sat, val) 
        end
        buf:shift(1)
        buf:set(1, g, r, b)            
        ws2812.write(buf)
        ii = ii + 1
    end)
end
