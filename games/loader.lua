--// Iggy Hub Universal Loader
local StarterGui = game:GetService("StarterGui")

local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 5
        })
    end)
end

-- Direct link to your new IggyHub repo games folder:
local BASE_URL = "https://raw.githubusercontent.com/NEC-Hub/IggyHub/main/games/"

-- Game Routing Table
local SupportedGames = {
    [107653945083776] = "ratf.lua",       -- Roll Anime to Fight!
    [94640181989498]  = "chicken.lua",    -- Grow a Chicken Farm / Fighter
}

local currentPlaceId = game.PlaceId
local scriptName = SupportedGames[currentPlaceId]

if scriptName then
    notify("Iggy Hub", "Supported game detected! Loading script...")
    
    local success, err = pcall(function()
        loadstring(game:HttpGet(BASE_URL .. scriptName))()
    end)
    
    if not success then
        notify("Iggy Hub Error", "Failed to load: " .. tostring(err))
        warn("[Iggy Hub Error]:", err)
    end
else
    notify("Iggy Hub", "This game is currently not supported.")
    warn("[Iggy Hub]: PlaceId " .. tostring(currentPlaceId) .. " is not supported.")
end
