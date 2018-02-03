return function()
    clr_timers()
    local tt = tmr.create()
    table.insert(timers, tt)
    local r, g ,b = 0, 0, 0
    tt:alarm(30, tmr.ALARM_AUTO, function()
        buf:fill(0, 0, 0)
        if math.random(1,6) >= 4 then
            for i = 1,3 do
                g, r, b = leds.hsv2grb(0, 0, val)
                buf:set(math.random(1,101), r, g, b)
            end
        end
        buf:set(1, 0, 0, 0)
        ws2812.write(buf)
    end)
end
