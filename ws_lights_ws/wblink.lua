return function()
    local tt = tmr.create()
    local clrs = {0, 12, 25, 100, 150, 230, 280}
    table.insert(timers, tt)
    tt:alarm(30, tmr.ALARM_AUTO, function()
        buf:fill(0, 0, 0)
        if math.random(1,6) >= 4 then  
            for i = 1,3 do
               buf:set(math.random(1,101), 255, 255, 255)
            end
        end
        buf:set(1, 0, 0, 0)         
        ws2812.write(buf)
    end)
end
