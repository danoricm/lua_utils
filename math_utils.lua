local math_utils = {}

-- Function to round a number to the nearest integer
function math_utils.round(n)
    return math.floor(n + 0.5)
end

-- Function to calculate the factorial of a number
function math_utils.factorial(n)
    if n == 0 then return 1 end
    local result = 1
    for i = 2, n do
        result = result * i
    end
    return result
end

-- Function to find the greatest common divisor of two numbers
function math_utils.gcd(a, b)
    while b ~= 0 do
        a, b = b, a % b
    end
    return a
end

-- Function to calculate the least common multiple of two numbers
function math_utils.lcm(a, b)
    return (a * b) / math_utils.gcd(a, b)
end

-- Function to check if a number is prime
function math_utils.is_prime(n)
    if n < 2 then return false end
    for i = 2, math.sqrt(n) do
        if n % i == 0 then
            return false
        end
    end
    return true
end

-- Function to calculate the n-th Fibonacci number
function math_utils.fibonacci(n)
    if n <= 0 then return 0 end
    if n == 1 then return 1 end
    local a, b = 0, 1
    for i = 2, n do
        a, b = b, a + b
    end
    return b
end

-- Function to calculate the mean of a list of numbers
function math_utils.mean(t)
    local sum = 0
    for _, v in ipairs(t) do
        sum = sum + v
    end
    return sum / #t
end

-- Function to calculate the median of a list of numbers
function math_utils.median(t)
    local sorted = {table.unpack(t)}
    table.sort(sorted)
    local mid = #sorted // 2
    if #sorted % 2 == 0 then
        return (sorted[mid] + sorted[mid + 1]) / 2
    else
        return sorted[mid + 1]
    end
end

-- Function to calculate the standard deviation of a list of numbers
function math_utils.standard_deviation(t)
    local avg = math_utils.mean(t)
    local sum = 0
    for _, v in ipairs(t) do
        sum = sum + (v - avg) ^ 2
    end
    return math.sqrt(sum / #t)
end

-- Function to convert degrees to radians
function math_utils.degrees_to_radians(degrees)
    return degrees * math.pi / 180
end

-- Function to convert radians to degrees
function math_utils.radians_to_degrees(radians)
    return radians * 180 / math.pi
end

-- Function to calculate the distance between two points in 2D space
function math_utils.distance(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

-- Function to find the maximum value in a list of numbers
function math_utils.max(t)
    local max_val = -math.huge
    for _, v in ipairs(t) do
        if v > max_val then
            max_val = v
        end
    end
    return max_val
end

-- Function to find the minimum value in a list of numbers
function math_utils.min(t)
    local min_val = math.huge
    for _, v in ipairs(t) do
        if v < min_val then
            min_val = v
        end
    end
    return min_val
end

return math_utils
