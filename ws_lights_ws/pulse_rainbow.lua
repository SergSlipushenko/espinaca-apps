return function()
    clr_timers()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    local g,r,b = 0, 0, 0
    local clrs = {0, 12, 25, 100, 150, 230, 280}
    local pulse = {0, 17, 63, 127, 191, 237, 255, 237, 191, 127, 63, 17, 0}
    tt:alarm(60, tmr.ALARM_AUTO, function()
        if pulse[ii%17] then
            g,r,b = leds.hsv2grb(clrs[(ii/17)%7+1], sat, pulse[ii%17]*val/255)    
        else
            g,r,b = 0,0,0
        end
        buf:shift(1)
        buf:set(1, 0, 0, 0)            
        buf:set(2, r, g, b)            
        ws2812.write(buf)
        ii = ii + 1
    end)
end
