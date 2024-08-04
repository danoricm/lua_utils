local date_utils = {}

-- Function to get the current date and time as a formatted string
function date_utils.current_datetime(format)
    return os.date(format or "%Y-%m-%d %H:%M:%S")
end

-- Function to get the current date as a formatted string
function date_utils.current_date(format)
    return os.date(format or "%Y-%m-%d")
end

-- Function to get the current time as a formatted string
function date_utils.current_time(format)
    return os.date(format or "%H:%M:%S")
end

-- Function to get the difference in days between two dates
function date_utils.days_between(date1, date2)
    local pattern = "(%d+)%-(%d+)%-(%d+)"
    local year1, month1, day1 = date1:match(pattern)
    local year2, month2, day2 = date2:match(pattern)
    local time1 = os.time({year = year1, month = month1, day = day1})
    local time2 = os.time({year = year2, month = month2, day = day2})
    local difference = os.difftime(time2, time1)
    return math.floor(difference / (24 * 60 * 60))
end

-- Function to add days to a date
function date_utils.add_days(date, days)
    local pattern = "(%d+)%-(%d+)%-(%d+)"
    local year, month, day = date:match(pattern)
    local time = os.time({year = year, month = month, day = day})
    local new_time = time + (days * 24 * 60 * 60)
    return os.date("%Y-%m-%d", new_time)
end

-- Function to subtract days from a date
function date_utils.subtract_days(date, days)
    return date_utils.add_days(date, -days)
end

-- Function to calculate the difference in months between two dates
function date_utils.months_between(date1, date2)
    local pattern = "(%d+)%-(%d+)%-(%d+)"
    local year1, month1 = date1:match(pattern)
    local year2, month2 = date2:match(pattern)
    return (year2 - year1) * 12 + (month2 - month1)
end

-- Function to check if a year is a leap year
function date_utils.is_leap_year(year)
    return (year % 4 == 0 and year % 100 ~= 0) or (year % 400 == 0)
end

-- Function to get the number of days in a month
function date_utils.days_in_month(year, month)
    local days = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
    if month == 2 and date_utils.is_leap_year(year) then
        return 29
    end
    return days[month]
end

-- Function to get the day of the week for a given date
function date_utils.day_of_week(date)
    local pattern = "(%d+)%-(%d+)%-(%d+)"
    local year, month, day = date:match(pattern)
    local time = os.time({year = year, month = month, day = day})
    return os.date("%A", time)
end

-- Function to format a date string from one format to another
function date_utils.format_date(date, current_format, new_format)
    local year, month, day = date:match(current_format)
    local time = os.time({year = year, month = month, day = day})
    return os.date(new_format, time)
end

return date_utils
