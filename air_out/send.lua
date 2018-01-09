return function()
    local data = {}
    while true do
        local ts, val, _, key = rtcfifo.pop()
        if ts == nil then break end
        if data[key] == nil then
            data[key] = {sum=0, num=0}
        end
        data[key]['sum'] = data[key]['sum'] + val
        data[key]['num'] = data[key]['num'] + 1
    end
    print(dump(data))
    local _temp = data['temp']['sum']/data['temp']['num'] - 32768
    local _humi = data['humi']['sum']/data['humi']['num']
    local _press = data['pres']['sum']/data['pres']['num'] - 32768
    local _lux = data['lux']['sum']/data['lux']['num']
    local _vdd = data['vdd']['sum']/data['vdd']['num']
    local _heap = node.heap()
    print(_temp,_humi,_press,_lux,_vdd,_heap)
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