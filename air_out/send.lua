return function()
    if not(temp and humi and press and lux and vdd and heap) then return end
    nt.deploy({wifi=true ,mqtt=true})
    if nt.wifi.running then
        local URL = 'http://api.thingspeak.com/update?api_key=%s&field1=%d&field2=%d&field3=%d&field4=%d&field5=%d&field6=%d'
        local secrets = ldfile('secrets.lua')
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
    nt.deploy({wifi=false})    
end