ff = function()
    x=node.random(50,150); y=node.random(50,150); z=300; 
    minx=0; miny=0;minz=1000; 
    maxx=0;maxy=0;maxz=0;
    clr_timers()
    local tt = tmr.create()
    table.insert(timers, tt)
    local ii = 0
    tt:alarm(15, tmr.ALARM_AUTO, function()
        x1=x+10*(y-x)*1/100
        y1=y+(x*(28-z/20)-y)*1/100
        z1=z+(x*y/20-8/3*z)*1/100
        x=x1; y=y1; z=z1
        xx = 255*(x+351)/(351+310)
        yy = 255*(y+444)/(444+390)
        zz = 255*(z-206)/(939-206)
        if ii%2 == 0 then
            buf:shift(1)
            buf:set(1, 0, 0, 0)            
            buf:set(2, zz, xx, yy)            
            ws2812.write(buf)
        end
    end)
end
ff()
