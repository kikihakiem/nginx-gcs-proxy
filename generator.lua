local generator = {}

function generator.generate()
    local gen = lua2go.Load('./generator.so')
    local bucket = lua2go.ToGo(ngx.var.bucket)
    local file = lua2go.ToGo(ngx.var.file)
    local go_result = gen.GenerateSignedURL(bucket, file, lua2go.ToGo(120))
    local lua_result = lua2go.ToLua(go_result)
    return lua_result[0]
end

return generator
    