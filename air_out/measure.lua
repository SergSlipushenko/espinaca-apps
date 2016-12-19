return function()
    local pins = require 'pins'
    heap = node.heap()
    vdd = adc.readvdd33()    
    gpio.mode(pins.IO2,gpio.OUTPUT)
    gpio.write(pins.IO2,gpio.LOW)
    ftr.sleep(30)
    local res = bme280.init(pins.IO5,pins.IO4)
    if not res then print('BМE280 failed to init'); return end
    local bh1750 = ldfile('bh1750.lua') or ldfile('bh1750.lc')
    res = bh1750.init(pins.IO5,pins.IO4)
    if not res then 
        bh1750 = nil
        lux = 0
    else lux = bh1750.lux() end
    press, temp=bme280.baro()
    humi,_=bme280.humi()
    press = press/10 - 101325
    temp = temp/10
    humi = humi/1000
    gpio.write(pins.IO2,gpio.HIGH)
    print(temp,humi,press,lux,vdd,heap)
end
