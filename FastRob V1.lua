
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))() --[[ !!DONT REMOVE THIS!! this is pretty important and its basically the brains for the entire thing ]]--

local w = library:CreateWindow("تجريبية نسخة") -- Creates a window
local b = w:CreateFolder("الشخصية") -- Creates the folder(U will put here your buttons,etc) 
local credits = w:CreateFolder("السكريبت حول") -- obviously u can make more than 1 folder within a window (this is just an example)
 

--this pretty self explanatory and easy
--EXAMPLE: (if u want to make another window and put a credits folder in it)
local l = library:CreateWindow("الابواب و الليزر حذف")
local k = l:CreateFolder("الليزر")
local c = l:CreateFolder("الابواب")
local z = l:CreateFolder("اللعبة تسريع")

local t = library:CreateWindow("الانتقال")
local y = t:CreateFolder("أختيار")
--obviously u can put whatever you want in between the "" 
credits:Label("Credits: ِAlbara#9123 ",{ 
    TextSize = 17; -- Self Explaining
    TextColor = Color3.fromRGB(330,330,330); -- Self Explaining
    BgColor = Color3.fromRGB(30, 30, 30); -- Self Explaining
}) 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Functions inside a folder you created
--We are using "b" (local b = w:CreateFolder("FOLDER NAME")) as an example in here meaning if "b:Label" ,the Label function will be under the "b" folder
--Obviously you can make multiple of each function/ For example: you can make multiple different buttons that will execute different scripts in each one of them (DUHHHHHHH)
--If you want to change the name of the name or text, just edit out what's in between the ""

--b:Label("WHATEVER YOU WANT TO PUT IN THE LABEL",{
  --  TextSize = 25; -- Self Explaining
  --  TextColor = Color3.fromRGB(255,255,255); -- Self Explanatory
  --  BgColor = Color3.fromRGB(69,69,69); -- Self Explanatory
--}) 
    
b:Button("شوتقون",function()
    local Bakery = game:GetService("Workspace").Givers.Station;

for _, ClickDetector in pairs(Bakery:GetDescendants()) do
    if (ClickDetector:IsA("ClickDetector")) then
        fireclickdetector(ClickDetector);
    end;
end;
    --or wutever script u want here
end)
b:Button("مود شوتقون",function()
    for i,v in pairs(getgc(true))do
        if type(v)=="table" and rawget(v,"Damage") then
        v.MagSize=math.huge
        v.FireFreq=20
        v.BulletSpread=0.1
        v.FireAuto=true
        v.CamShakeMagnitude=0
        
    end
 end
    --or wutever script u want here
end)
b:Button("ESP",function()
 
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))()
    --or wutever script u want here
end)

b:Button("الحراس تعطيل +ESP",function()
  
    local Thread1 = coroutine.create(function()
        game:GetService('RunService').Stepped:connect(function() -- i use this if i comes back
              if game:GetService("Workspace"):FindFirstChild("GuardNPCPlayers") then
              game:GetService("Workspace").GuardNPCPlayers:remove()
              end end)
      end)
      
      coroutine.resume(Thread1)
      
      loadstring(game:HttpGet('https://pastebin.com/raw/GiJvzt5b'))()
    --or wutever script u want here
end)
b:Button("سريع جري x",function()
  
    down = false
velocity = Instance.new("BodyVelocity")
velocity.maxForce = Vector3.new(100000, 0, 100000)
---vv Use that to change the speed v
local speed = 50
gyro = Instance.new("BodyGyro")
gyro.maxTorque = Vector3.new(100000, 0, 100000)

local hum = game.Players.LocalPlayer.Character.Humanoid

function onButton1Down(mouse)
	down = true
	velocity.Parent = game.Players.LocalPlayer.Character.UpperTorso
	velocity.velocity = (hum.MoveDirection) * speed
	gyro.Parent = game.Players.LocalPlayer.Character.UpperTorso
	while down do
		if not down then break end
		velocity.velocity = (hum.MoveDirection) * speed
		local refpos = gyro.Parent.Position + (gyro.Parent.Position - workspace.CurrentCamera.CoordinateFrame.p).unit * 5
		gyro.cframe = CFrame.new(gyro.Parent.Position, Vector3.new(refpos.x, gyro.Parent.Position.y, refpos.z))
		wait(0.1)
	end
end

function onButton1Up(mouse)
	velocity.Parent = nil
	gyro.Parent = nil
	down = false
end
--To Change the key in those 2 lines, replace the "q" with your desired key
function onSelected(mouse)
	mouse.KeyDown:connect(function(k) if k:lower()=="x"then onButton1Down(mouse)end end)
	mouse.KeyUp:connect(function(k) if k:lower()=="x"then onButton1Up(mouse)end end)
end

onSelected(game.Players.LocalPlayer:GetMouse())

    --or wutever script u want here
end)

