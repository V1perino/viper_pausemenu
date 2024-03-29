local charData, currentHint = nil, ""
local isSpawned = false

local hints = {
    "Doporučujeme zkontrolovat bindy! Pokud přecházíš z jiného serveru je možné, že něco nemusí fungovat.",
    "Přes 'B' zapínáš pásy v autě, takže si je nezapomeň při ukončení jízdy zase sundat přes 'B', jinak nevystoupíš! (Můžeš si je přebindovat!)",
    "Většinu bindů si můžeš přebindovat! Stačí jít do Settings -> Key Binds -> FiveM!",
    "Přes '+' a '-' na numerické klávesnici si můžeš zvyšovat a snižovat omezovač rychlosti!",
    "Většinu předmětů v inventáři použiješ pomocí dvojitého kliknutí levého tlačítka myši.",
    "Narazil jsi na nějaký bug? Prosím vyfoť konzoli F8 a podrobně popiš chybu na našem discordu server.CZ - CZ/SK RP -> #bugy",
}

Citizen.CreateThread(function()
    ReplaceHudColourWithRgba(
        117,
        147,19,19,
        255)
 end)  

Citizen.CreateThread(
    function()
        if status == "spawned" or status == "dead" then
            isSpawned = true
            charData = {
                firstname = data.firstname,
                lastname = data.lastname,
                birth = data.birth
            }
        end
        while true do
            currentHint = hints[math.random(#hints)]
            Citizen.Wait(1800000)
        end
    end
)

RegisterNetEvent("s:statusUpdated")
AddEventHandler("s:statusUpdated", function(status)
    if status == "choosing" then
        isSpawned, charData = false, nil
    elseif status == "spawned" or status == "dead" then
        isSpawned = true
        local data = exports.data:getUserVar("character")
        charData = {
            firstname = data.firstname,
            lastname = data.lastname,
            birth = data.birth
        }
    end
end)
    

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        BeginScaleformMovieMethodOnFrontendHeader("SHIFT_CORONA_DESC")
        ScaleformMovieMethodAddParamBool(true)
        EndScaleformMovieMethod()

        --BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_COLOUR")
        --ScaleformMovieMethodAddParamInt(1); --// Sloupec
        --ScaleformMovieMethodAddParamInt(_header.stripColor); --// Barva ID
        --EndScaleformMovieMethodReturnValue()

        BeginScaleformMovieMethodOnFrontendHeader("SET_HEADER_TITLE")
        ScaleformMovieMethodAddParamTextureNameString(makeFontText("~r~ CorteX Roleplay</FONT>"))
        ScaleformMovieMethodAddParamBool(true)
        ScaleformMovieMethodAddParamTextureNameString(makeFontText(currentHint))
        ScaleformMovieMethodAddParamBool(true)
        EndScaleformMovieMethod()
        
        if isSpawned and charData then
            BeginScaleformMovieMethodOnFrontend("SET_HEADING_DETAILS")
            ScaleformMovieMethodAddParamTextureNameString(makeFontText(charData.firstname))
            ScaleformMovieMethodAddParamTextureNameString(makeFontText(charData.lastname))
            ScaleformMovieMethodAddParamTextureNameString(makeFontText(charData.birth))
            EndScaleformMovieMethod()
        end
    end
end)

function makeFontText(text)
    return ("<FONT FACE='Fire Sans'> " .. text .. " </FONT>")
end


Citizen.CreateThread(function()
    -- Main
    AddFontTextEntry("PM_SCR_MAP", "MAPA")
    AddFontTextEntry("PM_SCR_STA", "STATUS")
    AddFontTextEntry("PM_SCR_GAM", "HRA")
    AddFontTextEntry("PM_SCR_INF", "INFORMACE")
    AddFontTextEntry("PM_SCR_SET", "NASTAVENÍ")
    AddFontTextEntry("PM_SCR_GAL", "GALERIE")
    AddFontTextEntry("PM_SCR_RPL", "R* EDITOR")

    -- Game
    AddFontTextEntry("PM_PANE_LEAVE", "ODPOJIT SERVER")
    AddFontTextEntry("PM_PANE_QUIT", "VYPNOUT HRU")
    -- Stats
    AddFontTextEntry("MP_STATS1", "Kariéra")
    AddFontTextEntry("MP_STATS2", "Skill")
    AddFontTextEntry("MP_STATS3", "O vás")
    AddFontTextEntry("MP_STATS4", "Kriminalita")
    AddFontTextEntry("MP_STATS5", "Vozidla")
    AddFontTextEntry("MP_STATS6", "Peníze")
    AddFontTextEntry("MP_STATS7", "Agresivita")
    AddFontTextEntry("PM_AWARDS", "------")
    AddFontTextEntry("PM_INF_UNLT", "------")
    AddFontTextEntry("PM_WEAPONS", "------")
    -- Info
    AddFontTextEntry("PM_PANE_FEE", "Notifikace")
    AddFontTextEntry("PM_PANE_HLP", "Pomoc")
    AddFontTextEntry("PM_PANE_BRI", "Dialog")
    AddFontTextEntry("PM_PANE_MIS", "Mise")

    -- Settings
    AddFontTextEntry("0x92320117", "Gamepad")
    AddFontTextEntry("PM_PANE_AUD", "Zvuk")
    AddFontTextEntry("PM_PANE_CAM", "Kamera")
    AddFontTextEntry("PM_PANE_DIS", "Displej")
    AddFontTextEntry("MO_VOUT", "Voice Chat")
    AddFontTextEntry("0xE782A771", "Rockstar Editor")
    AddFontTextEntry("0xFBB6E685", "Rozšířená grafika")
    AddFontTextEntry("0xD3A0C438", "Grafika")
    AddFontTextEntry("0x82FBED04", "Bindy")
    AddFontTextEntry("0x0A0C22D4", "Klávesnice / Myš")
    AddFontTextEntry("GFX_VIDMEM", "Video paměť")
    AddFontTextEntry("0x51B058B3", "Monitor")
    AddFontTextEntry("0xA28A6F51", "FXAA")
    AddFontTextEntry("0x38111CA3", "MSAA")
    AddFontTextEntry("0xFB0E70C2", "V-Sync")
    AddFontTextEntry("0xC4FD3301", "Pause Game On Focus Loss")
    AddFontTextEntry("GFX_SCALING", "Render Resolution")
    AddFontTextEntry("GFX_BUDGET", "Extended Texture Budget")
    AddFontTextEntry("0x74F73ED3", "Shadow Quality")
    AddFontTextEntry("0x78F76ACC", "Texture Quality")
    AddFontTextEntry("0x11739C25", "Shader Quality")
    AddFontTextEntry("0xC43D3B9F", "Water Quality")
    AddFontTextEntry("0x544B440F", "Particles Quality")
    AddFontTextEntry("0x5CD4E15C", "Grass Quality")
    AddFontTextEntry("0xCD676AF6", "Reflection Quality")
    AddFontTextEntry("0x67117E6F", "Ignore Suggested Limits")
    AddFontTextEntry("0x87D30231", "DirectX Version")
    AddFontTextEntry("0xD627A8D5", "Population Density")
    AddFontTextEntry("0x74EFCDDE", "Population Variety")
    AddFontTextEntry("0xF84B169F", "Distance Scaling")
    AddFontTextEntry("0x30860474", "Reflection MSAA")
    AddFontTextEntry("0x73C258A0", "Soft Shadows")
    AddFontTextEntry("0x367DB5EF", "Post FX")
    AddFontTextEntry("0x1752894A", "Motion Blur Strength")
    AddFontTextEntry("MO_DOF", "In-Game Depth Of Field Effects")
    AddFontTextEntry("0x19C1AD65", "Anisotropic Filtering")
    AddFontTextEntry("0xE0306CDD", "Ambient Occlusion")
    AddFontTextEntry("0x0F986BB4", "Tessellation")
    AddFontTextEntry("MO_RDF", "Restore Defaults")
    AddFontTextEntry("MO_GFX_NORM", "Normální")
    AddFontTextEntry("MO_CS_HIGH", "Vysoké")
    AddFontTextEntry("MO_GFX_VHIGH", "Velmi vysoké")
    AddFontTextEntry("MO_GFX_ULTRA", "Ultra")
    AddFontTextEntry("MO_GFX_X2", "X2")
    AddFontTextEntry("MO_GFX_X4", "X4")
    AddFontTextEntry("MO_GFX_X8", "X8")
    AddFontTextEntry("MO_OFF", "Vypnuto")
    AddFontTextEntry("MO_ON", "Zapnuto")
    AddFontTextEntry("GFX_SHARP", "Sharp")
    AddFontTextEntry("GFX_SOFT", "Soft")
    AddFontTextEntry("GFX_SOFTER", "Softer")
    AddFontTextEntry("GFX_SOFTEST", "Softest")
    AddFontTextEntry("0xF390EF41", "AMD CHS")
    AddFontTextEntry("GFX_NVIDIA", "NVIDIA PCSS")
    AddFontTextEntry("MP0_STAMINA", "Stamina")
    AddFontTextEntry("MP0_LUNG_CAPACITY", "Plavání")
    AddFontTextEntry("MP0_DRIVING_ABILITY", "Řízení")
    AddFontTextEntry("MP0_STRENGTH", "Síla")

    -- MAP Locations
    AddFontTextEntry("SANCHIA", "San Chianski Mountain Range")
    AddFontTextEntry("OCEANA", "Pacific Ocean")

    -- Blips
    AddFontTextEntry("BLIP_PROPCAT", "Brigády")
end)

function AddFontTextEntry(entry, text)
    AddTextEntry(entry, "<FONT FACE='Fire Sans'> " .. text .. " </FONT>")
end
