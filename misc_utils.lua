local misc_utils = {}

-- Function to check if a number is even
function misc_utils.is_even(n)
    return n % 2 == 0
end

-- Function to check if a number is odd
function misc_utils.is_odd(n)
    return n % 2 ~= 0
end

-- Function to generate a random string of a given length
function misc_utils.random_string(length)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local result = {}
    for i = 1, length do
        local rand = math.random(#chars)
        table.insert(result, chars:sub(rand, rand))
    end
    return table.concat(result)
end

-- Function to shuffle an array-like table
function misc_utils.shuffle_table(t)
    local shuffled = {table.unpack(t)}
    for i = #shuffled, 2, -1 do
        local j = math.random(i)
        shuffled[i], shuffled[j] = shuffled[j], shuffled[i]
    end
    return shuffled
end

-- Function to clamp a number within a range
function misc_utils.clamp(value, min, max)
    if value < min then return min end
    if value > max then return max end
    return value
end

-- Function to calculate the factorial of a number (recursive)
function misc_utils.recursive_factorial(n)
    if n <= 1 then return 1 end
    return n * misc_utils.recursive_factorial(n - 1)
end

-- Function to memoize another function
function misc_utils.memoize(fn)
    local cache = {}
    return function (...)
        local key = table.concat({...}, ", ")
        if cache[key] then
            return cache[key]
        else
            local result = fn(...)
            cache[key] = result
            return result
        end
    end
end

-- Function to check if a string is a valid identifier
function misc_utils.is_valid_identifier(s)
    return s:match("^[%a_][%w_]*$") ~= nil
end

-- Function to execute a shell command and return its output
function misc_utils.execute_command(cmd)
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    handle:close()
    return result
end

-- Function to perform a binary search on a sorted array
function misc_utils.binary_search(array, target)
    local low, high = 1, #array
    while low <= high do
        local mid = math.floor((low + high) / 2)
        if array[mid] == target then
            return mid
        elseif array[mid] < target then
            low = mid + 1
        else
            high = mid - 1
        end
    end
    return nil -- not found
end

-- Function to convert a number to a binary string
function misc_utils.to_binary(n)
    local binary = {}
    repeat
        table.insert(binary, 1, n % 2)
        n = math.floor(n / 2)
    until n == 0
    return table.concat(binary)
end

return misc_utils
