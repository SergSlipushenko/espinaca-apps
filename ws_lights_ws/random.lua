return function()
    local tt = tmr.create()
    table.insert(timers, tt)
    local clrs = {0, 12, 25, 100, 150, 230, 280}
    tt:alarm(7000, tmr.ALARM_AUTO, function()
        g, r, b = leds.hsv2grb(clrs[math.random(1,7)], sat, val)
        buf:fill(r, g, b)            
        buf:set(1, 0, 0, 0)            
        ws2812.write(buf)
    end)
end
