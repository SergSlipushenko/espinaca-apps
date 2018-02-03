return function()
    clr_timers()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    local g,r,b = 0, 0, 0
    local clrs = {0, 12, 25, 100, 150, 230, 280}
    tt:alarm(20, tmr.ALARM_AUTO, function()
        if ii%150 == 0 then 
            g,r,b = leds.hsv2grb(clrs[(ii/150)%7+1], sat, val)    
        end
        buf:shift(1)
        buf:set(1, 0, 0, 0)            
        buf:set(2, r, g, b)            
        ws2812.write(buf)
        ii = ii + 1
    end)
end