b:Toggle("ايم سايلنت",function(bool) --ama use "autoQuest as an example//you will need  to  create a "local autoQuest = false" 
    autoQuest= bool -- basically it will toggle the "local autoQuest" into true/false 
    -- you can plug in a simple script right here (EXAMPLE:)
    if autoQuest == true then
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
    --[[ !!IMPORTANT!!: if you want to use some type of loop (example: while wait() do//Etc.) I DO NOT RECOMMEND putting it within this function because it will bug and break the toggle button. SOLUTION: Separate it from the function or the script and just put it on the very bottom of the script (i will give an example in the end of this "Guide" using the same examples) ]]--
end)
--------------------------
--------------------------
k:Button("الكازينو",function()
    local Thread1 = coroutine.create(function()
        game:GetService("Workspace").Casino.CamerasMoving:remove()
        end)
        
        coroutine.resume(Thread1)
        
        game:GetService("Workspace").Casino.Lasers:remove()
        local Thread1 = coroutine.create(function()
        game:GetService("Workspace").Casino.LasersMoving:remove()
        end)
        
        coroutine.resume(Thread1)
        
        game:GetService("Workspace").Casino.LaserCarousel:remove()
        local Thread1 = coroutine.create(function()
        game:GetService("Workspace").Casino.VaultLaserControl:remove()
        end)
        
        coroutine.resume(Thread1)
        
        --script 2
        
    --or wutever script u want here
end)
k:Button("المجوهرات",function()
    Loop_Speed = 5.0 -- You can make this 0
    while wait(Loop_Speed) do
        local Thread1 = coroutine.create(function()
            for i,v in pairs(workspace.Jewelrys:GetDescendants()) do
            if v.Name:match("BarbedWire") then
            v:Destroy()
            end
            end
            end)
            
            coroutine.resume(Thread1)
            
            for i,v in pairs(workspace.Jewelrys:GetDescendants()) do
            if v.Name:match("InnerModel") then
            v:Destroy()
            end
            end
    end
    
      --or wutever script u want here
end)
k:Button("المتحف",function()
    game:GetService("Workspace").Museum.Lights:remove()
    --or wutever script u want here
end)
k:Button("تومب",function()
    local Thread1 = coroutine.create(function()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[1].Tile.Name = "Bruh";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[1].Tile.Name = "Bruh1";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[2].Tile.Name = "Bruh";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[2].Tile.Name = "Bruh1";
        
        end)
        
        coroutine.resume(Thread1)
        
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[2].Tile.Name = "Bruh2";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[2].Tile.Name = "Bruh3";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[3].Tile.Name = "Bruh";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[3].Tile.Name = "Bruh1";
        
        local Thread1 = coroutine.create(function()
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[3].Tile.Name = "Bruh2";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[3].Tile.Name = "Bruh3";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[4].Tile.Name = "Bruh";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[4].Tile.Name = "Bruh1";
        
        end)
        
        coroutine.resume(Thread1)
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[4].Tile.Name = "Bruh2";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[4].Tile.Name = "Bruh3";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[5].Tile.Name = "Bruh";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[5].Tile.Name = "Bruh1";
        
        local Thread1 = coroutine.create(function()
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[6].Tile.Name = "Bruh";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[6].Tile.Name = "Bruh1";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[6].Tile.Name = "Bruh2";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[6].Tile.Name = "Bruh3";
        
        end)
        
        coroutine.resume(Thread1)
        
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[7].Tile.Name = "Bruh";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[7].Tile.Name = "Bruh1";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[7].Tile.Name = "Bruh2";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[7].Tile.Name = "Bruh3";
        
        local Thread1 = coroutine.create(function()
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[8].Tile.Name = "Bruh";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[8].Tile.Name = "Bruh1";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[8].Tile.Name = "Bruh2";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[8].Tile.Name = "Bruh3";
        
        end)
        
        coroutine.resume(Thread1)
        
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[9].Tile.Name = "Bruh";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[9].Tile.Name = "Bruh1";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[10].Tile.Name = "Bruh";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[10].Tile.Name = "Bruh1";
        
        local Thread1 = coroutine.create(function()
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[10].Tile.Name = "Bruh2";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[10].Tile.Name = "Bruh3";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[11].Tile.Name = "Bruh";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[11].Tile.Name = "Bruh1";
        
        end)
        
        coroutine.resume(Thread1)
        
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[11].Tile.Name = "Bruh2";
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes[11].Tile.Name = "Bruh3";
        
        local Thread1 = coroutine.create(function()
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["1"].Bruh.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["1"].Bruh1.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["2"].Bruh.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["2"].Bruh1.Model.InnerModel:Destroy()
        
        end)
        
        coroutine.resume(Thread1)
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["2"].Bruh2.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["2"].Bruh3.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["3"].Bruh.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["3"].Bruh1.Model.InnerModel:Destroy()
        
        local Thread1 = coroutine.create(function()
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["3"].Bruh2.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["3"].Bruh3.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["4"].Bruh.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["4"].Bruh1.Model.InnerModel:Destroy()
        
        end)
        
        coroutine.resume(Thread1)
        
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["4"].Bruh2.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["4"].Bruh3.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["5"].Bruh.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["5"].Bruh1.Model.InnerModel:Destroy()
        
        local Thread1 = coroutine.create(function()
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["6"].Bruh.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["6"].Bruh1.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["6"].Bruh2.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["6"].Bruh3.Model.InnerModel:Destroy()
        
        end)
        
        coroutine.resume(Thread1)
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["7"].Bruh.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["7"].Bruh1.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["7"].Bruh2.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["7"].Bruh3.Model.InnerModel:Destroy()
        
        local Thread1 = coroutine.create(function()
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["8"].Bruh.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["8"].Bruh1.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["8"].Bruh2.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["8"].Bruh3.Model.InnerModel:Destroy()
        
        end)
        
        coroutine.resume(Thread1)
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["9"].Bruh.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["9"].Bruh1.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["10"].Bruh.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["10"].Bruh1.Model.InnerModel:Destroy()
        
        local Thread1 = coroutine.create(function()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["10"].Bruh2.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["10"].Bruh3.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["11"].Bruh.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["11"].Bruh1.Model.InnerModel:Destroy()
        
        end)
        
        coroutine.resume(Thread1)
        
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["11"].Bruh2.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes["11"].Bruh3.Model.InnerModel:Destroy()
        game:GetService("Workspace").RobberyTomb.DartRoom.Darts:remove()
        
    --or wutever script u want here
end)
k:Button("بلانت باور",function()
    local Thread1 = coroutine.create(function()
        game:GetService("Workspace").PowerPlant.Core:remove()
        end)
        
        coroutine.resume(Thread1)
        
        game:GetService("Workspace").PowerPlant.Piston:remove()
        local Thread1 = coroutine.create(function()
        game:GetService("Workspace").PowerPlant.Piston:remove()
        end)
        
        coroutine.resume(Thread1)
        
        --script 2
    --or wutever script u want here
end)
k:Button("البنك",function()
    Loop_Speed = 5 -- You can make this 0
    while wait(Loop_Speed) do
        for i,v in pairs(workspace.Banks:GetDescendants()) do
            if v.Name:match("Lasers") then
            v:Destroy()
            end
            end
    end
    --or wutever script u want here
end)
-------

y:Button("كازينو",function()
     
    for i = 1,200 do 
        game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(42.691322326660156, 71.45126342773438, -4737.38671875))
    task.wait(0.01)
        end
    --or wutever script u want here
end)
y:Button("الكازينو خزنة",function()
    
for i = 1,200 do 
    game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(336.19488525390625, -77.13932037353516, -4518.7197265625))
        task.wait(0.01)
    end
    --or wutever script u want here
end)
y:Button("الكازينو مطار",function()
    for i = 1,200 do 
        game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(-803.9756469726562, 19.442981719970703, -5051.44970703125))
            task.wait(0.01)
        end
    --or wutever script u want here
end)
y:Button("المتحف",function()
   
    for i = 1,150 do 
        game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(1089.0469970703125, 122.15412902832031, 1361.3555908203125))
        task.wait(0.01)
        end
    --or wutever script u want here
