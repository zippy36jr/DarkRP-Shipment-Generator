local serverWeps = weapons.GetList()
local shipmentDir = "GeneratedShipments/shipments.txt"


function addShipment(printName, wmodel, className)

    local shipment = "DarkRP.createShipment(\"".. printName .."\", {model = \"".. wmodel .."\", entity = \"".. className .."\", price = 100, amount = 10, separate = true, pricesep = 100})\n"


    if not file.Exists(shipmentDir, "DATA") then
        file.CreateDir("GeneratedShipments")
        file.Write(shipmentDir, shipment)
    else
        file.Append(shipmentDir, shipment)
    end
end



concommand.Add("printguns", function()

    for k , v in pairs(serverWeps) do
        local cname = v.ClassName
        local pname = v.PrintName
        local wmodel = v.WorldModel

        if string.sub(cname, 1, 7) == "m9k" then
            addShipment(pname, wmodel, cname)
        end
    end
end)