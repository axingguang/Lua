
-- ngx.header.content_type="application/json"
-- ngx.header['Content-Type']="text/html;charset=UTF-8"

local redisPool = require "redisPool2"



nameSpace="yace"
local key=ngx.var.arg_key

if(key==nil)
        then ngx.say("param error")
        return
end

local res = redisPool.hget(nameSpace,key)
ngx.say(res)






