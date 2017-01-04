return function()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    local g,r,b
    clrs = {0, 12, 25, 100, 150, 230, 280}
    pulseV = {101, 105, 116, 133, 154, 178, 202, 223, 240, 251, 255, 251, 240, 223, 202, 178, 154, 133, 116, 105, 101}
    pulseS = {0, 12, 48, 99, 155, 206, 242, 255, 255, 255, 255, 255, 255, 255, 242, 206, 155, 99, 48, 12, 0}
    local g, r, b
    local p = 33
    tt:alarm(25, tmr.ALARM_AUTO, function()
        if pulseV[ii%p+1] then
            g,r,b = leds.hsv2grb(clrs[(ii/p)%7+1], pulseS[ii%p+1], pulseV[ii%p+1])    
        else
            g,r,b = leds.hsv2grb(clrs[(ii/p)%7+1], pulseS[1], pulseV[1])
        end
        buf:shift(1)
        buf:set(1, 0, 0, 0)            
        buf:set(2, r, g*7/10, b*8/10)            
        ws2812.write(buf)
        ii = ii + 1
    end)
end
