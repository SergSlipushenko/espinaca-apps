return function()
    local tt = tmr.create()
    local clrs = {0, 12, 25, 100, 150, 230, 280}
    table.insert(timers, tt)
    local l = {}
    tt:alarm(100, tmr.ALARM_AUTO, function()
        g, r, b = leds.hsv2grb(clrs[math.random(1,7)], sat, val)
        local c = math.random(1,17)
        table.insert(l, 0, c)
        buf:set(c, r, g, b)
        if #l > 7 then 
            buf:set(table.remove(l), 0,0,0)
        end
        ws2812.write(buf)
    end)
end
