
Metric = require('metric')

metric = Metric:new("name1", "gauge", "Some description")
metric:setValue("8888")
metric:setValue("1", {["location"] = 'test_home', ["type"] = "test_temp"})
metric:setValue("12", {["location"] = 'home', ["type"] = "temp"})

print(metric:toString())

metric2 = Metric:new("name2", "gauge", "Some")
metric2:setValue('55', {["location"] = 'river', ["type"] = "temp"})

print(metric2:toString())

