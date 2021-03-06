return function()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    tt:alarm(20, tmr.ALARM_AUTO, function()
        local g, r, b = leds.hsv2grb(ii%360)
        buf:fill(r, g, b)
        buf:set(1, 0, 0, 0)            
        ws2812.write(buf)
        ii = ii + 1
    end)
end
