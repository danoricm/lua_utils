local string_utils = {}

-- Function to split a string by a given delimiter
function string_utils.split(input, delimiter)
    local result = {}
    for match in (input..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
    return result
end

-- Function to trim whitespace from both ends of a string
function string_utils.trim(s)
    return s:match("^%s*(.-)%s*$")
end

-- Function to convert a string to lowercase
function string_utils.to_lower(s)
    return s:lower()
end

-- Function to convert a string to uppercase
function string_utils.to_upper(s)
    return s:upper()
end

-- Function to check if a string starts with a given prefix
function string_utils.starts_with(s, prefix)
    return s:sub(1, #prefix) == prefix
end

-- Function to check if a string ends with a given suffix
function string_utils.ends_with(s, suffix)
    return s:sub(-#suffix) == suffix
end

-- Function to reverse a string
function string_utils.reverse(s)
    return s:reverse()
end

-- Function to count occurrences of a substring in a string
function string_utils.count_substring(s, substring)
    local count = 0
    local start = 1
    while true do
        local found = s:find(substring, start, true)
        if not found then break end
        count = count + 1
        start = found + #substring
    end
    return count
end

-- Function to replace occurrences of a substring with another string
function string_utils.replace(s, old, new)
    local result = {}
    local start = 1
    while true do
        local found = s:find(old, start, true)
        if not found then break end
        table.insert(result, s:sub(start, found - 1))
        table.insert(result, new)
        start = found + #old
    end
    table.insert(result, s:sub(start))
    return table.concat(result)
end

-- Function to repeat a string n times
function string_utils.repeat_string(s, n)
    return s:rep(n)
end

-- Function to capitalize the first letter of a string
function string_utils.capitalize(s)
    return s:sub(1, 1):upper() .. s:sub(2):lower()
end

-- Function to split a string into a table of characters
function string_utils.to_chars(s)
    local chars = {}
    for char in s:gmatch(".") do
        table.insert(chars, char)
    end
    return chars
end

-- Function to check if a string is a palindrome
function string_utils.is_palindrome(s)
    return s == string_utils.reverse(s)
end

return string_utils
