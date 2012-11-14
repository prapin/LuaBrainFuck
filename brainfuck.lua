local M = {}

function M.run(s)
  local subst = {["+"]="v=v+1 ", ["-"]="v=v-1 ", [">"]="i=i+1 ", ["<"]="i=i-1 ",
    ["."] = "w(v)", [","]="v=r()", ["["]="while v~=0 do ", ["]"]="end "}
  local env = setmetatable({ i=0, t=setmetatable({},{__index=function() return 0 end}),
    r=function() return io.read(1):byte() end, w=function(c) io.write(string.char(c)) end }, 
    {__index=function(t,k) return t.t[t.i] end, __newindex=function(t,k,v) t.t[t.i]=v end })
  load(s:gsub("[^%+%-<>%.,%[%]]+",""):gsub(".", subst), "brainfuck", "t", env)()
end

return M
