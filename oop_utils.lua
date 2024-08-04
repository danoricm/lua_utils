local oop_utils = {}

-- Function to create a new class
function oop_utils.new_class(base)
    local class = {}
    class.__index = class
    class.__base = base

    setmetatable(class, {
        __call = function(cls, ...)
            local instance = setmetatable({}, cls)
            if cls.__init then
                cls.__init(instance, ...)
            end
            return instance
        end,
        __index = base
    })

    return class
end

-- Function to add inheritance to a class
function oop_utils.inherit(subclass, superclass)
    setmetatable(subclass, { __index = superclass })
    subclass.__base = superclass
end

-- Function to add a method to a class
function oop_utils.add_method(class, name, method)
    class[name] = method
end

return oop_utils
