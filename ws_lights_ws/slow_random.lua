return function()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    local clrs = {0, 12, 25, 100, 150, 230, 280}
    tt:alarm(300, tmr.ALARM_AUTO, function()
        local g, r, b = leds.hsv2grb(clrs[math.random(1,7)], sat, val)    
        buf:shift(1)
        buf:set(1, 0, 0, 0)            
        buf:set(2, r, g, b)            
        ws2812.write(buf)
        ii = ii + 1
    end)
end
