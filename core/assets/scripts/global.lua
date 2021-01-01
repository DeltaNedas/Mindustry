-- Generated class. Do not modify.

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

--[[importPackage(Packages.arc.math.geom)
importPackage(Packages.mindustry.graphics)
importPackage(Packages.mindustry.ui.dialogs)
importPackage(Packages.mindustry.world.blocks.liquid)
importPackage(Packages.mindustry.world.blocks)
importPackage(Packages.arc.scene.event)
importPackage(Packages.arc.scene.actions)
importPackage(Packages.mindustry.gen)
importPackage(Packages.arc.struct)
importPackage(Packages.mindustry.world.blocks.defense.turrets)
importPackage(Packages.mindustry.game)
importPackage(Packages.arc.graphics)
importPackage(Packages.mindustry.ui.fragments)
importPackage(Packages.mindustry.ui)
importPackage(Packages.mindustry.world.blocks.power)
importPackage(Packages.mindustry.entities.traits)
importPackage(Packages.mindustry.entities.effect)
importPackage(Packages.arc.math)
importPackage(Packages.arc.scene.ui)
importPackage(Packages.mindustry.world.blocks.defense)
importPackage(Packages.mindustry.ctype)
importPackage(Packages.mindustry.entities.type)
importPackage(Packages.mindustry.world.meta)
importPackage(Packages.arc.func)
importPackage(Packages.mindustry.editor)
importPackage(Packages.mindustry.entities.units)
importPackage(Packages.mindustry.maps.filters)
importPackage(Packages.mindustry.world)
importPackage(Packages.arc.scene.utils)
importPackage(Packages.mindustry.maps.generators)
importPackage(Packages.mindustry.world.blocks.distribution)
importPackage(Packages.mindustry.entities.bullet)
importPackage(Packages.mindustry.content)
importPackage(Packages.mindustry.world.meta.values)
importPackage(Packages.mindustry.world.blocks.production)
importPackage(Packages.arc)
importPackage(Packages.mindustry.world.blocks.units)
importPackage(Packages.mindustry.core)
importPackage(Packages.mindustry.world.consumers)
importPackage(Packages.mindustry.entities.type.base)
importPackage(Packages.arc.scene.ui.layout)
importPackage(Packages.mindustry.type)
importPackage(Packages.mindustry.input)
importPackage(Packages.mindustry.entities)
importPackage(Packages.arc.scene.style)
importPackage(Packages.mindustry.world.blocks.sandbox)
importPackage(Packages.mindustry.ui.layout)
importPackage(Packages.mindustry.maps.zonegen)
importPackage(Packages.arc.graphics.g2d)
importPackage(Packages.mindustry.ai)
importPackage(Packages.mindustry.world.modules)
importPackage(Packages.mindustry.world.blocks.storage)
importPackage(Packages.arc.scene)
importPackage(Packages.mindustry.maps)
importPackage(Packages.mindustry.world.blocks.logic)
importPackage(Packages.arc.util)
importPackage(Packages.mindustry.world.producers)
importPackage(Packages.mindustry)]]