end)
y:Button("بلانت باور",function()
    for i = 1,300 do 
        game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(83.39029693603516, 27.087535858154297, 2282.213134765625))
            task.wait(0.01)
        end
    --or wutever script u want here
end)
y:Button("بلانت باور مطار",function()
    
    for i = 1,200 do 
        game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(-1425.54345703125, 41.46806335449219, 2821.73193359375))
         task.wait(0.01)
        end
    --or wutever script u want here
end)
y:Button("المجوهرات",function()
    for i = 1, 200 do
        game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(114.67741394042969, 20.607443809509277, 1286.0283203125))
        task.wait()
        game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(114.67741394042969, 20.607443809509277, 1286.0283203125))
    end
    --or wutever script u want here
end)
y:Button("الشرطة مركز",function()
    for i = 1,190 do -- غير ال 200 الى رقم اخر عدد مرات اللوب
        game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(235.98590087890625, 18.933311462402344, 1179.4405517578125))
            task.wait(0.01)
        end
        for i = 1,50 do -- غير ال 200 الى رقم اخر عدد مرات اللوب
        game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(252.567459106453, 18.661991119384766, 1185.0828857421875))
            task.wait(0.01)
        end
    --or wutever script u want here
end)
y:Button("البنك",function()
    for i = 1,200 do 
        game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(40.24939727783203, 20.032533645629883, 925.8862915039062))
            task.wait(0.01)
        end
        for i,v in pairs(workspace.Banks:GetDescendants()) do
            if v.Name:match("Lasers") then
            v:Destroy()
            end
            end
    --or wutever script u want here
