return function()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    tt:alarm(30, tmr.ALARM_AUTO, function()
        if (ii/200)%3 == 0 then 
            color = string.char(255,0,0)
        elseif (ii/200)%3 == 1 then
            color = string.char(255,100,0)    
        else    
            color = string.char(0,255,0)        
        end
        buf:shift(1)
        buf:set(1, 0, 0, 0)            
        buf:set(2, color)            
        ws2812.write(buf)
        ii = ii + 1
    end)
end