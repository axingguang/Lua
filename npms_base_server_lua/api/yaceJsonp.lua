
ngx.header.content_type="application/json"
ngx.header['Content-Type']="text/html;charset=UTF-8"


local redis = require "resty.redis"
local cache = redis.new()
cache:set_timeout(1000)
local ok,err=cache.connect( cache,'10.150.120.33', '36379')
if not ok then
        ngx.say("connect redis fail",err)
        return
end
cache:auth("letvsc@2015")
cache:select(0)
nameSpace="yace"
local key=ngx.var.arg_key

if(key==nil)
        then ngx.say("param error")
        return
end

local res=cache:hget(nameSpace,key)
--ngx.log(ngx.ERR,res)
--
local callback=ngx.var.arg_callback;
if(callback==nil)
        then callback="abc123("
     --   return
else 
	callback=callback.."("
end
res=callback..res..")"




ngx.say(res)
cache:set_keepalive(10000,100)
