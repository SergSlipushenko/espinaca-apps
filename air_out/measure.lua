return function()
    nt.deploy({wifi=true ,mqtt=true})
    local pins = require 'pins'
    local URL = 'http://api.thingspeak.com/update?api_key=%s&field1=%d&field2=%d&field3=%d&field4=%d&field5=%d&field6=%d'
    local secrets = ldfile('secrets.lua')
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
    heap = node.heap()
    vdd = adc.readvdd33()
    temp = temp/10
    humi = humi/1000
    print(temp,humi,press, lux,vdd,heap)
    if nt.wifi.running then
        url=URL:format(secrets.TS.api_key,temp,humi,press,lux,vdd,heap)
        print(url)
        ft_send = ftr.Future()
        http.get(url, nil, ft_send:callbk())
        print(ft_send:result())
    end
    if nt.mqtt.running then 
        nt.mqtt:publish('sensors/outdoor/temp', temp, 0, 1)
        nt.mqtt:publish('sensors/outdoor/lux', lux, 0, 1)
        nt.mqtt:publish('sensors/outdoor/vdd', vdd, 0, 1)
        print('published!')
    end
    gpio.write(pins.IO2,gpio.HIGH)
    nt.deploy({wifi=false})    
end
