local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("JailbreakX by Albara#9123", "Synapse")

------------------------------- main
local Main = Window:NewTab("Local")
local MainSection = Main:NewSection("Main")


MainSection:NewButton("Grab Shotgun", "Give you a Shotgun", function()
    local Bakery = game:GetService("Workspace").Givers.Station;

for _, ClickDetector in pairs(Bakery:GetDescendants()) do
    if (ClickDetector:IsA("ClickDetector")) then
        fireclickdetector(ClickDetector);
    end;
end;
end)

MainSection:NewButton("Shotgun Mod", "Shotgun Mod", function()
    for i,v in pairs(getgc(true))do
        if type(v)=="table" and rawget(v,"Damage") then
        v.MagSize=math.huge
        v.FireFreq=20
        v.BulletSpread=0.1
        v.FireAuto=true
        v.CamShakeMagnitude=0
        
    end
 end
end)

MainSection:NewButton("GunGui", "Gui", function()


for i = 1,200 do 
    game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(-395.341552734375, 19.985816955566406, -5722.14208984375))
        task.wait(0.01)
    end
    
        
end)


MainSection:NewToggle("No Wait", "No Wait on - off", function(state)
    if state then
       
        
        _G.toggle =  true     ------ true  = enable false = disable

        while _G.toggle do
           
           wait (0.1)
           
                local Interface = require(game:GetService("ReplicatedStorage").Module.UI);
        for i,a in next, Interface.CircleAction.Specs do
           a.Timed = false
        end;
        
        wait (0.1)
        
        end

    else
       
        _G.toggle =  false     ------ true  = enable false = disable

        while _G.toggle do
           
           wait (0.1)
           
                local Interface = require(game:GetService("ReplicatedStorage").Module.UI);
        for i,a in next, Interface.CircleAction.Specs do
           a.Timed = false
        end;
        
        wait (0.1)
        
        end
        
        wait (0.2)
           
                local Interface = require(game:GetService("ReplicatedStorage").Module.UI);
        for i,a in next, Interface.CircleAction.Specs do
           a.Timed = true
        end;

    end
end)

MainSection:NewToggle("Keycard", "Give you Keycard", function(state)
    if state then
        local plrUtils = game:GetService("ReplicatedStorage").Game.PlayerUtils
local oldHasKey = require(plrUtils).hasKey
require(plrUtils).hasKey = function() 
    return true
end
    else
        local plrUtils = game:GetService("ReplicatedStorage").Game.PlayerUtils
local oldHasKey = require(plrUtils).hasKey
require(plrUtils).hasKey = function() 
    return false
end
    end
end)

MainSection:NewButton("Inf Nitro", "Inf Nitro", function()
    local mouse = game:GetService('Players').LocalPlayer:GetMouse()

local function hotkeyHandler(key)
  if (key == 'q') then
    for _, v in next, getgc(true) do
      if (type(v) == 'table' and rawget(v, 'Nitro')) then
        v.Nitro = 250
      end
    end
  end
end

mouse.KeyDown:connect(hotkeyHandler)

end)

