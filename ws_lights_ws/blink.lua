return function()
    clr_timers()
    local tt = tmr.create()
    local clrs = {0, 12, 25, 100, 150, 230, 280}
    table.insert(timers, tt)
    local l = {}
    local g,r,b = 0, 0, 0
    tt:alarm(35, tmr.ALARM_AUTO, function()
        g, r, b = leds.hsv2grb(clrs[math.random(1,7)], sat, val)
        local c = math.random(1,101)
        table.insert(l, 0, c)
        buf:set(c, r, g, b)
        if #l > 80 then 
            buf:set(table.remove(l), 0,0,0)
        end
        buf:set(1, 0, 0, 0)  
        ws2812.write(buf)
    end)
end