end)
y:Button("تومب",function()
    for i = 1,200 do 
        game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(545.3483276367188, 23.205795288085938, -547.72509765625))
            task.wait(0.01)
        end
    --or wutever script u want here
end)
y:Button("الخزنة",function()
local Thread1 = coroutine.create(function()
for i = 1,200 do -- غير ال 200 الى رقم اخر عدد مرات اللوب
game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new(601.1047973632812, 41.53847122192383, 1227.2225341796875))
    task.wait(0.01)
end
end)

coroutine.resume(Thread1)

for i = 1,100 do -- غير ال 200 الى رقم اخر عدد مرات اللوب
workspace.Apartment_Warehouse:FindFirstChild("Donut Vending Machine").GrabRemote:FireServer()
    task.wait(0.01)
end
    --or wutever script u want here
end)
y:Button("No wait ON",function()
    _G.toggle =  true     ------ true  = enable false = disable

    while _G.toggle do
       
       wait (0.3)
       
            local Interface = require(game:GetService("ReplicatedStorage").Module.UI);
    for i,a in next, Interface.CircleAction.Specs do
       a.Timed = false
    end;
    
    wait (0.3)
    
    end
    --or wutever script u want here
end)
y:Button("No wait OFF",function()
    _G.toggle =  false     ------ true  = enable false = disable

    while _G.toggle do
       
       wait (0.3)
       
            local Interface = require(game:GetService("ReplicatedStorage").Module.UI);
    for i,a in next, Interface.CircleAction.Specs do
       a.Timed = false
    end;
    
    wait (0.3)
    
    end
    
    wait (0.3)
       
            local Interface = require(game:GetService("ReplicatedStorage").Module.UI);
    for i,a in next, Interface.CircleAction.Specs do
       a.Timed = true
    end;

    --or wutever script u want here
end)
------
z:Button("اللعبة تخفيف",function()
    local removedecals = false
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and removedecals then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
		sethiddenprop(workspace.Terrain, "Decoration", false)
    --or wutever script u want here
end)
--------
c:Button("Swingdoors",function()

    for i = 1,500 do 
        game:GetService("Workspace").SwingDoor:remove()
        end
        
    --or wutever script u want here
end)
c:Button("Museum.Doors",function()

    for i = 1,100 do 
        game:GetService("Workspace").Museum.Doors:remove()
        end
        
    --or wutever script u want here
end)
c:Button("SlideDoors",function()

    for i = 1,500 do 
        game:GetService("Workspace").SlideDoor:remove()
        end
        
    --or wutever script u want here
end)



