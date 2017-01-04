return function()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    local color
    tt:alarm(20, tmr.ALARM_AUTO, function()
        buf:shift(1)
        buf:set(1, 0, 0, 0)            
        if ii%101 == 0 then
            color = string.char(leds.hsv2grb(math.random(0,11)*30, sat, val))    
        end        
        if ii%95 < 30 then 
            buf:set(2, color)            
        else 
            buf:set(2, string.char(90,90,45))            
        end
        ws2812.write(buf)
        ii = ii + 1
    end)
end
