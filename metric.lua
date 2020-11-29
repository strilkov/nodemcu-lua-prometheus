
Metric = {}

function Metric:new(mname, mtype, mdescription)

    local obj= {}
        obj.mname = mname
        obj.mtype = mtype
        obj.mdescription = mdescription
        obj.mvalues = nil
    function obj:getName()
        return self.mname 
    end
    
    function obj:getType()
        return self.mtype 
    end
    
    function obj:getDescription()
        return self.mdescription 
    end
    
    function obj:setValue(value, labels)
      if self.mvalues == nil then
      	self.mvalues = {}
      end

      local t = {}
      t["value"] = value
      t["labels"] = labels

      table.insert(self.mvalues, t)
    end

    function obj:toString()
      string = ""

      if self.mname == nil then
       return string
      end

      if self.mdescription ~= nil then
       string = string .. "# HELP " .. self.mname .. " " .. self.mdescription .. '\n'
      end
      

      if self.mtype ~= nil then
       string = string .. "# TYPE " .. self.mname .. " " .. self.mtype .. '\n'
      end
      
      for _, value in ipairs(self.mvalues) do
        
        if value.labels == nil then
         string = string .. self.mname .. " " .. value.value .. "\n"
        end
        
        if value.labels ~= nil then
         
        string = string .. self.mname .. "{"
        
        for lname, lvalue in pairs(value.labels) do

          string = string .. lname .. "=\"" .. lvalue .. "\""
          
            if next(value.labels, lname) ~= nil then
             string = string .. ", "
            end
        end
        
        string = string .. "} " .. value.value .. "\n"
         
        end

      end
      
      return string
    end

    setmetatable(obj, self)
    self.__index = self;
    return obj
end

return Metric

