return function()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    clrs = {0, 12, 25, 100, 150, 230, 280}
    local g, r, b = 255, 255, 255
    tt:alarm(23, tmr.ALARM_AUTO, function()
        if ii%80 == 0 then 
            g, r, b = 255, 255, 255
            next_g, next_r, next_b = leds.hsv2grb(clrs[(ii/80)%7+1], sat, 170)           
        end
        g= g + (next_g-g)/30 + ((next_g-g)>0 and 1 or ((next_g-g)<0 and -1 or 0))
        r= r + (next_r-r)/30 +((next_r-r)>0 and 1 or ((next_r-r)<0 and -1 or 0))
        b= b + (next_b-b)/30 +((next_b-b)>0 and 1 or ((next_b-b)<0 and -1 or 0))
        if g < 0 then g = 0 end
        if r < 0 then r = 0 end
        if b < 0 then b = 0 end
        buf:shift(1)
        buf:set(1, 0, 0, 0)            
        buf:set(2, r, g, b)                    
        ws2812.write(buf)
        ii = ii + 1
    end)
end
