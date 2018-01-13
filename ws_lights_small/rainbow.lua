return function()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    tt:alarm(30, tmr.ALARM_AUTO, function()
        buf:fill(leds.hsv2grb(ii%360, sat, val))
        ws2812.write(buf)
        ii = ii + 1
    end)
end
