return function()
    local pins = require 'pins'
    vdd = adc.readvdd33()    
    gpio.mode(pins.IO2,gpio.OUTPUT)
    gpio.write(pins.IO2,gpio.LOW)
    ftr.sleep(10)
    if bme280.init(pins.IO5,pins.IO4) then
        ftr.sleep(84)
        print 'BME280 detected' 
        press, temp=bme280.baro()
        humi,_=bme280.humi()
        if press and temp and humi then
            press = press/10 - 101325
            temp = temp/10
            humi = humi/1000
        end
    end
    local bh1750 = ldfile('bh1750.lua') or ldfile('bh1750.lc')
    if bh1750.init(pins.IO5,pins.IO4) then
        print 'BH1750 detected'
        lux = bh1750.lux() 
    end
    gpio.write(pins.IO2,gpio.HIGH)
    print(temp,humi,press,lux,vdd)
    rtcfifo.put(1, 32768+temp, 0, 'temp')
    rtcfifo.put(1, humi, 0, 'humi')
    rtcfifo.put(1, 32768+press, 0, 'pres')
    rtcfifo.put(1, lux, 0, 'lux')
    rtcfifo.put(1, vdd, 0, 'vdd')
end