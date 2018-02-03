return function()
    clr_timers()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    tt:alarm(20, tmr.ALARM_AUTO, function()
        local g, r, b = leds.hsv2grb(ii%360, sat, val)
        buf:fill(r, g, b)
        buf:set(1, 0, 0, 0)            
        ws2812.write(buf)
        ii = ii + 1
    end)
end
