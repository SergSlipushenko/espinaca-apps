return function()
    leds = require 'leds'
    total = 2
    ws2812.init()
    ftr.sleep(42)
    buf = ws2812.newBuffer(total, 3)
    local tt = tmr.create()    
    local ii = 0
    tt:alarm(10, tmr.ALARM_AUTO, function()
        local g, r, b = leds.hsv2grb(ii%360)
        buf:fill(r, g, b)
        ws2812.write(buf)
        ii = ii + 1
    end)
    local mqc = ldfile("mqconsole.lua") or ldfile("mqconsole.lc")
    if mqc then mqc() end
    tt:unregister()
    buf:fill(0,0,0)
    ws2812.write(buf)
    nt.mqtt:publish('button/pushed', '1')
    nt.mqtt:publish('tree/mode', 'any')
    nt.mqtt:publish('tree2/mode', 'any')
    ftr.sleep(1000)
    buf:fill(255,255,255)    
    ws2812.write(buf)
    nt:deploy({wifi=false})
    ftr.sleep(200)
    buf:fill(0,0,0)    
    ws2812.write(buf)
    node.dsleep(0)
end
