local coroutine_utils = {}

-- Function to create and start a coroutine
function coroutine_utils.start_coroutine(func)
    local co = coroutine.create(func)
    coroutine.resume(co)
    return co
end

-- Function to safely resume a coroutine and handle errors
function coroutine_utils.resume_coroutine(co, ...)
    local status, result = coroutine.resume(co, ...)
    if not status then
        error("Coroutine error: " .. tostring(result))
    end
    return result
end

-- Function to yield the current coroutine with a delay (requires LuaSocket)
function coroutine_utils.yield_with_delay(delay)
    local socket = require("socket")
    socket.sleep(delay)
    return coroutine.yield()
end

return coroutine_utils