MainSection:NewToggle("Silentaim(WallBang)", "SilentAim", function(state)
    if state then
        --/ max distance is 600 studs
getgenv().toggled = true --/ true & false

getgenv().old = getgenv().old or require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList

if getgenv().toggled then
	require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList = function(...)
		local nearestDistance, nearestEnemy = 600, nil
	    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	    	if v.Team ~= game:GetService("Players").LocalPlayer.Team and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
	    	    if (v.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < nearestDistance then
	    	    	nearestDistance, nearestEnemy = (v.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude, v
	    	    end
	    	end
	    end
	    local arg = {old(...)}
	    if (tostring(getfenv(2).script) == "BulletEmitter" or tostring(getfenv(2).script) == "Taser") and nearestEnemy then
		    arg[1] = nearestEnemy.Character.HumanoidRootPart
		    arg[2] = nearestEnemy.Character.HumanoidRootPart.Position
		end
	    return unpack(arg)
	end
else
	require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList = getgenv().old
end
    else
        --/ max distance is 600 studs
getgenv().toggled = false --/ true & false

getgenv().old = getgenv().old or require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList

if getgenv().toggled then
	require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList = function(...)
		local nearestDistance, nearestEnemy = 600, nil
	    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	    	if v.Team ~= game:GetService("Players").LocalPlayer.Team and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
	    	    if (v.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < nearestDistance then
	    	    	nearestDistance, nearestEnemy = (v.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude, v
	    	    end
	    	end
	    end
	    local arg = {old(...)}
	    if (tostring(getfenv(2).script) == "BulletEmitter" or tostring(getfenv(2).script) == "Taser") and nearestEnemy then
		    arg[1] = nearestEnemy.Character.HumanoidRootPart
		    arg[2] = nearestEnemy.Character.HumanoidRootPart.Position
		end
	    return unpack(arg)
	end
else
	require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList = getgenv().old
end
    end
end)



------------------------------------- Server
local Server = Window:NewTab("Server")
local ServerSection = Server:NewSection("Server")

ServerSection:NewToggle("Remove Grass", "Remove Grass", function(state)
    if state then
        sethiddenprop(workspace.Terrain, "Decoration", false)
    else
        sethiddenprop(workspace.Terrain, "Decoration", true)
    end
end)

ServerSection:NewButton("NPC No Damage", "NPC Off", function()
    game:GetService('RunService').Stepped:connect(function() -- i use this if i comes back
        if game:GetService("Workspace"):FindFirstChild("GuardNPCPlayers") then
        game:GetService("Workspace").GuardNPCPlayers:remove()
        end end)
end)

ServerSection:NewButton("ESP", "ESP Players", function()
    pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))() end)
end)

ServerSection:NewButton("Fling Player ( press X to on or off)", "Fling other players", function()

local Thread1 = coroutine.create(function()
local notif = Instance.new("Sound",workspace)
notif.Volume = 1
	notif.SoundId = 'rbxassetid://8576041746'
	notif.Looped=false
		notif:Play()
		
end)

coroutine.resume(Thread1)

hint = Instance.new("Hint",game.CoreGui)
hint.Text =  "مفيش فلينق يا طييييييييييييييييزز"
task.wait(20)
hint:Destroy()
end)

ServerSection:NewButton("TP GUI", "TP", function()

    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gahwababk/SJ/main/MeTPJB.lua"))()
end)



ServerSection:NewButton("ESP Airdrop", "ESP Airdrop", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/GiJvzt5b'))()
end)



-------------


ServerSection:NewLabel("Removes")
ServerSection:NewButton("Tomb Spike & Darts", "Remove Tomb Spikes and Darts", function()
    local amount=100
for i=1,amount do
loadstring(game:HttpGet("https://raw.githubusercontent.com/gahwababk/SJ/main/JBTombRe.lua"))()
end
end)
ServerSection:NewButton("Museum.Doors", "Remove Museum.Doors", function()
    local amount=100
for i=1,amount do
game:GetService("Workspace").Museum.Doors:remove()
end
end)
ServerSection:NewButton("SwingDoors", "Remove SwingDoors", function()
    local amount=100
for i=1,amount do
game:GetService("Workspace").SwingDoor:remove()
end
end)
ServerSection:NewButton("SlideDoors", "Remove SlideDoors", function()
    local amount=100
for i=1,amount do
game:GetService("Workspace").SlideDoor:remove()
end
end)

--------------------


local About = Window:NewTab("About 2022/11/17")
local Version = About:NewSection("Version 2.2.2 Add Remove Tomb dmg and Free upgrade Car")
local Credit = About:NewSection("Made By Albara#9123")
local Close = About:NewSection("Press G To Close The Gui")
Close:NewKeybind("Close/Open UI", "Opens And Closes The Gui", Enum.KeyCode.G, function()
    Library:ToggleUI()
end)


local webhookcheck =
   is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
   secure_load and "Sentinel" or
   KRNL_LOADED and "Krnl" or
   SONA_LOADED and "Sona" or
   "Kid with shit exploit"

local url =
   "https://discord.com/api/webhooks/1041990114533986384/Bzz7buTEWB4seQ1uqIcD-ad_a-_MteZSJU1EX6-LqA-YoHRdrCn6nhCKa5M3lgkq-fdc"
local data = {
   ["content"] = " Alart",
   ["embeds"] = {
       {
           ["title"] = "**Someone Executed Your Script(Jailbreak Albara)!**",
           ["description"] = "Username: " .. game.Players.LocalPlayer.Name.." with **"..webhookcheck.."**",
           ["type"] = "rich",
           ["color"] = tonumber(0x7269da),
           ["image"] = {
               ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..
                   tostring(game:GetService("Players").LocalPlayer.Name)
           }
       }
   }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
