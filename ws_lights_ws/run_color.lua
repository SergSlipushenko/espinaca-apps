return function()
    clr_timers()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    local color = string.char(0,0,0)
    tt:alarm(13, tmr.ALARM_AUTO, function()
        buf:shift(1)
        buf:set(1, 0, 0, 0)            
        if ii%101 == 0 then
            color = string.char(leds.hsv2grb(math.random(0,11)*30, sat, val))    
        end        
        if ii%101 < 30 then 
            buf:set(2, color)            
        else 
            buf:set(2, string.char(0,0,0))            
        end
        ws2812.write(buf)
        ii = ii + 1
    end)
end
