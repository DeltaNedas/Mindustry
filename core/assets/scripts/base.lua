function log(context, obj)
    Vars.mods.getScripts().log(context, tostring(obj))
end

scriptName = "base.js"
modName = "none"

function print(text)
	log(scriptName, text)
end

function extendContent(classType, name, params)
    return JavaAdapter(classType, params, name)
end

function extend(classType, params)
    return new JavaAdapter(classType, params)
end

function run(method) return java.lang.
const run = method => new java.lang.Runnable(){run: method}
const boolf = method => new Boolf(){get: method}
const boolp = method => new Boolp(){get: method}
const cons = method => new Cons(){get: method}
const prov = method => Prov(){get = method}
function newEffect(lifetime, renderer) return Effects.Effect(lifetime, Effects.EffectRenderer{render = renderer}) end
Call = Packages.mindustry.gen.Call
Calls = Call //backwards compat
