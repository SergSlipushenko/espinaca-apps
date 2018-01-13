return function()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    local g,r,b
    local pulse = {255,255, 206,206,206, 155,155,155,155, 99,99,99,99, 48,48,48,48,48, 12,12,12,12,12,12,12}
    local clrs = {0, 12, 25, 100, 150, 230, 280}
    local g, r, b
    local p = 80
    tt:alarm(25, tmr.ALARM_AUTO, function()
        if pulse[ii%p+1] then
            g,r,b = leds.hsv2grb(clrs[(ii/p)%7+1], 255, pulse[ii%p+1])    
        else
            g,r,b = leds.hsv2grb(0,0,0)
        end
        buf:shift(1)
        buf:set(1, 0, 0, 0)            
        buf:set(2, r, g*7/10, b*8/10)            
        ws2812.write(buf)
        ii = ii + 1
    end)
end
