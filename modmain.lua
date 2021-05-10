GLOBAL.UpvalueHacker = GLOBAL.require "tools/UpvalueHacker" -- debug

AddClassPostConstruct("components/named_replica", function(self)
    local function OnNameDirty(inst)
        local name = inst.replica.named._name:value() -- a netvar sent from the host. 
        name = "Yakumo"
        inst.name = name ~= "" and name or STRINGS.NAMES[string.upper(inst.prefab)]
    end
    
    self.inst.event_listening.namedirty[self.inst] = nil -- remove old namedirty listener.
    
    if not GLOBAL.TheWorld.ismastersim then
        self.inst:ListenForEvent("namedirty", OnNameDirty) -- redefine event callback.
    end
end)