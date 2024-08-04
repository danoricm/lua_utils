local file_utils = {}

-- Function to read the contents of a file
function file_utils.read_file(filename)
    local file = io.open(filename, "r")
    if not file then return nil, "Could not open file for reading." end
    local content = file:read("*all")
    file:close()
    return content
end

-- Function to write content to a file
function file_utils.write_file(filename, content)
    local file = io.open(filename, "w")
    if not file then return false, "Could not open file for writing." end
    file:write(content)
    file:close()
    return true
end

-- Function to append content to a file
function file_utils.append_to_file(filename, content)
    local file = io.open(filename, "a")
    if not file then return false, "Could not open file for appending." end
    file:write(content)
    file:close()
    return true
end

-- Function to check if a file exists
function file_utils.file_exists(filename)
    local file = io.open(filename, "r")
    if file then
        file:close()
        return true
    else
        return false
    end
end

-- Function to get the size of a file
function file_utils.get_file_size(filename)
    local file = io.open(filename, "r")
    if not file then return nil, "Could not open file to determine size." end
    local size = file:seek("end")
    file:close()
    return size
end

-- Function to list files in a directory (requires LuaFileSystem)
function file_utils.list_files_in_directory(directory)
    local lfs = require("lfs")
    local files = {}
    for file in lfs.dir(directory) do
        if file ~= "." and file ~= ".." then
            table.insert(files, file)
        end
    end
    return files
end

-- Function to create a directory
function file_utils.create_directory(directory)
    local lfs = require("lfs")
    local success, err = lfs.mkdir(directory)
    if not success then
        return false, err
    end
    return true
end

-- Function to remove a file
function file_utils.remove_file(filename)
    local result, err = os.remove(filename)
    if not result then
        return false, err
    end
    return true
end

-- Function to move a file
function file_utils.move_file(src, dest)
    local success, err = os.rename(src, dest)
    if not success then
        return false, err
    end
    return true
end

-- Function to copy a file (requires an external tool)
function file_utils.copy_file(src, dest)
    local input = io.open(src, "rb")
    if not input then return false, "Could not open source file for copying." end
    local output = io.open(dest, "wb")
    if not output then
        input:close()
        return false, "Could not open destination file for copying."
    end
    local block = 1024 * 1024 -- 1MB block size
    while true do
        local data = input:read(block)
        if not data then break end
        output:write(data)
    end
    input:close()
    output:close()
    return true
end

-- Function to get the current working directory
function file_utils.current_working_directory()
    local lfs = require("lfs")
    return lfs.currentdir()
end

-- Function to change the current working directory
function file_utils.change_directory(directory)
    local success, err = lfs.chdir(directory)
    if not success then
        return false, err
    end
    return true
end

-- Function to get file extension
function file_utils.get_file_extension(filename)
    return filename:match("^.+(%..+)$")
end

-- Function to get file name without extension
function file_utils.get_file_name(filename)
    return filename:match("(.+)%..+$")
end

return file_utils
