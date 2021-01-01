-- Globals

new = luajava.newInstance
local scripts = Vars.mods:getScripts()

function log(context, obj)
    scripts:log(context, tostring(obj))
end

-- TODO: move this into injected code
--local _print_path = modName .. "/" .. scriptName
function print(text)
	log(_ENV.modName .. "/" .. _ENV.scriptName, text)
end

local import = {"readString", "readBytes", "loadMusic", "loadSound",
    "readFile", "readBinFile", "writeFile", "writeBinFile"}
for i, name in ipairs(import) do
	_G[name] = function(...)
		return scripts[name](scripts, ...)
	end
end

function extend(class, ...)
    local args = table.pack(...)
    local def = args[args.n]
    args[args.n] = nil
    return luajava.createProxy(class, def, table.unpack(args)
end

-- TODO: see if needed
-- these are not strictly necessary, but are kept for edge cases
--[[function run(method) return java.lang.
const run = method => new java.lang.Runnable(){run: method}
const boolf = method => new Boolf(){get: method}
const boolp = method => new Boolp(){get: method}
const cons = method => new Cons(){get: method}
const prov = method => Prov(){get = method}
function newEffect(lifetime, renderer) return Effects.Effect(lifetime, Effects.EffectRenderer{render = renderer}) end
Call = Packages.mindustry.gen.Call]]

function newEffect(lifetime, renderer)
    return new(Effects.Effect, lifetime, new(Effects.EffectRenderer, {render = renderer}))
end
