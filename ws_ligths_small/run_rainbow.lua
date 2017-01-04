return function()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    local g,r,b
    clrs = {0, 12, 25, 100, 150, 230, 280}
    tt:alarm(100, tmr.ALARM_AUTO, function()
        g,r,b = leds.hsv2grb(clrs[(ii/25)%7+1], sat, val)    
        buf:shift(1)
        buf:set(1, g, r, b)            
        ws2812.write(buf)
        ii = ii + 1
    end)
end
