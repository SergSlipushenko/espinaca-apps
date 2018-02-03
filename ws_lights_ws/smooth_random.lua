return function()
    clr_timers()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    local g, r, b = 255, 255, 255
    local next_g, next_r, next_b = 0, 0, 0
    local next_h = node.random(0,11)*30
    tt:alarm(20, tmr.ALARM_AUTO, function()
        if ii%50 == 0 then 
            next_h = (next_h + node.random(2,10)*30)%360
            next_g, next_r, next_b = leds.hsv2grb(next_h, sat, val)
        end
        g= g + (next_g-g)/50 + ((next_g-g)>0 and 1 or ((next_g-g)<0 and -1 or 0))
        r= r + (next_r-r)/50 +((next_r-r)>0 and 1 or ((next_r-r)<0 and -1 or 0))
        b= b + (next_b-b)/50 +((next_b-b)>0 and 1 or ((next_b-b)<0 and -1 or 0))
        if g < 0 then g = 0 end
        if r < 0 then r = 0 end
        if b < 0 then b = 0 end
        buf:shift(1)
        buf:set(1, 0, 0, 0)            
        buf:set(2, g, r, b)                    
        ws2812.write(buf)
        ii = ii + 1
    end)
end
