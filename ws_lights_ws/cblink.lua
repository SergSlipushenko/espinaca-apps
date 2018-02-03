return function()
    clr_timers()
    local tt = tmr.create()
    local clrs = {0, 12, 25, 100, 150, 230, 280}
    table.insert(timers, tt)
    tt:alarm(45, tmr.ALARM_AUTO, function()
        buf:fill(0, 0, 0)
        for i = 1,10 do
            local g, r, b = leds.hsv2grb(clrs[node.random(1,#clrs)], sat, val)
            buf:set(math.random(1,101), r, g, b)
        end
        buf:set(1, 0, 0, 0)
        ws2812.write(buf)
    end)
end
