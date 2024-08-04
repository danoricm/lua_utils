local table_utils = {}

-- Function to check if a table is empty
function table_utils.is_empty(t)
    return next(t) == nil
end

-- Function to merge two tables (shallow copy)
function table_utils.merge(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
    end
    return t1
end

-- Function to deep copy a table
function table_utils.deep_copy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[table_utils.deep_copy(orig_key)] = table_utils.deep_copy(orig_value)
        end
        setmetatable(copy, table_utils.deep_copy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end

-- Function to count the number of elements in a table
function table_utils.count(t)
    local count = 0
    for _ in pairs(t) do
        count = count + 1
    end
    return count
end

-- Function to check if a table contains a value
function table_utils.contains(t, value)
    for _, v in pairs(t) do
        if v == value then
            return true
        end
    end
    return false
end

-- Function to get keys from a table
function table_utils.keys(t)
    local keys = {}
    for k in pairs(t) do
        table.insert(keys, k)
    end
    return keys
end

-- Function to get values from a table
function table_utils.values(t)
    local values = {}
    for _, v in pairs(t) do
        table.insert(values, v)
    end
    return values
end

-- Function to filter a table based on a predicate function
function table_utils.filter(t, predicate)
    local result = {}
    for k, v in pairs(t) do
        if predicate(v, k) then
            result[k] = v
        end
    end
    return result
end

-- Function to map a table to another table based on a transformation function
function table_utils.map(t, transform)
    local result = {}
    for k, v in pairs(t) do
        result[k] = transform(v, k)
    end
    return result
end

-- Function to sort a table by values
function table_utils.sort(t, compare)
    local sorted = {}
    for k, v in pairs(t) do
        table.insert(sorted, {key = k, value = v})
    end
    table.sort(sorted, function(a, b) return compare(a.value, b.value) end)
    local result = {}
    for _, entry in ipairs(sorted) do
        result[entry.key] = entry.value
    end
    return result
end

-- Function to reverse the order of elements in an array-like table
function table_utils.reverse(t)
    local reversed = {}
    local n = #t
    for i = n, 1, -1 do
        table.insert(reversed, t[i])
    end
    return reversed
end

-- Function to remove duplicates from an array-like table
function table_utils.remove_duplicates(t)
    local seen = {}
    local result = {}
    for _, v in ipairs(t) do
        if not seen[v] then
            table.insert(result, v)
            seen[v] = true
        end
    end
    return result
end

-- Function to find an element in a table with a given predicate
function table_utils.find(t, predicate)
    for k, v in pairs(t) do
        if predicate(v, k) then
            return v, k
        end
    end
    return nil
end

-- Function to concatenate values of a table into a string
function table_utils.concat(t, sep)
    local result = {}
    for _, v in pairs(t) do
        table.insert(result, tostring(v))
    end
    return table.concat(result, sep or ", ")
end

return table_utils
