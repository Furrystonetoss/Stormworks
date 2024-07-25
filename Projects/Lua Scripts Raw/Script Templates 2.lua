--Gets the nearest vehicles. Requires a g_savedata table containing all spawned vehicles id's
function getNearestVehiclePl(uid)
    plPos, suc = server.getPlayerPos(uid)
    if suc then
        kDis = 0xFFFFFFFF
        kVid = 0
        for k,v in pairs(g_savedata.vehiclesAll) do
            vPos = server.getVehiclePos(v)
            dis = matrix.distance(plPos,vPos)
            if dis <= kDis then
                kDIs = dis
                kVid = v
            end
        end
        if kDIs <= min_radius then -- Global that defines the min search radius.
            return kVid, kDis, true
        else
            server.announce(AddonName,"Error: No vehicle found in target proximity")
            return nil, nil, false
        end
    else return nil, nil, false
    end
end