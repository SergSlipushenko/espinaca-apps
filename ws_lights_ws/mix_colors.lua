ff = function()
    clr_timers()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    local color1 = string.char(0,0,0)
    local color2 = string.char(0,0,0)
    local clrs = {0, 12, 25, 100, 150, 230, 280}
    tt:alarm(50, tmr.ALARM_AUTO, function()
        buf1:shift(1)
        buf2:shift(-1)
        if (ii%100==0) then    
            buf1:fill(0,0,0)
            buf2:fill(0,0,0)
            color1 = string.char(leds.hsv2grb(clrs[node.random(1,7)], sat, val))
            color2 = string.char(leds.hsv2grb(clrs[node.random(1,7)], sat, val))
        end
        buf1:set(1, color1)
        buf2:set(101, color2)   
        buf:mix(128, buf2, 128, buf1)
        buf:set(1, 0, 0, 0)               
        ws2812.write(buf)
        ii = ii + 1
    end)
end
ff()
