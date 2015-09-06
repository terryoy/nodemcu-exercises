print(wifi.sta.getip())
--nil
wifi.setmode(wifi.STATION)
wifi.sta.config("SEEED","depot0510")
print(wifi.sta.getip())

