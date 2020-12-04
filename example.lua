
Metric = require('metric')

metric = Metric:new("temperature", "gauge", "Temperature")
metric:setValue("25")
metric:setValue("24", {["location"] = 'inside', ["sensor"] = "dht11"})
metric:setValue("12", {["location"] = 'outside', ["sensor"] = "dht11"})

print(metric:toString())

metric2 = Metric:new("humidity", "gauge", "Humidity")
metric2:setValue('100', {["location"] = 'river', ["sensor"] = "dht11"})

print(metric2:toString())
