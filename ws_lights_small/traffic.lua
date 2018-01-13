return function()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    local color
    tt:alarm(75, tmr.ALARM_AUTO, function()
        if (ii/40)%3 == 0 then 
            color = string.char(0,255,0)
        elseif (ii/40)%3 == 1 then
            color = string.char(100,255,0)    
        else    
            color = string.char(255,0,0)        
        end
        buf:shift(1)
        buf:set(1, color)            
        ws2812.write(buf)
        ii = ii + 1
    end)
end
