-- Imports

function import(class)
	_G[class:match("%.(.+)$")] = luajava.bindClass(class)
end

import("arc.Core")
import("mindustry.Vars")
import("mindustry.gen.Building")
import("mindustry.world.Block")

-- Globals

new = luajava.newInstance
print("global.lua yay")
print("Vars", Vars)
print("Vars.mods", Vars.mods)
print("Vars.mods.getScripts", Vars.mods.getScripts)
local scripts = Vars.mods:getScripts()

function log(context, obj)
    scripts:log(context, tostring(obj))
end

-- TODO: move this into injected code
local function print(text)
	log(modName .. "/" .. scriptName, text)
end

local utils = {"readString", "readBytes", "loadMusic", "loadSound",
    "readFile", "readBinFile", "writeFile", "writeBinFile"}
for i, name in ipairs(utils) do
    _G[name] = function(...)
        return scripts[name](scripts, ...)
    end
end

function extend(class, ...)
    local args = table.pack(...)
    local def = args[args.n]
    args[args.n] = nil
    return luajava.createProxy(class, def, table.unpack(args))
end

-- TODO: see if needed with lua
-- these are not strictly necessary, but are kept for edge cases
--[[function run(method) return java.lang.
const run = method => new java.lang.Runnable(){run: method}
const boolf = method => new Boolf(){get: method}
const boolp = method => new Boolp(){get: method}
const cons = method => new Cons(){get: method}
const prov = method => Prov(){get = method}]]

function newEffect(lifetime, renderer)
    return new(Effects.Effect, lifetime, new(Effects.EffectRenderer, {render = renderer}))
end
