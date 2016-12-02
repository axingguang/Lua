ngx.header.content_type="application/json;charset=UTF-8"



local utils = require "utils"
local res = utils.req('/api/product/base/getAllSaleCom',{})
ngx.say(res)
