local accumul = {}
local function add(...)
	for _,v in ipairs{...} do
		accumul[#accumul+1] = tostring(v)
	end
end

local subst = {['()']='+', ['{}']='-', ['[_]']='<', ['(_)']='>', 
	['{_}']='[', ['[__]']=']', ['(__)']='.', ['{__}']=','}
local function run(a)
	local s = table.concat(accumul)
	accumul={}
	if a == __ then return print("_"..s.."(_,__)") end -- Quine!
	s=s:gsub("[%[%(%{]_*[%]%)%}]", subst)	
	print(s)
end

local meta = {
  __call = function(f, a, b) 
    if b then return run(b) end
	if a == nil then add'()'
	elseif a.s then add('(',a,')')
	elseif a[1] then add('{',a[1],'}')
	else add('{}')
	end
	return _
  end,
  __index = function(t,k) add('[',k,']') return _ end,
  __tostring = function(t) return t.s end,
}
_ = setmetatable({s='_'}, meta)
__ = setmetatable({s='__'}, meta)

