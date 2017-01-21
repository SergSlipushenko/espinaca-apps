return function()
    local _temp = temp or 0
    local _humi = humi or 0
    local _press = press or 0
    local _lux = lux or 0
    local _vdd = vdd or 0
    local _heap = heap or 0
    nt.deploy({wifi=true})
    if nt.wifi.running then
        local URL = 'http://api.thingspeak.com/update?api_key=%s&field1=%d&field2=%d&field3=%d&field4=%d&field5=%d&field6=%d'
        local secrets = ldfile('secrets.lua')
        url=URL:format(secrets.TS.api_key,_temp,_humi,_press,_lux,_vdd,_heap)
        print(url)
        ft_send = ftr.Future()
        http.get(url, nil, ft_send:callbk())
        print(ft_send:result())
    end
    if nt.mqtt and nt.mqtt.running then
        nt.mqtt:publish('sensors/outdoor/temp', _temp, 0, 1)
        nt.mqtt:publish('sensors/outdoor/lux', _lux, 0, 1)
        nt.mqtt:publish('sensors/outdoor/vdd', _vdd, 0, 1)
        print('published!')
    end
    nt.deploy({wifi=false})  
end
