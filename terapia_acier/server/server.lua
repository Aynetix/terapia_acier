RegisterNetEvent('terapia_acier:giveacier')
AddEventHandler('terapia_acier:giveacier', function()
    local item = "acier"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count
    

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Tu n'as pas assez de place dans ton inventaire !")
    else
        xPlayer.addInventoryItem(item, 1)
        
    end
end)

RegisterNetEvent('terapia_acier:giveaciertraité')
AddEventHandler('terapia_acier:giveaciertraité', function()
    local item = "aciertraité"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count
    local Quantity_acier = xPlayer.getInventoryItem('acier').count
	local Quantityacier_aciertraite = Config.Quantityacier_aciertraite
	
	if Quantity_acier >= Quantityacier_aciertraite then
		if nbitemdansinventaire >= limiteitem then
			TriggerClientEvent('esx:showNotification', source, "Tu n'a pas assez de place dans ton inventaire !")
		else
			xPlayer.removeInventoryItem('acier', Quantityacier_aciertraite)
			xPlayer.addInventoryItem(item , 1)
			
		end
	else
		TriggerClientEvent('esx:showNotification', source, ('vous n\'avez pas d\' acier sur vous. ~b~il t\'en faut '..Quantityacier_aciertraite..' acier au total'))
    end
end)

RegisterNetEvent('terapia_acier:venteacier')
AddEventHandler('terapia_acier:venteacier', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local Quantity_acier = xPlayer.getInventoryItem('aciertraité').count
	local Quantityacier_aciervente = Config.Quantityacier_aciervente
	local Prixacier = Config.prixreventeacier

	if Quantity_acier >= Quantityacier_aciervente then
			xPlayer.removeInventoryItem('aciertraité', Quantityacier_aciervente)
	        xPlayer.addAccountMoney('money', Prixacier)
    else
		TriggerClientEvent('esx:showNotification', source, ('vous n\'avez pas d\' acier sur vous. ~b~il t\'en faut '.. Quantityacier_aciervente..' acier au total'))
    end
end)
