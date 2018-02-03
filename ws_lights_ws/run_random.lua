return function()
    clr_timers()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    local r, g, b
    tt:alarm(40, tmr.ALARM_AUTO, function()
        if ii%5 == 0 then
            g, r, b = leds.hsv2grb(math.random(0,23)*15, sat, val)
        end
        if node.random(1,5) > 3 then g, r, b = 0, 0, 0 end        
        buf:shift(1)
        buf:set(1, 0, 0, 0)            
        buf:set(2, r, g, b)            
        ws2812.write(buf)
        ii = ii + 1
    end)
end