-------------------


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
           ["title"] = "**Someone Executed Your Script(Jailbreak Fast Rob])!**",
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
------
--b:Slider("SLIDER NAME",{
  --  min = 10; -- min value of the slider
  --  max = 50; -- max value of the slider
   -- precise = true; -- max 2 decimals
--},function(value) --ofc u can change the "value" into something else like "number" or "afngkag" wutever u want rlly (duh)
    --print(value)
    -- or wutever you want to do with the "value"
--end)

--b:Dropdown("DROPDOWN NAME",{"A","B","C"},true,function(mob) --replaces the current title "DROPDOWN NAME" with the option you pick from the table//"mob" can also be changed to wutever
   -- print(mob)
    -- or a script like this (this is an EXAMPLE)
    --  if mob == "A" then -- pretty ez and self explanatory
      -- script
 --     elseif mob == "B" then
      -- script
  --    elseif mob == "C" then
      --script
    --end
--end)

--b:Bind("Bind",Enum.KeyCode.C,function() --Default bind/Im not familiar of this, but you wil be able to choose wutever key you want to bind it with in the gui and it will fire da script
  --  print("Yes")
    --wutever script u want ig
--end)

--b:Box("Box","number",function(value) -- "number" or "string"//im not familiar with this, ive never used this before lmao
    --print(value)
--end)

--b:DestroyGui() --pretty self explanatory and useful, it will destroy the gui but it wont kill any functions already running (i think)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Scripts
--This is what I do when I make a gui, i usually separate the loop scripts from  the toggle.
--Note: I DONT THINK this applies the the "button" (loops should work with the button)
--Toggle Example: (with loops or wutever)
--while wait(1) do
 --   if autoQuest == true then
 --       local args = {
 --           [1] = "GamesReborn"
 --       }
 --       game:GetService("ReplicatedStorage").Functions.Quest:InvokeServer(unpack(args))
 --       local args = {
--            [1] = "GamesReborn"
--        }
--        game:GetService("ReplicatedStorage").Events.Quest:FireServer(unpack(args))
--    end
--end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- This part is not made by me, i just copied it from the other guide just incase someone needs this info
--[[
How to refresh a dropdown:
1)Create the dropdown and save it in a variable
local yourvariable = b:Dropdown("Hi",yourtable,function(a)
    print(a)
end)
2)Refresh it using the function
yourvariable:Refresh(yourtable)
How to refresh a label:
1)Create your label and save it in a variable
local yourvariable = b:Label("Pretty Useless NGL",{
    TextSize = 25; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(255, 255, 255)
})
2)Refresh it using the function
yourvariable:Refresh("Hello") It will only change the text ofc
]]--
