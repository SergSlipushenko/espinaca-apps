return function()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    local r, g, b
    tt:alarm(50, tmr.ALARM_AUTO, function()
        if ii%33 == 0 then 
            g, r, b = leds.hsv2grb(math.random(0,11)*30, sat, val)
        end
        buf:shift(1)
        buf:set(1, 0, 0, 0)            
        buf:set(2, r, g, b)            
        ws2812.write(buf)
        ii = ii + 1
    end)
end
