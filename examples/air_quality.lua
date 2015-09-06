uart.setup( 0, 9600, 8, 0, 1, 0 )
uart.on("data",10,function(data)
local i = 1
local counter = 0
while data:byte(i)~=nil do

if data:byte(i) == 0x42 and data:byte(i+1) == 0x4d then
start = i
break
end
i=i+1
end

if data:byte(start+5)==nil or data:byte(start+6)==nil then 
return
end

if data:byte(start+7) == nil then
return
end

counter = (data:byte(start+6)*256 + data:byte(start+7))

local t_buf = {tostring(counter/100),".",tostring(counter%100/10),tostring(counter%10)," mg/m3".." \r\nEquvielent: ",tostring(10^(data:byte(start+5)-1))}
print(table.concat(t_buf))
end,0)
tmr.alarm(0,1000,1,function()
uart.write(0,string.char(0x42,0x4d,0x01,0x00,0x00,0x00,0x90))
end)


