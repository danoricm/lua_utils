local socket = require("socket")
local http = require("socket.http")
local ltn12 = require("ltn12")

local network_utils = {}

-- Function to check if a host is reachable
function network_utils.is_host_reachable(host, port, timeout)
    local client = socket.tcp()
    client:settimeout(timeout or 1)
    local connected, err = client:connect(host, port)
    client:close()
    return connected ~= nil, err
end

-- Function to get the local IP address
function network_utils.get_local_ip()
    local s = socket.udp()
    s:setpeername("8.8.8.8", 80)
    local ip, _ = s:getsockname()
    s:close()
    return ip
end

-- Function to make an HTTP GET request
function network_utils.http_get(url)
    local response_body = {}
    local res, code, response_headers, status = http.request{
        url = url,
        sink = ltn12.sink.table(response_body),
    }
    return table.concat(response_body), code, response_headers, status
end

-- Function to make an HTTP POST request
function network_utils.http_post(url, data)
    local response_body = {}
    local res, code, response_headers, status = http.request{
        url = url,
        method = "POST",
        headers = {
            ["Content-Type"] = "application/x-www-form-urlencoded",
            ["Content-Length"] = tostring(#data)
        },
        source = ltn12.source.string(data),
        sink = ltn12.sink.table(response_body),
    }
    return table.concat(response_body), code, response_headers, status
end

-- Function to parse a URL into its components
function network_utils.parse_url(url)
    local parsed = {}
    parsed.protocol, parsed.host, parsed.path, parsed.query =
        url:match("^(http[s]?)://([^/]+)([^?]*)%??(.*)")
    return parsed
end

-- Function to validate an IP address
function network_utils.is_valid_ip(ip)
    local chunks = {ip:match("^(%d+)%.(%d+)%.(%d+)%.(%d+)$")}
    if #chunks == 4 then
        for _, v in pairs(chunks) do
            if tonumber(v) < 0 or tonumber(v) > 255 then
                return false
            end
        end
        return true
    end
    return false
end

-- Function to perform a DNS lookup
function network_utils.dns_lookup(hostname)
    local ip, err = socket.dns.toip(hostname)
    if not ip then
        return nil, err
    end
    return ip
end

-- Function to check if a port is open on a host
function network_utils.is_port_open(host, port, timeout)
    local client = socket.tcp()
    client:settimeout(timeout or 1)
    local connected, err = client:connect(host, port)
    client:close()
    return connected ~= nil, err
end

return network_utils
