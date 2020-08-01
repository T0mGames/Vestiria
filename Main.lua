if not game:IsLoaded() then
	while wait() do
		if game:IsLoaded() then break end
	end
end

loadstring(game:HttpGet(("https://raw.githubusercontent.com/T0mGames/Vestiria/master/Wl"), true))()

if getgenv().wl[game:GetService("Players").LocalPlayer.UserId] then
	print("Whitelisted!")
else
	game.Players.LocalPlayer:Kick("Not Whitelisted")
	wait()
	while true do end  
end

if game.PlaceId ~= 155615604 then
	game.Players.LocalPlayer:Kick("Wrong game")
	wait()
	while true do end
end

if not syn then
	game.Players.LocalPlayer:Kick("Synapse only script kiddie")
	wait()
	while true do end
end

---------------------------|
-- Version: ---------------|
_Name = "Vestiria"
_Version = "v[4.0.1]"

---------------------------|
-- Services: --------------|
local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Teams = game:GetService("Teams")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")
---------------------------|
-- Variables: -------------|
local Player = Players.LocalPlayer
local LocalPlayer = Player
local Backpack = Player.Backpack
local Mouse = Player:GetMouse()
local Camera = workspace.CurrentCamera

local MT = getrawmetatable(game)
local oldindex = MT.__index
local oldnamecall = MT.__namecall
local newcclosure = newcclosure  or function(f) return f end
setreadonly(MT, false)

local Character, Humanoid, RootPart
local Backpack, PlayerGui, PlayerScripts
local ClientInputHandler

local TeamEvent = workspace.Remote.TeamEvent
local MeleeEvent = ReplicatedStorage.meleeEvent
local ShootEvent = ReplicatedStorage.ShootEvent
local ArrestEvent = workspace.Remote.arrest
local ItemHandler = workspace.Remote.ItemHandler
local LoadCharEvent = workspace.Remote.loadchar

local itemStorage = workspace.Prison_ITEMS.giver
local crimSpawn = game.workspace["Criminals Spawn"].SpawnLocation

local messageSender = require(game:GetService("ReplicatedStorage").Modules_client:WaitForChild("TooltipModule"));

local hud = Player.PlayerGui.Home.hud
local titleBar = hud.Topbar.titleBar
local Description = hud.Topbar.Pulldownmenu.Frame.Description
local PulldownMenu = hud.Topbar.Pulldownmenu
local StaminaFrame = hud.StaminaFrame

local get_namecall_method = get_namecall_method or getnamecallmethod

---------------------------|
-- Toggles: ---------------|
local WeaponsStuff = {
	["AutoGuns"] = false,
	["AutoSword"] = false,
	["AutoTools"] = false,
	["AutoMod"] = false,
	["GunColor"] = nil,
	["GunTransparency"] = nil,
}

local CharacterStuff = {
	["InfStamina"] = false,
	["NoPunchCooldown"] = false,
	["OneShotPunches"] = false,
	["Noclip"] = false,
	["InfJump"] = false,
	["TazerBypass"] = false,
	["SuperJump"] = false,
	["SuperSpeed"] = false,
	["WalkSpeed"] = 16,
	["JumpPower"] = 50,
	["AutoRespawn"] = false,
	["AutoRefresh"] = false,
	["ChangeHipHeight"] = false,
	["HipHeight"] = 0,
	["Flinging"] = false,
	["FlingPower"] = 500,
}

local PlayerStuff = {
	["PlayerSelected"] = "",
	["ViewingPlayer"] = false,
	["IsLoopBringing"] = false,
	["IsLoopKilling"] = false,
	["IsLoopTazing"] = false,
	["IsLoopTeleporting"] = false,
}

local KillStuff = {
	["IsLoopKillingAll"] = false,
	["TargetTeam"] = "",
	["IsLoopKillingTeam"] = false,
	["ClickKill"] = false,
	["KillAura"] = false,
	["KillAuraTarget"] = false,
	["FlashAura"] = false,
}

local ExploitsStuff = {
	["SwatLag"] = false,
	["IsLoopTazingAll"] = false,
	["ClickTaze"] = false,
	["TazeAura"] = false,
	["AutoArrest"] = false,
	["ArrestAura"] = false,
	["ClickArrest"] = false,
	["NoArrestCooldown"] = false,
	["SilentAimEnabled"] = false,
}

local CarHaxxStuff = {
	["TargetPlayer"] = "",
	["SpawnType"] = "",
	["ToPosPosition"] = nil,
}

local GlobalStuff = {
	["IsSpamAdvertising"] = false,
	["Fullbright"] = false,
}


---------------------------|
-- Core: ------------------|

local function GetPlayersInRange(Radius)
	local PlayersInRange = { }
	
	for idx,plr in pairs(Players:GetPlayers()) do
		if (plr ~= Player) and (plr.Character) then
			local otherRoot = plr.Character:FindFirstChild("HumanoidRootPart")
			if (otherRoot) then
				if ((otherRoot.Position - RootPart.Position).Magnitude <= Radius) then
					table.insert(PlayersInRange, plr)
				end
			end
		end
	end
	
	return PlayersInRange
end

local function Reload()
	Character = Player.Character
	Humanoid = Character:WaitForChild("Humanoid")
	RootPart = Character:WaitForChild("HumanoidRootPart")
	
	Backpack = Player.Backpack
	PlayerGui = Player.PlayerGui
	PlayerScripts = Player.PlayerScripts

	ClientInputHandler = Character:WaitForChild("ClientInputHandler")

	wait(0.4)
	
	local CIHStuff = getsenv(ClientInputHandler).cs
	local StaminaFunc, StaminaVal
	
	for i,v in pairs(getreg()) do
		if (type(v) == "function") and (getfenv(v).script == ClientInputHandler) then
			for idx,upval in pairs(debug.getupvalues(v)) do
				if (type(upval) == "number") and (upval >= 0) and (upval <= 12) then
					StaminaFunc = v
					StaminaVal = idx
				end
			end
		end
	end
	
	coroutine.resume(coroutine.create(function()
		while Humanoid.Health > 0 do
			wait()
			
			if CharacterStuff.NoPunchCooldown then -- No Punch Cooldown
				CIHStuff.isFighting = false
			end
			
			if CharacterStuff.InfStamina then -- Inf Stamina
				if (StaminaFunc) and (StaminaVal) then
					debug.setupvalue(StaminaFunc, StaminaVal, 13)
				end
			end

			if CharacterStuff.SuperSpeed then -- Walk Speed
				Humanoid.WalkSpeed = CharacterStuff.WalkSpeed
			end
			if CharacterStuff.SuperJump then -- Jump Power
				Humanoid.JumpPower = CharacterStuff.JumpPower
			end
			if CharacterStuff.ChangeHipHeight then -- Hip Height
				Humanoid.HipHeight = CharacterStuff.HipHeight
			end
			
			if KillStuff.KillAura then -- Kill Aura
				for idx,plr in pairs(GetPlayersInRange(10)) do
					if KillStuff.KillAuraTarget == "All" then
						for i = 1, 25 do
							MeleeEvent:FireServer(plr)
						end
					else
						if plr.Team.Name == KillStuff.KillAuraTarget then
							for i = 1, 25 do
								MeleeEvent:FireServer(plr)
							end
						end
					end
				end
			end

			if ExploitsStuff.TazeAura then -- Taze Aura
				for idx,plr in pairs(GetPlayersInRange(10)) do
					if plr.Name ~= Player.Name and plr.Team ~= Teams.Guards then
						if Backpack:FindFirstChild("Taser") then
							taze(plr)
						else
							ninthKnight()
						end
					end
				end
			end

			if ExploitsStuff.ArrestAura then -- Arrest Aura
				for idx,plr in pairs(GetPlayersInRange(10)) do
					if (plr.Character) and (plr.Character:FindFirstChild("HumanoidRootPart")) then
						ArrestEvent:InvokeServer(plr.Character.HumanoidRootPart)
					end
				end
			end
		end
	end))
end

do
	pcall(function()
		Reload()
	end)
end

---------------------------|
-- Functions: -------------|
local function SendMessage(text, color) -- Chat message function
	StarterGui:SetCore("ChatMakeSystemMessage", {
		["Text"] = "[Vestiria]: " .. tostring(text),
		["Color"] = (color or Color3.fromRGB(255,255,255)),
		["Font"] = Enum.Font.SourceSansBold,
		["TextSize"] = 18,
	})
end

local function FactMessage(number,text, color) -- Chat message function
	StarterGui:SetCore("ChatMakeSystemMessage", {
		["Text"] = "[Fun Fact "..number.."]: " .. tostring(text),
		["Color"] = (color or Color3.fromRGB(255,255,255)),
		["Font"] = Enum.Font.SourceSansBold,
		["TextSize"] = 18,
	})
end

function findPlayer(name)
	local plr;
	for i,v in pairs(Players:GetChildren()) do
		if v.Name:lower():sub(1,#name) == name:lower() then
			if v.Name:lower():sub(1,#name) == Player.Name:lower() then
				return false
			end
			plr = v.Name
			return plr
		end	
	end
end


function howManyGuards()
	local guards = {}
	for i,v in pairs(Players:GetChildren()) do
		if v.Team == Teams.Guards then
			table.insert(guards, v)
		end
	end
	return tonumber(#guards)
end

function becomeCriminal()
	if (Character) and (Humanoid) and (RootPart) then
        local backup = RootPart.CFrame
        local spawnPoint = workspace["Criminals Spawn"]:FindFirstChildOfClass("SpawnLocation")
            
        Camera.CameraType = Enum.CameraType.Scriptable
            
        repeat
            RootPart.CFrame = spawnPoint.CFrame * CFrame.new(0,2,0)
            if (Player.Team == Teams.Criminals) then break end
            RunService.RenderStepped:Wait()
        until (Player.Team == Teams.Criminals)
            
        Camera.CameraType = Enum.CameraType.Custom
            
        RootPart.Velocity = Vector3.new(0,0,0)
		RootPart.CFrame = backup
    end
end

local function getGuns()
	--Slot 1--
	
	--Remington870--------------------------------------------
	game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP) --Remington 870
	----------------------------------------------------------
	
	--Slot 2--
	
	--Slot 3--
	
	--AK-47---------------------------------------------------
	if (game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 96651)) then
		--If you don't have gamepass for M4A1 then you will not get this AK-47
		game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
	end
	----------------------------------------------------------
	--M4A1----------------------------------------------------
	if (game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 96651)) then
		game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M4A1"].ITEMPICKUP)
	else --If you don't have gamepass for M4A1 then you will get the converted AK-47
		game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP) 
	end
	--Slot 4--
	
	--M9---------------------------------------------------
	game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
	-------------------------------------------------------
end

function giveTools()
	local itemStorage2 = game.workspace.Prison_ITEMS.single
	TeamEvent:FireServer(tostring(Teams.Inmates.TeamColor))
	wait()

	for idx,obj in pairs(itemStorage2:GetChildren()) do
    	if (obj:IsA("Model")) and (obj:FindFirstChild("ITEMPICKUP")) and (obj.Name ~= "M9") and (obj.Name ~= "Key card") then
        	pcall(ItemHandler.InvokeServer, ItemHandler, obj.ITEMPICKUP)
    	end
	end
end

local function ModifyGun(Gun) -- Gun modification function
	if (Gun:IsA("Tool")) then
		local States = Gun:FindFirstChildOfClass("ModuleScript")
		if States and States.Name ~= "Modded" then
			local h = require(States)
			h.CurrentAmmo = math.huge
			h.MaxAmmo = math.huge
			h.StoredAmmo = math.huge
			h.Damage = 9999
			h.AutoFire = true
			h.Range = 999
			h.Spread = 20
			h.FireRate = 0.01
			h.Bullets = 40
			h.ReloadTime = 0.01
			States.Name = "Modded"
		end
	end
end

pcall(function() -- Run Service Loop
	RunService.Stepped:Connect(function()
		if (CharacterStuff.Noclip == true) or (CharacterStuff.Flinging == true) then
			if (Character) and (Humanoid) and (RootPart) then
				if (Humanoid.RigType == Enum.HumanoidRigType.R6) then
                    Character.Head.CanCollide = false
                    Character.Torso.CanCollide = false
                    Character["Left Leg"].CanCollide = false
                    Character["Right Leg"].CanCollide = false
                else
                    Character.Humanoid:ChangeState(11)
                end
			end
		end
		if getgenv().bringing == true then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			local player = game.Players[PlayerStuff.PlayerSelected]
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
			player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW * CFrame.new(0,1,0)
		end
		if getgenv().MakingCrim == true then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			local player = game.Players[PlayerStuff.PlayerSelected]
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = crimSpawn.CFrame
			player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
		end
	end)
end)

do -- Super Punch
	mainRemotes = game.ReplicatedStorage
	meleeRemote = mainRemotes['meleeEvent']
	mouse = game.Players.LocalPlayer:GetMouse()
	punching = false
	cooldown = false

	function punch()
		cooldown = true
		local part = Instance.new("Part", game.Players.LocalPlayer.Character)
		part.Transparency = 1
		part.Size = Vector3.new(5, 2, 3)
		part.CanCollide = false
		local w1 = Instance.new("Weld", part)
		w1.Part0 = game.Players.LocalPlayer.Character.Torso
		w1.Part1 = part
		w1.C1 = CFrame.new(0,0,2)
		part.Touched:connect(function(hit)
			if game.Players:FindFirstChild(hit.Parent.Name) then
				local plr = game.Players:FindFirstChild(hit.Parent.Name)
				if plr.Name ~= game.Players.LocalPlayer.Name then
					part:Destroy()

					for i = 1,100 do
						meleeRemote:FireServer(plr)
					end
				end
			end
		end)

		wait(1)
		cooldown = false
		part:Destroy()
	end


	mouse.KeyDown:connect(function(key)
		if CharacterStuff.OneShotPunches == false then return end
		if cooldown == false then
			if key:lower() == "f" then
				if Player.Team == Teams.Guards then
					TeamEvent:FireServer(tostring(Teams.Neutral.TeamColor))
					wait()
					punch()
					wait()
					TeamEvent:FireServer(tostring(Teams.Guards.TeamColor))
					return
				end
				punch()
			end
		end
	end)
end

function Refresh()
	local pos = RootPart.CFrame
	if Player.Team == Teams.Neutral then
		TeamEvent:FireServer(tostring(Teams.Inmates.TeamColor))
		wait()
		LoadCharEvent:InvokeServer()
		wait()
		RootPart.CFrame = pos
		TeamEvent:FireServer(tostring(Teams.Neutral.TeamColor))
		return
	elseif Player.Team == Teams.Criminals then
		TeamEvent:FireServer(tostring(Teams.Inmates.TeamColor))
		wait()
		LoadCharEvent:InvokeServer()
		wait()
		RootPart.CFrame = pos
		becomeCriminal()
		return
	end
	LoadCharEvent:InvokeServer()
	wait()
	RootPart.CFrame = pos
end


function bring(plr)
	getgenv().bringing = true

	NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	local player = findPlayer(plr)
	player = game.Players[player]
	game.Players.LocalPlayer.Character.Humanoid.Sit = false

	for i,v in pairs(Workspace.Prison_ITEMS.giver:GetChildren()) do
		if v.Name == "M9" then
		   lol = Workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
		end
	end
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
	game.Players.LocalPlayer.Character.Humanoid.Name = 1
	local l = game.Players.LocalPlayer.Character["1"]:Clone()
	if game.Players.LocalPlayer.Character["1"] then
		l.Parent = game.Players.LocalPlayer.Character
		l.Name = "Humanoid"
		wait()
		game.Players.LocalPlayer.Character["1"]:Destroy()
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.Animate.Disabled = true
	end
	wait()
	game.Players.LocalPlayer.Character.Animate.Disabled = false
	game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
	for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
		if v.Name == "M9" then
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
		end
	end
	player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
	wait(0.3)
	local A_1 = "\66\114\111\121\111\117\98\97\100\100"
	local Event = game:GetService("Workspace").Remote.loadchar
	Event:InvokeServer(A_1)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
	wait()
	getgenv().bringing = false
end

function KillSpecific(plr)
	if (Character) and (Humanoid) and (RootPart) then
		local backup = RootPart.CFrame
		Camera.CameraType = Enum.CameraType.Scriptable
		
		for idx,playr in pairs(Players:GetChildren()) do
			if (playr ~= Player) and (playr.Character) then
				local otherRoot = playr.Character:FindFirstChild("HumanoidRootPart")
				if otherRoot then
					if (playr.Name == plr) then
						RootPart.Velocity = Vector3.new(0,0,0)
						RootPart.CFrame = otherRoot.CFrame * CFrame.new(0, 6, 0)
					    wait(0.15)
						for i = 1, 25 do
							MeleeEvent:FireServer(playr)
						end     
					end
				end
			end
		end
		Camera.CameraType = Enum.CameraType.Custom
		RootPart.Velocity = Vector3.new(0,0,0)
		RootPart.CFrame = backup
	end
end

function ArrestSpecific(playr)
	if (Character) and (Humanoid) and (RootPart) then
        local backup = RootPart.CFrame
        Camera.CameraType = Enum.CameraType.Scriptable
        for idx,plr in pairs(Players:GetPlayers()) do
            if (plr ~= Player) and (plr.Character) and (plr.Team == Teams.Criminals) and (plr.Name == playr) then
                local otherRoot = plr.Character:FindFirstChild("HumanoidRootPart")
                if (otherRoot) then
                    RootPart.Velocity = Vector3.new(0, 0, 0)
                    RootPart.CFrame = otherRoot.CFrame * CFrame.new(0, 6, 0)
                    wait(0.15)
                    ArrestEvent:InvokeServer(otherRoot)
                    wait()
                end
            end
        end
        Camera.CameraType = Enum.CameraType.Custom
        RootPart.Velocity = Vector3.new(0, 0, 0)
        RootPart.CFrame = backup
	end
end

function crash(target)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(691.162537, 100.190758, 2344.01392)
wait(0.5)
local client = game:GetService("Players").LocalPlayer

for _, child in next, client.Backpack:GetChildren() do
if child:IsA("Tool") then
client.Character.Humanoid:UnequipTools()
end
end

local Crim = Instance.new("Part")
   Crim.Name = "plr"
     Crim.Parent = workspace
       Crim.Anchored = true
         Crim.Archivable = true
           Crim.CFrame = CFrame.new(9e99, 9e99, 9e99)
              Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
	            wait(0.1)
	          Crim.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	       Crim.Transparency = 1
	    Crim.Anchored = true
	 Crim.CanCollide = false
  lol = true				
Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
  Bruh.CanCollide = false
    Bruh.Size = Vector3.new(51.05, 24.12, 54.76)
	  Bruh.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		 Bruh.Transparency = 1
		   wait(0.1)
		     lol = false
		       wait(0.04)
		         if lol == false then
		           Bruh.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		           Bruh.Size = Vector3.new(6, 0.2, 6)
		           Bruh.Transparency = 0
		           lol = false
		    end
        game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP) 
    wait(0.1)
wait(0.5)
	for i=1,10000 do
      local tbl_36BA2890 = 
       {
         ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.812744, 31.2091656, 121.524826)), 
           ["Distance"] = 61.344123840332, 
             ["Cframe"] = CFrame.new(809.089844, 101.766418, 2219.49268, 0.363455683, 0.0792314336, -0.928236127, -1.86264515e-09, 0.996376872, 0.0850477219, 0.931611478, -0.0309110768, 0.362138808), 
               ["Hit"] = target.Character.Head
                 }
               local tbl_36B5BF78 = 
            {
          ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.036713, 35.5271149, 122.755898)), 
        ["Distance"] = 61.299308776855, 
      ["Cframe"] = CFrame.new(809.180542, 102.100838, 2219.57886, 0.366918802, 0.0893238857, -0.92595464, 0, 0.995379448, 0.0960210636, 0.930253029, -0.035231933, 0.365223378), 
     ["Hit"] = target.Character.Head
    }
local tbl_36B585E8 = 
  {
    ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.921326, 20.3493805, 123.473427)), 
      ["Distance"] = 61.141574859619, 
        ["Cframe"] = CFrame.new(809.180542, 100.912926, 2219.61255, 0.36787042, 0.0533849634, -0.928343356, 0, 0.99835068, 0.0574107729, 0.929877102, -0.021119725, 0.367263645), 
          ["Hit"] = target.Character.Head
           }
             local tbl_36B5CC38 = 
              {
                ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-371.464417, 33.5804787, 144.521744)), 
                  ["Distance"] = 63.866916656494, 
                    ["Cframe"] = CFrame.new(808.680542, 102.047562, 2221.70142, 0.418726623, 0.0821772888, -0.90438652, 0, 0.995897233, 0.0904924273, 0.908112347, -0.0378915891, 0.417008668), 
                      ["Hit"] = target.Character.Head
                        }
                          local tbl_36B5BB28 = 
                            {
                          ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-376.177948, 24.8940163, 133.680374)), 
                        ["Distance"] = 62.931880950928, 
                      ["Cframe"] = CFrame.new(808.680542, 101.319054, 2220.68823, 0.391926825, 0.0631896704, -0.917823792, 0, 0.997638524, 0.0686846897, 0.91999644, -0.0269193724, 0.391001284), 
                    ["Hit"] = target.Character.Head
                  }
                local tbl_36B58A98 = 
              {
            tbl_36B5BB28, 
          tbl_36B5CC38, 
        tbl_36B585E8, 
      tbl_36B5BF78, 
    tbl_36BA2890
}
  local tbl_main = 
    {
      tbl_36B58A98, 
        game:GetService("Players").LocalPlayer.Backpack["Remington 870"]
          }
            game:GetService("ReplicatedStorage").ShootEvent:FireServer(unpack(tbl_main))
              local tbl_36BA2890 = 
                {
                  ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.812744, 31.2091656, 121.524826)), 
                    ["Distance"] = 61.344123840332, 
                      ["Cframe"] = CFrame.new(809.089844, 101.766418, 2219.49268, 0.363455683, 0.0792314336, -0.928236127, -1.86264515e-09, 0.996376872, 0.0850477219, 0.931611478, -0.0309110768, 0.362138808), 
                        ["Hit"] = target.Character.Head
                          }
                            local tbl_36B5BF78 = 
                              {
                            ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.036713, 35.5271149, 122.755898)), 
                          ["Distance"] = 61.299308776855, 
                        ["Cframe"] = CFrame.new(809.180542, 102.100838, 2219.57886, 0.366918802, 0.0893238857, -0.92595464, 0, 0.995379448, 0.0960210636, 0.930253029, -0.035231933, 0.365223378), 
                      ["Hit"] = target.Character.Head
                    }
                  local tbl_36B585E8 = 
                {
              ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.921326, 20.3493805, 123.473427)), 
            ["Distance"] = 61.141574859619, 
          ["Cframe"] = CFrame.new(809.180542, 100.912926, 2219.61255, 0.36787042, 0.0533849634, -0.928343356, 0, 0.99835068, 0.0574107729, 0.929877102, -0.021119725, 0.367263645), 
        ["Hit"] = target.Character.Head
      }
    local tbl_36B5CC38 = 
  {
["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-371.464417, 33.5804787, 144.521744)), 
  ["Distance"] = 63.866916656494, 
    ["Cframe"] = CFrame.new(808.680542, 102.047562, 2221.70142, 0.418726623, 0.0821772888, -0.90438652, 0, 0.995897233, 0.0904924273, 0.908112347, -0.0378915891, 0.417008668), 
      ["Hit"] = target.Character.Head
        }
          local tbl_36B5BB28 = 
            {
              ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-376.177948, 24.8940163, 133.680374)), 
                ["Distance"] = 62.931880950928, 
                  ["Cframe"] = CFrame.new(808.680542, 101.319054, 2220.68823, 0.391926825, 0.0631896704, -0.917823792, 0, 0.997638524, 0.0686846897, 0.91999644, -0.0269193724, 0.391001284), 
                    ["Hit"] = target.Character.Head
                      }
                        local tbl_36B58A98 = 
                      {
                    tbl_36B5BB28, 
                  tbl_36B5CC38, 
                tbl_36B585E8, 
              tbl_36B5BF78, 
            tbl_36BA2890
          }
        local tbl_main = 
      {
    tbl_36B58A98, 
  game:GetService("Players").LocalPlayer.Backpack["Remington 870"]
}
  game:GetService("ReplicatedStorage").ShootEvent:FireServer(unpack(tbl_main))
    end
        TeamEvent:FireServer("Bright orange")
		
end

function TazeCrash(target)
    ninthKnight()
    for i=1,25000 do
        local tbl_36BA2890 = 
         {
           ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.812744, 31.2091656, 121.524826)), 
             ["Distance"] = 61.344123840332, 
               ["Cframe"] = CFrame.new(809.089844, 101.766418, 2219.49268, 0.363455683, 0.0792314336, -0.928236127, -1.86264515e-09, 0.996376872, 0.0850477219, 0.931611478, -0.0309110768, 0.362138808), 
                 ["Hit"] = target.Character.Head
                   }
                 local tbl_36B5BF78 = 
              {
            ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.036713, 35.5271149, 122.755898)), 
          ["Distance"] = 61.299308776855, 
        ["Cframe"] = CFrame.new(809.180542, 102.100838, 2219.57886, 0.366918802, 0.0893238857, -0.92595464, 0, 0.995379448, 0.0960210636, 0.930253029, -0.035231933, 0.365223378), 
       ["Hit"] = target.Character.Head
      }
    local tbl_36B585E8 = 
    {
      ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.921326, 20.3493805, 123.473427)), 
        ["Distance"] = 61.141574859619, 
          ["Cframe"] = CFrame.new(809.180542, 100.912926, 2219.61255, 0.36787042, 0.0533849634, -0.928343356, 0, 0.99835068, 0.0574107729, 0.929877102, -0.021119725, 0.367263645), 
            ["Hit"] = target.Character.Head
             }
               local tbl_36B5CC38 = 
                {
                  ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-371.464417, 33.5804787, 144.521744)), 
                    ["Distance"] = 63.866916656494, 
                      ["Cframe"] = CFrame.new(808.680542, 102.047562, 2221.70142, 0.418726623, 0.0821772888, -0.90438652, 0, 0.995897233, 0.0904924273, 0.908112347, -0.0378915891, 0.417008668), 
                        ["Hit"] = target.Character.Head
                          }
                            local tbl_36B5BB28 = 
                              {
                            ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-376.177948, 24.8940163, 133.680374)), 
                          ["Distance"] = 62.931880950928, 
                        ["Cframe"] = CFrame.new(808.680542, 101.319054, 2220.68823, 0.391926825, 0.0631896704, -0.917823792, 0, 0.997638524, 0.0686846897, 0.91999644, -0.0269193724, 0.391001284), 
                      ["Hit"] = target.Character.Head
                    }
                  local tbl_36B58A98 = 
                {
              tbl_36B5BB28, 
            tbl_36B5CC38, 
          tbl_36B585E8, 
        tbl_36B5BF78, 
      tbl_36BA2890
    }
    local tbl_main = 
      {
        tbl_36B58A98, 
          game:GetService("Players").LocalPlayer.Backpack["Taser"]
            }
              game:GetService("ReplicatedStorage").ShootEvent:FireServer(unpack(tbl_main))
                local tbl_36BA2890 = 
                  {
                    ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.812744, 31.2091656, 121.524826)), 
                      ["Distance"] = 61.344123840332, 
                        ["Cframe"] = CFrame.new(809.089844, 101.766418, 2219.49268, 0.363455683, 0.0792314336, -0.928236127, -1.86264515e-09, 0.996376872, 0.0850477219, 0.931611478, -0.0309110768, 0.362138808), 
                          ["Hit"] = target.Character.Head
                            }
                              local tbl_36B5BF78 = 
                                {
                              ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.036713, 35.5271149, 122.755898)), 
                            ["Distance"] = 61.299308776855, 
                          ["Cframe"] = CFrame.new(809.180542, 102.100838, 2219.57886, 0.366918802, 0.0893238857, -0.92595464, 0, 0.995379448, 0.0960210636, 0.930253029, -0.035231933, 0.365223378), 
                        ["Hit"] = target.Character.Head
                      }
                    local tbl_36B585E8 = 
                  {
                ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.921326, 20.3493805, 123.473427)), 
              ["Distance"] = 61.141574859619, 
            ["Cframe"] = CFrame.new(809.180542, 100.912926, 2219.61255, 0.36787042, 0.0533849634, -0.928343356, 0, 0.99835068, 0.0574107729, 0.929877102, -0.021119725, 0.367263645), 
          ["Hit"] = target.Character.Head
        }
      local tbl_36B5CC38 = 
    {
    ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-371.464417, 33.5804787, 144.521744)), 
    ["Distance"] = 63.866916656494, 
      ["Cframe"] = CFrame.new(808.680542, 102.047562, 2221.70142, 0.418726623, 0.0821772888, -0.90438652, 0, 0.995897233, 0.0904924273, 0.908112347, -0.0378915891, 0.417008668), 
        ["Hit"] = target.Character.Head
          }
            local tbl_36B5BB28 = 
              {
                ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-376.177948, 24.8940163, 133.680374)), 
                  ["Distance"] = 62.931880950928, 
                    ["Cframe"] = CFrame.new(808.680542, 101.319054, 2220.68823, 0.391926825, 0.0631896704, -0.917823792, 0, 0.997638524, 0.0686846897, 0.91999644, -0.0269193724, 0.391001284), 
                      ["Hit"] = target.Character.Head
                        }
                          local tbl_36B58A98 = 
                        {
                      tbl_36B5BB28, 
                    tbl_36B5CC38, 
                  tbl_36B585E8, 
                tbl_36B5BF78, 
              tbl_36BA2890
            }
          local tbl_main = 
        {
      tbl_36B58A98, 
    game:GetService("Players").LocalPlayer.Backpack["Taser"]
    }
    game:GetService("ReplicatedStorage").ShootEvent:FireServer(unpack(tbl_main))
      end
          TeamEvent:FireServer("Bright orange")
end


function taze(a)
	A_1 = {

	[1] = {
		
	  

	["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-391.152252, 8.65560055, -83.2166901)),
	["Distance"] = 3.2524313926697,
	["Cframe"] = CFrame.new(840.310791, 101.334137, 2267.87988, 0.0636406094, 0.151434347, -0.986416459, 0, 0.988420188, 0.151741937, 0.997972965, -0.00965694897, 0.0629036576),
	["Hit"] = a.Character.Head
	},
	   [2] =
	{
	["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-392.481476, -8.44939327, -76.7261353)),
	["Distance"] = 3.2699294090271,
	["Cframe"] = CFrame.new(840.290466, 101.184189, 2267.93506, 0.0964837447, 0.0589403138, -0.993587971, 4.65661287e-10, 0.998245299, 0.0592165813, 0.995334625, -0.00571343815, 0.0963144377),
	["Hit"] = a.Character.Head
	},
	[3] =
	{
	["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-389.21701, -2.50536323, -92.2163162)),
	["Distance"] = 3.1665518283844,
	["Cframe"] = CFrame.new(840.338867, 101.236496, 2267.80371, 0.0166504811, 0.0941716284, -0.995416701, 1.16415322e-10, 0.995554805, 0.0941846818, 0.999861419, -0.00156822044, 0.0165764652),
	["Hit"] = a.Character.Head
	},
	[4] =
	{
	["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-393.353973, 3.13988972, -72.5452042)),
	["Distance"] = 3.3218522071838,
	["Cframe"] = CFrame.new(840.277222, 101.285957, 2267.9707, 0.117109694, 0.118740402, -0.985994935, -1.86264515e-09, 0.992826641, 0.119563118, 0.993119001, -0.0140019981, 0.116269611),
	["Hit"] = a.Character.Head
	},
	[5] =
	{
	["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-390.73172, 3.2097764, -85.5477524)),
	["Distance"] = 3.222757101059,
	["Cframe"] = CFrame.new(840.317993, 101.286423, 2267.86035, 0.0517584644, 0.123365127, -0.991010666, 0, 0.992340803, 0.123530701, 0.99865967, -0.00639375951, 0.0513620302),
	["Hit"] = a.Character.Head
	}
	}
	local A_2 = game.Players.LocalPlayer.Backpack["Taser"]
	local Event = game:GetService("ReplicatedStorage").ShootEvent
	Event:FireServer(A_1, A_2)
	Event:FireServer(A_1, A_2)
end

function MakeCriminal(plr)
	
    wait()
	getgenv().MakingCrim = true
	

	local player = plr
	wait()
	player = game.Players[player]
	game.Players.LocalPlayer.Character.Humanoid.Sit = false

	for i,v in pairs(Workspace.Prison_ITEMS.giver:GetChildren()) do
		if v.Name == "M9" then
		   lol = Workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
		end
	end
	game.Players.LocalPlayer.Character.Humanoid.Name = 1
	local l = game.Players.LocalPlayer.Character["1"]:Clone()
	if game.Players.LocalPlayer.Character["1"] then
		l.Parent = game.Players.LocalPlayer.Character
		l.Name = "Humanoid"
		wait()
		game.Players.LocalPlayer.Character["1"]:Destroy()
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.Animate.Disabled = true
	end
	wait()
	game.Players.LocalPlayer.Character.Animate.Disabled = false
	game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
	for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
		if v.Name == "M9" then
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
		end
	end
	player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
	wait(0.3)
	local A_1 = "\66\114\111\121\111\117\98\97\100\100"
	local Event = game:GetService("Workspace").Remote.loadchar
	Event:InvokeServer(A_1)
	wait()
	getgenv().MakingCrim = false
end

function KillAll()
	if (Character) and (Humanoid) and (RootPart) then
		local backup = RootPart.CFrame
		Camera.CameraType = Enum.CameraType.Scriptable
			
		for idx,plr in pairs(Players:GetPlayers()) do
			if (plr ~= Player) and (plr.Character) then
				local otherRoot = plr.Character:FindFirstChild("HumanoidRootPart")
				if (otherRoot) then
					RootPart.Velocity = Vector3.new(0,0,0)
					RootPart.CFrame = otherRoot.CFrame * CFrame.new(0, 6, 0)
					wait(0.15)
					for i = 1, 25 do
						MeleeEvent:FireServer(plr)
					end
					Humanoid:ChangeState("Jumping")
				end
			end
		end
		
		Camera.CameraType = Enum.CameraType.Custom
		RootPart.Velocity = Vector3.new(0,0,0)
		RootPart.CFrame = backup
	end
end

function KillTeam()
	if (Character) and (Humanoid) and (RootPart) then
		local backup = RootPart.CFrame
		Camera.CameraType = Enum.CameraType.Scriptable
			
		for idx,plr in pairs(Players:GetPlayers()) do
			if (plr ~= Player) and (plr.Character) and (plr.Team.Name == KillStuff.TargetTeam) then
				local otherRoot = plr.Character:FindFirstChild("HumanoidRootPart")
				if (otherRoot) then
					RootPart.Velocity = Vector3.new(0,0,0)
					RootPart.CFrame = otherRoot.CFrame * CFrame.new(0, 6, 0)
					wait(0.15)
					for i = 1, 25 do
						MeleeEvent:FireServer(plr)
					end
					Humanoid:ChangeState("Jumping")
				end
			end
		end
		
		Camera.CameraType = Enum.CameraType.Custom
		RootPart.Velocity = Vector3.new(0,0,0)
		RootPart.CFrame = backup
	end
end

function round(num) 
    if num >= 0 then return math.floor(num+.5) 
    else return math.ceil(num-.5) end
end

local function changeColor(BC, TC)
	for i,v in pairs(Backpack:GetChildren()) do
		if v.Name == "M9" then
			if v:IsA("Tool") then
				v.Part.BrickColor = BrickColor.new(BC)
				v.Part.Transparency = TC
			end
		elseif v.Name == "AK-47" or v.Name == "Remington 870" or v.Name == "M4A1" then
			if v:IsA("Tool") then
				local h = v:FindFirstChildOfClass("Model")
				if h then
					for _,Part in pairs(h:GetChildren()) do
						if Part:IsA("Part") then
							Part.BrickColor = BrickColor.new(BC)
							Part.Transparency = TC
						end
					end
				end
			end
		end
	end
end

function arrestAll()
	if (Character) and (Humanoid) and (RootPart) then
		local backup = RootPart.CFrame
		Camera.CameraType = Enum.CameraType.Scriptable

		for idx,plr in pairs(Players:GetPlayers()) do
			if (plr ~= Player) and (plr.Character) and (plr.Team == Teams.Criminals) then
				local otherRoot = plr.Character:FindFirstChild("HumanoidRootPart")
				if (otherRoot) then
					RootPart.Velocity = Vector3.new(0, 0, 0)
					RootPart.CFrame = otherRoot.CFrame * CFrame.new(0, 6, 0)
					wait(0.15)
					ArrestEvent:InvokeServer(otherRoot)
					wait()
					Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end
		end

		Camera.CameraType = Enum.CameraType.Custom
		RootPart.Velocity = Vector3.new(0, 0, 0)
		RootPart.CFrame = backup
	end
end

do -- Vestiria Folder
	local VestiriaFolder = Instance.new("Folder", game.Lighting)
	VestiriaFolder.Name = "VestiriaFolder"
end

function addFolder(name, path)
	for i,v in pairs(path:GetChildren()) do
		if (v.Name == name) then
			v.Parent = game.Lighting.VestiriaFolder
		end
	end
end

function removeFolder(name, path)
	for i,v in pairs(game.Lighting.VestiriaFolder:GetChildren()) do
		if (v.Name == name) then
			v.Parent = path
		end
	end
end

do -- Fullbright
	
	_G.NormalLightingSettings = {
		Brightness = game:GetService("Lighting").Brightness,
		ClockTime = game:GetService("Lighting").ClockTime,
		FogEnd = game:GetService("Lighting").FogEnd,
		GlobalShadows = game:GetService("Lighting").GlobalShadows,
		Ambient = game:GetService("Lighting").Ambient
	}

	game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
		if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
			_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Brightness = 1
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
		if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
			_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").ClockTime = 12
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
		if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
			_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").FogEnd = 786543
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
		if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
			_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").GlobalShadows = false
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
		if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
			_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
		end
	end)

	game:GetService("Lighting").Brightness = 1
	game:GetService("Lighting").ClockTime = 12
	game:GetService("Lighting").FogEnd = 786543
	game:GetService("Lighting").GlobalShadows = false
	game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

	local LatestValue = true
	spawn(function()
		repeat
			wait()
		until _G.FullBrightEnabled
		while wait() do
			if _G.FullBrightEnabled ~= LatestValue then
				if not _G.FullBrightEnabled then
					game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
					game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
					game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
					game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
					game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
				else
					game:GetService("Lighting").Brightness = 1
					game:GetService("Lighting").ClockTime = 12
					game:GetService("Lighting").FogEnd = 786543
					game:GetService("Lighting").GlobalShadows = false
					game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
				end
				LatestValue = not LatestValue
			end
		end
	end)
end

function ninthKnight()
	local pos = RootPart.CFrame
	LoadCharEvent:InvokeServer("", "Bright blue")
	wait()
	RootPart.CFrame = pos
end

function isHoldingItem(item)
	local TargetItem = Player.Character:FindFirstChildOfClass("Tool")
	if TargetItem ~= nil then
		if TargetItem.Name == item then
			return true
		else
			return false
		end
	else
		return false
	end
	return false
end

function typeWrite(text, object)
	if text ~= nil  then
		for i = 1, #text do
			object.Text = string.sub(text, 1, i)
			wait(0.05)
		end
	end
end

local function GetClosest()
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
    if not (Character or HumanoidRootPart) then return end

    local TargetDistance = math.huge
    local Target = nil

    for i,v in ipairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Team ~= LocalPlayer.Team then
            local TargetHRP = v.Character.HumanoidRootPart
            local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
            if mag < TargetDistance then
                TargetDistance = mag
                Target = v
            end
        end
    end

	if Target ~= nil then 
		return Target.Name
	else
		return nil
	end
end

function crashAll()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(691.162537, 100.190758, 2344.01392)
wait(0.5)
local client = game:GetService("Players").LocalPlayer

for _, child in next, client.Backpack:GetChildren() do
if child:IsA("Tool") then
client.Character.Humanoid:UnequipTools()
end
end

local Crim = Instance.new("Part")
   Crim.Name = "plr"
     Crim.Parent = workspace
       Crim.Anchored = true
         Crim.Archivable = true
           Crim.CFrame = CFrame.new(9e99, 9e99, 9e99)
              Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
	            wait(0.1)
	          Crim.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	       Crim.Transparency = 1
	    Crim.Anchored = true
	 Crim.CanCollide = false
  lol = true				
Bruh = game.Workspace["Criminals Spawn"].SpawnLocation
  Bruh.CanCollide = false
    Bruh.Size = Vector3.new(51.05, 24.12, 54.76)
	  Bruh.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		 Bruh.Transparency = 1
		   wait(0.1)
		     lol = false
		       wait(0.04)
		         if lol == false then
		           Bruh.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		           Bruh.Size = Vector3.new(6, 0.2, 6)
		           Bruh.Transparency = 0
		           lol = false
		    end
        game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP) 
    wait(0.1)
wait(0.5)
SendMessage("Do not equip remington until the script has ended!", Color3.fromRGB(255,0,0))
for i,v in pairs(game:GetService("Players"):GetChildren()) do
	for i=1,15000 do
      local tbl_36BA2890 = 
       {
         ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.812744, 31.2091656, 121.524826)), 
           ["Distance"] = 61.344123840332, 
             ["Cframe"] = CFrame.new(809.089844, 101.766418, 2219.49268, 0.363455683, 0.0792314336, -0.928236127, -1.86264515e-09, 0.996376872, 0.0850477219, 0.931611478, -0.0309110768, 0.362138808), 
               ["Hit"] = v.Character.Head
                 }
               local tbl_36B5BF78 = 
            {
          ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.036713, 35.5271149, 122.755898)), 
        ["Distance"] = 61.299308776855, 
      ["Cframe"] = CFrame.new(809.180542, 102.100838, 2219.57886, 0.366918802, 0.0893238857, -0.92595464, 0, 0.995379448, 0.0960210636, 0.930253029, -0.035231933, 0.365223378), 
     ["Hit"] = v.Character.Head
    }
local tbl_36B585E8 = 
  {
    ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.921326, 20.3493805, 123.473427)), 
      ["Distance"] = 61.141574859619, 
        ["Cframe"] = CFrame.new(809.180542, 100.912926, 2219.61255, 0.36787042, 0.0533849634, -0.928343356, 0, 0.99835068, 0.0574107729, 0.929877102, -0.021119725, 0.367263645), 
          ["Hit"] = v.Character.Head
           }
             local tbl_36B5CC38 = 
              {
                ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-371.464417, 33.5804787, 144.521744)), 
                  ["Distance"] = 63.866916656494, 
                    ["Cframe"] = CFrame.new(808.680542, 102.047562, 2221.70142, 0.418726623, 0.0821772888, -0.90438652, 0, 0.995897233, 0.0904924273, 0.908112347, -0.0378915891, 0.417008668), 
                      ["Hit"] = v.Character.Head
                        }
                          local tbl_36B5BB28 = 
                            {
                          ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-376.177948, 24.8940163, 133.680374)), 
                        ["Distance"] = 62.931880950928, 
                      ["Cframe"] = CFrame.new(808.680542, 101.319054, 2220.68823, 0.391926825, 0.0631896704, -0.917823792, 0, 0.997638524, 0.0686846897, 0.91999644, -0.0269193724, 0.391001284), 
                    ["Hit"] = v.Character.Head
                  }
                local tbl_36B58A98 = 
              {
            tbl_36B5BB28, 
          tbl_36B5CC38, 
        tbl_36B585E8, 
      tbl_36B5BF78, 
    tbl_36BA2890
}
  local tbl_main = 
    {
      tbl_36B58A98, 
        game:GetService("Players").LocalPlayer.Backpack["Remington 870"]
          }
            game:GetService("ReplicatedStorage").ShootEvent:FireServer(unpack(tbl_main))
              local tbl_36BA2890 = 
                {
                  ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.812744, 31.2091656, 121.524826)), 
                    ["Distance"] = 61.344123840332, 
                      ["Cframe"] = CFrame.new(809.089844, 101.766418, 2219.49268, 0.363455683, 0.0792314336, -0.928236127, -1.86264515e-09, 0.996376872, 0.0850477219, 0.931611478, -0.0309110768, 0.362138808), 
                        ["Hit"] = v.Character.Head
                          }
                            local tbl_36B5BF78 = 
                              {
                            ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.036713, 35.5271149, 122.755898)), 
                          ["Distance"] = 61.299308776855, 
                        ["Cframe"] = CFrame.new(809.180542, 102.100838, 2219.57886, 0.366918802, 0.0893238857, -0.92595464, 0, 0.995379448, 0.0960210636, 0.930253029, -0.035231933, 0.365223378), 
                      ["Hit"] = v.Character.Head
                    }
                  local tbl_36B585E8 = 
                {
              ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-379.921326, 20.3493805, 123.473427)), 
            ["Distance"] = 61.141574859619, 
          ["Cframe"] = CFrame.new(809.180542, 100.912926, 2219.61255, 0.36787042, 0.0533849634, -0.928343356, 0, 0.99835068, 0.0574107729, 0.929877102, -0.021119725, 0.367263645), 
        ["Hit"] = v.Character.Head
      }
    local tbl_36B5CC38 = 
  {
["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-371.464417, 33.5804787, 144.521744)), 
  ["Distance"] = 63.866916656494, 
    ["Cframe"] = CFrame.new(808.680542, 102.047562, 2221.70142, 0.418726623, 0.0821772888, -0.90438652, 0, 0.995897233, 0.0904924273, 0.908112347, -0.0378915891, 0.417008668), 
      ["Hit"] = v.Character.Head
        }
          local tbl_36B5BB28 = 
            {
              ["RayObject"] = Ray.new(Vector3.new(839.947937, 99.4999466, 2211.61719), Vector3.new(-376.177948, 24.8940163, 133.680374)), 
                ["Distance"] = 62.931880950928, 
                  ["Cframe"] = CFrame.new(808.680542, 101.319054, 2220.68823, 0.391926825, 0.0631896704, -0.917823792, 0, 0.997638524, 0.0686846897, 0.91999644, -0.0269193724, 0.391001284), 
                    ["Hit"] = v.Character.Head
                      }
                        local tbl_36B58A98 = 
                      {
                    tbl_36B5BB28, 
                  tbl_36B5CC38, 
                tbl_36B585E8, 
              tbl_36B5BF78, 
            tbl_36BA2890
          }
        local tbl_main = 
      {
    tbl_36B58A98, 
  game:GetService("Players").LocalPlayer.Backpack["Remington 870"]
}
  game:GetService("ReplicatedStorage").ShootEvent:FireServer(unpack(tbl_main))
    end
      end
        TeamEvent:FireServer("Bright orange")
	  	SendMessage("Crash script finishes when u become an inmate!", Color3.fromRGB(0,255,0))
end


---------------------------|
-- Gui: -------------------|

local library = loadstring(game:HttpGet("https://uwuware.cool/scripts/getfile.php?ID=CO2RjbceKOrzbbMCfU3qkHDqBuWysNph", true))()
wait(1)

local window = library:CreateWindow(_Name .. " " .. _Version)

---------------------------|
-- Teams: -----------------|
local TeamsTab = window:CreateTab("Teams")
local JoinTeams = TeamsTab:AddSection("Team Changer")
JoinTeams:AddButton("Inmates", function()
	TeamEvent:FireServer(tostring(Teams.Inmates.TeamColor))
end)
JoinTeams:AddButton("Criminals", function()
	becomeCriminal()
end)
JoinTeams:AddButton("Guards", function()
	if howManyGuards() >= 8 then
		ninthKnight()
	else
		TeamEvent:FireServer(tostring(Teams.Guards.TeamColor))
	end
end)
JoinTeams:AddButton("Neutral", function()
	TeamEvent:FireServer(tostring(Teams.Neutral.TeamColor))
end)
-- Auto Join Teams

local AutoJoins = TeamsTab:AddSection("Auto Joins")
AutoJoins:AddToggle("Auto Join Inmates", function(state)
	getgenv().AJI = state
	repeat wait()
		TeamEvent:FireServer(tostring(Teams.Inmates.TeamColor))
	until getgenv().AJI == false
end)
AutoJoins:AddToggle("Auto Join Guards", function(state)
	getgenv().AJG = state
	repeat wait()
		TeamEvent:FireServer(tostring(Teams.Guards.TeamColor))
	until getgenv().AJG == false
end)
AutoJoins:AddToggle("Team Spam", function(state)
	getgenv().TeamSpam = state
	repeat wait()
		TeamEvent:FireServer(tostring(Teams.Guards.TeamColor))
		wait()
		TeamEvent:FireServer(tostring(Teams.Inmates.TeamColor))
		wait()
		TeamEvent:FireServer(tostring(Teams.Neutral.TeamColor))
	until getgenv().TeamSpam == false
end)
-- Custom Team Color
local CustomColorSect = TeamsTab:AddSection("Custom Colors")
CustomColorSect:AddCP("Color", Color3.fromRGB(255,255,255), function(color,alpha)
	getgenv().CustomColor = color
end)
CustomColorSect:AddButton("Set Color", function()
	if getgenv().CustomColor ~= nil then
	
		local pos = RootPart.CFrame
		LoadCharEvent:InvokeServer("", getgenv().CustomColor)
		wait()
		RootPart.CFrame = pos
	end
end)

---------------------------|
-- Weapons: ---------------|
local WeaponsTab = window:CreateTab("Weapons")
local Givers = WeaponsTab:AddSection("Givers")
Givers:AddButton("Give Guns", function()
	getGuns()
end)
Givers:AddButton("Give Tools", function()
	giveTools()
end)
Givers:AddButton("Give Tazer/Handcuffs", function()
	ninthKnight()
	wait()
	TeamEvent:FireServer(tostring(Teams.Inmates.TeamColor))
end)
Givers:AddButton("Give Sword", function()
	loadstring(game:HttpGet(("https://pastebin.com/raw/TeNjzL80"), true))()
end)
Givers:AddToggle("Auto Give Guns", function(state)
	if state == true then
		getGuns()
	end
	WeaponsStuff.AutoGuns = state
end)
Givers:AddToggle("Auto Give Sword", function(state)
	if state == true then
		loadstring(game:HttpGet(("https://pastebin.com/raw/TeNjzL80"), true))()
	end
	WeaponsStuff.AutoSword = state
end)
Givers:AddToggle("Auto Give Tools", function(state)
	if state == true then
		giveTools()
	end
	WeaponsStuff.AutoTools = state
end)
-- Mod Guns

local ModGunsSect = WeaponsTab:AddSection("Mod Guns")
ModGunsSect:AddButton("Mod All", function()
	for i,v in pairs(Backpack:GetChildren()) do
		ModifyGun(v)
	end
end)
ModGunsSect:AddButton("Mod In Hand", function()
	local gunSelected = game.workspace[Player.Name]:FindFirstChildOfClass("Tool")
	if gunSelected ~= nil then
		ModifyGun(gunSelected)
	end
end)
ModGunsSect:AddButton("Lag Shotgun", function()
	local Shotgun = Backpack["Remington 870"]
	local States = Shotgun:FindFirstChildOfClass("ModuleScript")
	if States then
		local h = require(States)
		h.Bullets = 10000
		h.Spread = 150
		h.AutoFire = true
		h.CurrentAmmo = math.huge
		States.Name = "Modded"
	end
end)
-- Gun Colors

local GunColorSect = WeaponsTab:AddSection("Gun Colors")
GunColorSect:AddCP("Color", Color3.fromRGB(255,255,255), function(color,alpha)
	WeaponsStuff.GunColor = color
	WeaponsStuff.GunTransparency = alpha
end)
GunColorSect:AddButton("Set Color", function()
	if WeaponsStuff.GunColor ~= nil then
		changeColor(WeaponsStuff.GunColor,WeaponsStuff.GunTransparency)
	end
end)

---------------------------|
-- Character: -------------|
local CHGui = window:CreateTab("Character")
local charMods = CHGui:AddSection("Character Mods")
charMods:AddToggle("Inf Stamina", function(state)
	CharacterStuff.InfStamina = state
end)
charMods:AddToggle("No Punch Cooldown", function(state)
	CharacterStuff.NoPunchCooldown = state
end)
charMods:AddToggle("One Shot Punches", function(state)
	CharacterStuff.OneShotPunches = state
end)
charMods:AddToggle("Noclip", function(state)
	CharacterStuff.Noclip = state
end)
charMods:AddToggle("Inf Jump", function(state)
	CharacterStuff.InfJump = state
	UserInputService.JumpRequest:Connect(function()
		if CharacterStuff.InfJump == true then
			if (Character) and (Humanoid) then
				Humanoid:ChangeState("Jumping")
			end
		end
	end)
end)
charMods:AddToggle("Tazer Bypass", function(state)
	CharacterStuff.TazerBypass = state
	if state == true then
		ClientInputHandler.Disabled = true
	end
end)
-- Walkspeed and Jump Power

local LPMods = CHGui:AddSection("LocalPlayer")
LPMods:AddSlider("Walkspeed", 250, 16, function(value)
	CharacterStuff.WalkSpeed = value
end, true)
LPMods:AddToggle("Super Speed", function(state)
	CharacterStuff.SuperSpeed = state
	Humanoid.WalkSpeed = state and CharacterStuff.WalkSpeed or 16
end)
LPMods:AddSlider("JumpPower", 450, 50, function(value)
	CharacterStuff.JumpPower = value
end, true)
LPMods:AddToggle("Super Jump", function(state)
	CharacterStuff.SuperJump = state
	Humanoid.JumpPower = state and CharacterStuff.JumpPower or 50
end)
LPMods:AddSlider("Hip Height", 100, 0, function(value)
	CharacterStuff.HipHeight = value
end, true)
LPMods:AddToggle("Change Hip Height", function(state)
	CharacterStuff.ChangeHipHeight = state
	Humanoid.HipHeight = state and CharacterStuff.HipHeight or 0
end)
-- Misc Modifications
local CHMisc = CHGui:AddSection("Misc")
CHMisc:AddButton("Respawn", function()
	LoadCharEvent:InvokeServer()
end)
CHMisc:AddButton("Refresh", function()
	Refresh()
end)
CHMisc:AddToggle("Auto Respawn", function(state)
	CharacterStuff.AutoRespawn = state
end)
CHMisc:AddToggle("Auto Refresh", function(state)
	CharacterStuff.AutoRefresh = state
end)
CHMisc:AddButton("Ctrl Click Tp", function()
	loadstring(game:HttpGet(("https://pastebin.com/raw/N7VMNUMD"), true))()
	SendMessage("Loaded Ctrl+Click Tp, to use, hold ctrl and click wherever you want to tp", Color3.fromRGB(0,255,0))
end)
CHMisc:AddButton("Delete Tool", function()
	local tool1   = Instance.new("HopperBin",Backpack)
	tool1.BinType = "Hammer"
end)
CHMisc:AddToggle("FE Fling", function(state)
	CharacterStuff.Flinging = state
	if state == true then
		local bambam = Instance.new("BodyThrust")
		bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		bambam.Force = Vector3.new(CharacterStuff.FlingPower,0,CharacterStuff.FlingPower)
		bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyThrust"):Destroy()
	end
end)
---------------------------|
-- Teleports: -------------|
local TPGui = window:CreateTab("Teleports")
local TeleportSect = TPGui:AddSection("Teleports")

local TpNames = {
	"Prison",
	"Cells",
	"Cafeteria",
	"Armory",
	"Yard",
	"Criminal Base",
	"Secret Room 1",
	"Bridge Room",
	"Guard Tower",
	"Prison Roof",
	"Escape",
	"Back Hall",
	"Supermarket",
	"Samar's Home",
	"Underground",
}

local ActualTps = {
	CFrame.new(915, 100, 2385), -- Prison
	CFrame.new(915, 100, 2467), -- Cells
	CFrame.new(877, 100, 2289), -- Cafeteria
	CFrame.new(833, 100, 2312), -- Armory
	CFrame.new(779, 98, 2465), -- Yard
	CFrame.new(-941, 94, 2065), -- Criminal Base
	CFrame.new(691.162537, 100.190758, 2344.01392), -- Sec Room 1
	CFrame.new(-103.875061, 11.4865532, 1326.43225), -- Bridge Room
	CFrame.new(818.666565, 130.039948, 2570.8938), -- Guard Tower
	CFrame.new(830.879639, 118.990005, 2370.06445), -- Prison Roof
	CFrame.new(384.299805, 85.8873215, 2258.79883), -- Escape
	CFrame.new(974.276428, 99.9900055, 2337.2644), -- Back Hall
	CFrame.new(-449.977325, 54.335041, 1709.9281),  -- Super Market
	CFrame.new(917.298401, 78.6986389, 2328.60596), -- Sewers
	CFrame.new(-826.276001, 10.8399124, 1491.15686), -- Underground
}

for i,v in next, TpNames do
	TeleportSect:AddButton(v, function(state)
		RootPart.CFrame = ActualTps[i] * CFrame.Angles(
			math.rad(RootPart.Orientation.X), 
            math.rad(RootPart.Orientation.Y), 
            math.rad(RootPart.Orientation.Z)
		)
		Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end)
end

---------------------------|
-- Player: ----------------|
local PGui = window:CreateTab("Player")
local PlrName = PGui:AddSection("Select Player")
PlrName:AddBox("Player Name", function(value, a)
	local h = findPlayer(value)
	if h then
		PlayerStuff.PlayerSelected = h
		getgenv().LoopKillerTarget = h
	else
		SendMessage("Player not found!", Color3.fromRGB(255,0,0))
	end
end, true)
-- Tp/View

local TpView = PGui:AddSection("Teleport/View")
TpView:AddButton("Teleport To", function()
	local Target = game.Players[PlayerStuff.PlayerSelected].Character.HumanoidRootPart
	if Target and RootPart then
		RootPart.CFrame = Target.CFrame
	end
end)
TpView:AddToggle("Loop Teleport To", function(state)
	PlayerStuff.IsLoopTeleporting = state
	if PlayerStuff.PlayerSelected then
		local Target = game.Players[PlayerStuff.PlayerSelected].Character.HumanoidRootPart
		while PlayerStuff.IsLoopTeleporting do wait()
			if PlayerStuff.IsLoopTeleporting == false then break end
			if Target and RootPart then
				RootPart.CFrame = Target.CFrame
			end
		end
	end
end)
TpView:AddToggle("View", function(state)
	PlayerStuff.ViewingPlayer = state
	if PlayerStuff.PlayerSelected then
		pcall(function()
			repeat wait()
				if PlayerStuff.ViewingPlayer == false then break end
				Camera.CameraSubject = game.Players[PlayerStuff.PlayerSelected].Character.Humanoid
			until PlayerStuff.ViewingPlayer == false
		end)
		if state == false then
			Camera.CameraSubject = Humanoid
		end
	end
end)
TpView:AddButton("Bring Player", function()
	if PlayerStuff.PlayerSelected then
		bring(PlayerStuff.PlayerSelected)
	end
end)
TpView:AddToggle("Loopbring Player", function(state)
	PlayerStuff.IsLoopBringing = state
	if PlayerStuff.PlayerSelected then
		while PlayerStuff.IsLoopBringing do wait()
			bring(PlayerStuff.PlayerSelected)
		end
	end
end)
-- Kill

local KillPlr = PGui:AddSection("Kill")
KillPlr:AddButton("Kill", function()
	if PlayerStuff.PlayerSelected then
		KillSpecific(PlayerStuff.PlayerSelected)
	end
end)
KillPlr:AddToggle("Loopkill", function(state)
	PlayerStuff.IsLoopKilling = state
	if PlayerStuff.PlayerSelected then
		while PlayerStuff.IsLoopKilling do wait()
			if PlayerStuff.IsLoopKilling == false then break end
			wait(0.5)
			KillSpecific(PlayerStuff.PlayerSelected)
		end
	end
end)
KillPlr:AddButton("Inf Loopkill", function()
	if PlayerStuff.PlayerSelected then
		SendMessage("Rejoin the game for the loopkill to stop!", Color3.fromRGB(255,0,255))
		getgenv().LoopKillerTarget = PlayerStuff.PlayerSelected
		loadstring(game:HttpGet(("https://pastebin.com/raw/5HJqyjvQ"), true))()
	end
end)
-- Arrest

local ArrestPlr = PGui:AddSection("Arrest")
ArrestPlr:AddButton("Arrest", function()
	if PlayerStuff.PlayerSelected then
		ArrestSpecific(PlayerStuff.PlayerSelected)
	end
end)
ArrestPlr:AddToggle("Spam Arrest", function(state)
	getgenv().IsSpamArresting = state
	local Target = game.Players[PlayerStuff.PlayerSelected]
	if getgenv().wl[Target.UserId] then
		return SendMessage("Person you're trying to crash is a script user, this feature is disabled against other script users!", Color3.fromRGB(255,0,0))
	end
	if PlayerStuff.PlayerSelected then
		if (Character) and (Humanoid) and (RootPart) then
			local backup = RootPart.CFrame
			for idx,plr in pairs(Players:GetPlayers()) do
				if (plr ~= Player) and (plr.Character) and (plr.Team == Teams.Criminals) and (plr.Name == PlayerStuff.PlayerSelected) then
					local otherRoot = plr.Character.HumanoidRootPart
					if (otherRoot) then
						local RunLoop = RunService.RenderStepped:Connect(function()
							while getgenv().IsSpamArresting do wait()
								if getgenv().IsSpamArresting == false then break end
								RootPart.CFrame = otherRoot.CFrame
								for i = 1, 500 do
									game.workspace.Remote.arrest:InvokeServer(plr.Character.Torso)
								end
							end
							if getgenv().IsSpamArresting == false then
								PlayerStuff.PlayerSelected = ""
								RunLoop:Disconnect()
							end
						end)
					end
				end
			end
		end
	end
end)
-- Taze

local TazePlr = PGui:AddSection("Taze")
TazePlr:AddButton("Taze", function()
	if PlayerStuff.PlayerSelected then
		ninthKnight()
		wait()
		taze(game.Players[PlayerStuff.PlayerSelected])
	end
end)
TazePlr:AddToggle("Loop taze", function(state)
	PlayerStuff.IsLoopTazing = state	
	if PlayerStuff.PlayerSelected then
		if state == true then
			ninthKnight()
			wait()
		end
		while PlayerStuff.IsLoopTazing do wait(0.5)
			if PlayerStuff.IsLoopTazing == false then break end
			taze(game.Players[PlayerStuff.PlayerSelected])
		end
	end
end)
-- Crash

local CrashPlr = PGui:AddSection("Crash")
CrashPlr:AddButton("Crash Player", function()
	if PlayerStuff.PlayerSelected then
		local Target = game.Players[PlayerStuff.PlayerSelected]
		if getgenv().wl[Target.UserId] then
			return SendMessage("Person you're trying to crash is a script user, this feature is disabled against other script users!", Color3.fromRGB(255,0,0))
		else
			crash(Target)
		end
	end
end)
CrashPlr:AddButton("Taze Crash (cant be guard)", function()
	if PlayerStuff.PlayerSelected then
		local Target = Players[PlayerStuff.PlayerSelected]
		if getgenv().wl[Target.UserId] then
			return SendMessage("Person you're trying to crash is a script user, this feature is disabled against other script users!", Color3.fromRGB(255,0,0))
		else
			TazeCrash(Target)
		end
	end
end)
-- Make Criminal

local MakePlrCrim = PGui:AddSection("Criminal")
MakePlrCrim:AddButton("Make Criminal", function()
	if PlayerStuff.PlayerSelected then
		MakeCriminal(PlayerStuff.PlayerSelected)
	end
end)

---------------------------|
-- Kill: ------------------|
local KillTab = window:CreateTab("Kill")
local KillAllSect = KillTab:AddSection("Kill Alls")
KillAllSect:AddButton("Kill All", function()
	KillAll()
end)
KillAllSect:AddToggle("Loopkill All", function(state)
	KillStuff.IsLoopKillingAll = state
	while KillStuff.IsLoopKillingAll do wait(1)
		if KillStuff.IsLoopKillingAll == false then break end
		KillAll()
	end
end)
KillAllSect:AddButton("Inf LoopKill All", function()
	SendMessage("Rejoin the game for the loopkill to stop!", Color3.fromRGB(255,0,255))
	getgenv().LoopKillerTarget = "all"
	loadstring(game:HttpGet(("https://pastebin.com/raw/5HJqyjvQ"), true))()
end)
-- Kill Specific Teams

local KillTeams = KillTab:AddSection("Kill Specific Teams")
KillTeams:AddDropdown("Target Team", {"Guards", "Inmates", "Criminals", "Neutral"}, function(value)
	KillStuff.TargetTeam = value
	getgenv().LoopKillerTarget = value
end, true)
KillTeams:AddButton("Kill Team", function()
	if KillStuff.TargetTeam then
		KillTeam()
	end
end)
KillTeams:AddToggle("Loopkill Team", function(state)
	KillStuff.IsLoopKillingTeam = state
	if KillStuff.TargetTeam then
		while KillStuff.IsLoopKillingTeam do wait(1)
			if KillStuff.IsLoopKillingTeam == false then break end
			KillTeam()
		end
	end
end)
KillTeams:AddButton("Inf Loopkill Team", function()
	if KillStuff.TargetTeam then
		getgenv().LoopKillerTarget = KillStuff.TargetTeam
		loadstring(game:HttpGet(("https://pastebin.com/raw/5HJqyjvQ"), true))()
		SendMessage("Rejoin the game for the loopkill to stop!", Color3.fromRGB(255,0,255))
	end
end)
-- Misc Kill 

local MiscKill = KillTab:AddSection("Misc Kills")
MiscKill:AddButton("Kill Half Server", function()
	local plrs = {}
	local SelectedPlrs = {}
	for i,v in pairs(game.Players:GetPlayers()) do
		table.insert(plrs, v)
	end
	wait()
	local HalfTheCount = round(tonumber(#plrs / 2))
	local counter = 0
	for i,v in next, plrs do
		counter = i
		if counter > HalfTheCount then break end
		local Player = plrs[math.random(1,#plrs)]
		if Player.Name == game.Players.LocalPlayer.Name then
			repeat wait() Player = plrs[math.random(1,#plrs)] until Player.Name ~= game.Players.LocalPlayer.Name
		end
		if table.find(SelectedPlrs, Player) then
			repeat wait() Player = plrs[math.random(1,#plrs)] until not table.find(SelectedPlrs, Player)
		end
		SelectedPlrs[#SelectedPlrs+1] = Player
	end

	for i,v in next, SelectedPlrs do
		KillSpecific(v.Name)
	end
end)
MiscKill:AddToggle("Click Kill", function(state)
	KillStuff.ClickKill = state
	local mouse = game.Players.LocalPlayer:GetMouse()
    local MeleeEvent = game.ReplicatedStorage.meleeEvent
	mouse.Button1Down:connect(function()
        local obj = mouse.Target
        local x = obj:GetFullName()
        local d = string.split(x, ".")
        if (KillStuff.ClickKill == true) then
            for i = 1, 25 do
				MeleeEvent:FireServer(game.Players[d[2]])
            end	
        end
    end)
end)
-- Auras

local KillAuras = KillTab:AddSection("Auras")
KillAuras:AddDropdown("Kill Aura Target", {"All", "Inmates", "Guards", "Criminals", "Neutral"}, function(value)
	KillStuff.KillAuraTarget = value
end, true)
KillAuras:AddToggle("Kill Aura", function(state)
	KillStuff.KillAura = state
end)
KillAuras:AddToggle("Flash Aura", function(state)
	KillStuff.FlashAura = state
end)

---------------------------|
-- Exploits: --------------|
local ExploitsTab = window:CreateTab("Exploits")
local MainExploits = ExploitsTab:AddSection("Main Exploits")
MainExploits:AddToggle("Silent Aim", function(state)
	ExploitsStuff.SilentAimEnabled = state
end)
MainExploits:AddToggle("Lag Server (swat)", function(state)
	ExploitsStuff.SwatLag = state
	if (MarketplaceService:UserOwnsGamePassAsync(Player.UserId, 96651)) then
		while ExploitsStuff.SwatLag do
			workspace.Remote.TeamEvent:FireServer("Bright blue")
			
			ninthKnight()
			for i = 10000,999999999999999,1 do
				for i,v in pairs (workspace.Prison_ITEMS.clothes:GetChildren()) do
					local VestiriaBestPLifeGui = workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
					print(VestiriaBestPLifeGui)    
				end
			end
		end
	else
		SendMessage("You need the swat gamepass for this to work!", Color3.fromRGB(230,0,0))
	end
end)
MainExploits:AddButton("Godmode", function()
	if Character then
		if Player.Character:FindFirstChild("Humanoid") then
			Player.Character.Humanoid.Name = "1"
		end
		local l = Player.Character["1"]:Clone()
		l.Parent = Player.Character
		l.Name = "Humanoid"; wait(0.1)
		Player.Character["1"]:Destroy()
		workspace.CurrentCamera.CameraSubject = Player.Character.Humanoid
		godded = true
		spawn(function()
			while godded do wait()
				Player.Character.Animate.Disabled = true; 
			end
		end)
	end
end)
MainExploits:AddToggle("Loop godmode", function(state)
	ExploitsStuff.LoopGodmode = state
	if state == true then
		if Character then
			if Player.Character:FindFirstChild("Humanoid") then
				Player.Character.Humanoid.Name = "1"
			end
			local l = Player.Character["1"]:Clone()
			l.Parent = Player.Character
			l.Name = "Humanoid"; wait(0.1)
			Player.Character["1"]:Destroy()
			workspace.CurrentCamera.CameraSubject = Player.Character.Humanoid
			LoopGodded = true
			spawn(function()
				while LoopGodded do wait()
					Player.Character.Animate.Disabled = true; 
				end
			end)
		end
	else
		LoopGodded = false
		Player.Character.Animate.Disabled = false; 
	end
end)
MainExploits:AddButton("Crash Server", function()
	for i,v in pairs(Players:GetPlayers()) do
		if v.Name ~= Player.Name then
			crash(v)
		end
	end
end)
MainExploits:AddToggle("Invisible", function(state)
	if state == true then 
		local player = game.Players.LocalPlayer
        position = player.Character.HumanoidRootPart.Position
        wait(0.1)
        player.Character:MoveTo(position + Vector3.new(0, 1000000, 0))
        wait(0.1)
        humanoidrootpart = player.Character.HumanoidRootPart:clone()
        wait(0.1)
        player.Character.HumanoidRootPart:Destroy()
        humanoidrootpart.Parent = player.Character
        player.Character:MoveTo(position)
        wait()
        game.Players.LocalPlayer.Character.Torso.Transparency = 0.3
        game.Players.LocalPlayer.Character.Head.Transparency  = 0.3
        game.Players.LocalPlayer.Character["Left Arm"].Transparency = 0.3
        game.Players.LocalPlayer.Character["Right Arm"].Transparency = 0.3
        game.Players.LocalPlayer.Character["Left Leg"].Transparency = 0.3
		game.Players.LocalPlayer.Character["Right Leg"].Transparency = 0.3
	else
		LoadCharEvent:InvokeServer()
	end
end)
MainExploits:AddToggle("Spawn Items", function(state)
	ExploitsStuff.SpawnItems = state
	if state == true then ninthKnight() end
	while ExploitsStuff.SpawnItems do wait()
		if ExploitsStuff.SpawnItems == false then break end
		Character:BreakJoints()
		wait()
		ninthKnight()
		wait(.2)
		Character:BreakJoints()
	end
end)
-- Taze Exploits

local TazeSect = ExploitsTab:AddSection("Taze Exploits")
TazeSect:AddButton("Taze All", function()
	ninthKnight()
	for i,v in pairs(Players:GetPlayers()) do
		if v.Name ~= Player.Name and v.Team ~= Teams.Guards then
			taze(v)
		end
	end
end)
TazeSect:AddToggle("Looptaze All", function(state)
	ExploitsStuff.IsLoopTazingAll = state
	if state == true then
		ninthKnight()
	end
	while ExploitsStuff.IsLoopTazingAll do wait(1)
		if ExploitsStuff.IsLoopTazingAll == false then break end
		for i,v in pairs(Players:GetPlayers()) do
			if v.Name ~= Player.Name and v.Team ~= Teams.Guards then
				taze(v)
			end
		end
	end
end)
TazeSect:AddToggle("Click Taze", function(state)
	ExploitsStuff.ClickTaze = state
	if state == true then
		ninthKnight()
	end
	local mouse = game.Players.LocalPlayer:GetMouse()
	mouse.Button1Down:connect(function()
        local obj = mouse.Target
        local x = obj:GetFullName()
        local d = string.split(x, ".")
        if (ExploitsStuff.ClickTaze == true) then
            taze(game.Players[d[2]])
        end
    end)
end)
TazeSect:AddToggle("Taze Aura", function(state)
	if state == true then
		ninthKnight()
	end
	ExploitsStuff.TazeAura = state
end)
-- Arrest Exploits

local ArrestSect = ExploitsTab:AddSection("Arrest Exploits")
ArrestSect:AddButton("Arrest All", function()
	arrestAll()
end)
ArrestSect:AddToggle("Auto Arrest", function(state)
	ExploitsStuff.AutoArrest = state
	if state then
		arrestAll()
	end
	local TeamWanted = Teams.Criminals
	TeamWanted.PlayerAdded:Connect(function()
		if ExploitsStuff.AutoArrest then
			arrestAll()
		end
	end)
end)
ArrestSect:AddToggle("Arrest Aura", function(state)
	ExploitsStuff.ArrestAura = state
end)
ArrestSect:AddToggle("Click Arrest", function(state)
	ExploitsStuff.ClickArrest = state
	local mouse = Player:GetMouse()
	mouse.Button1Down:connect(function()
        local obj = mouse.Target
        if (ExploitsStuff.ClickArrest == true) then
            local response = ArrestEvent:InvokeServer(obj)
        end
    end)
end)
ArrestSect:AddToggle("No Arrest Cooldown", function(state)
	ExploitsStuff.NoArrestCooldown = state
	local mouse = Player:GetMouse()
	mouse.Button1Down:connect(function()
		local obj = mouse.Target
		if (ExploitsStuff.NoArrestCooldown) then
			if isHoldingItem("Handcuffs") then
				local response = ArrestEvent:InvokeServer(obj)
			end
		end
	end)
end)

---------------------------|
-- Car Haxx: --------------|
local CarHaxxTab = window:CreateTab("CarHaxx")
local MainCarStuff = CarHaxxTab:AddSection("Main")
MainCarStuff:AddButton("How to use", function()
	SendMessage(" || How to use Car Haxx || ", Color3.fromRGB(255,255,0))
	wait()
	SendMessage([[
		1. Select a player before using the player specific exploits!
		2. Summon car brings a car to your position
		3. Bring All Cars tps all the cars to you
		4. Car spam has multiple modes: TpToPlayer, TpToMouse and TpToPos. This first 2 are very self-explanitory
		5. To use TpToPos, set a position using "Set Pos" and then begin car spamming!
		6. SetPos sets the position to exactly where your character is!
		7. Spawn offset will increase the height at which the cars tp to you. This can be useful for mass spamming 
	]], Color3.fromRGB(0,255,0))
	SendMessage("Some functions might not work. If a player is in the car that the script selects, it wont tp the car to you or a player!", Color3.fromRGB(255,0,0))
end)
MainCarStuff:AddBox("Player Name", function(value)
	local h = findPlayer(value)
	if h then
		CarHaxxStuff.TargetPlayer = h
	else
		SendMessage("Player not found!", Color3.fromRGB(255,0,0))
	end
end, true)
MainCarStuff:AddButton("Spawn Car On Player", function()
	local target = CarHaxxStuff.TargetPlayer
	if target then
		local otherRoot = game.Players[target].Character.HumanoidRootPart
		if otherRoot then
			local backup = RootPart.CFrame
			wait()
			RootPart.CFrame = otherRoot.CFrame
			wait()
			local pos = RootPart.CFrame
			game.workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.buttons:FindFirstChild("Car Spawner")["Car Spawner"])
			wait(.3)
			game.workspace.CarContainer:FindFirstChildOfClass("Model"):MoveTo(Vector3.new(pos.X,pos.Y,pos.Z))
			game.workspace.CarContainer:FindFirstChildOfClass("Model").Parent = game.workspace
			wait(0.1)
			Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			wait(0.1)
			RootPart.CFrame = backup
		end
	end
end)
MainCarStuff:AddButton("Car Teleport To", function()
	local target = game.Players[CarHaxxStuff.TargetPlayer]
	if target then
		local otherRoot = target.Character.HumanoidRootPart
		if otherRoot and RootPart then
			local Car = Humanoid.SeatPart
			if Car then
				Car.Parent.Parent:MoveTo(otherRoot.Position)
			else
				SendMessage("You must be in a car dumb dumb", Color3.fromRGB(255,0,0))
			end
		end
	else
		return SendMessage("Player not found!", Color3.fromRGB(255,0,0))
	end
end)
MainCarStuff:AddButton("Summon Car", function()
	local pos = RootPart.CFrame
	game.workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.buttons:FindFirstChild("Car Spawner")["Car Spawner"])
	wait(.3)
	game.workspace.CarContainer:FindFirstChildOfClass("Model"):MoveTo(Vector3.new(pos.X,pos.Y,pos.Z))
	game.workspace.CarContainer:FindFirstChildOfClass("Model").Parent = game.workspace
end)
MainCarStuff:AddButton("Bring All Cars", function()
	local pos = RootPart.CFrame
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("Model") then
			if v.Name == "Sedan" or v.Name == "Squad" then
				v:MoveTo(Vector3.new(pos.X,pos.Y+10,pos.Z))
			end
		end
	end
end)
MainCarStuff:AddButton("Bring All Cars To Plr", function()
	local target = CarHaxxStuff.TargetPlayer
	target = game.Players[target]
	local otherRoot = target.Character.HumanoidRootPart
	if (otherRoot) then
		local pos = otherRoot.CFrame
		for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("Model") then
				if v.Name == "Sedan" or v.Name == "Squad" then
					v:MoveTo(Vector3.new(pos.X,pos.Y+10,pos.Z))
				end
			end
		end
	end
end)
MainCarStuff:AddDropdown("Spawn Type", {"TpToPlayer", "TpToMouse", "TpToPos", "TpToClient"}, function(value)
	CarHaxxStuff.SpawnType = value
end, true)
MainCarStuff:AddButton("Set Position (TpToPos)", function(value)
	local pos = RootPart.Position
	CarHaxxStuff.ToPosPosition = pos
	SendMessage("Set position to " .. tostring(pos), Color3.fromRGB(255,0,255))
end)
MainCarStuff:AddToggle("Car Spam", function(state)
	CarHaxxStuff.IsCarSpamming = state
	while CarHaxxStuff.IsCarSpamming do wait()
		if CarHaxxStuff.IsCarSpamming == false then break end
		if CarHaxxStuff.SpawnType == "TpToPlayer" then
			for i,v in pairs(workspace.Prison_ITEMS.buttons:GetDescendants()) do
				if v.Name == "Car Spawner" and v.ClassName == "Part" then
					workspace.Remote.ItemHandler:InvokeServer(v)
				end
			end
			wait(.3)
			local target = Players[CarHaxxStuff.TargetPlayer] or Player
			local otherRoot = target.Character.HumanoidRootPart
			for i,v in pairs(workspace.CarContainer:GetChildren()) do
				v:MoveTo(Vector3.new(otherRoot.CFrame.X, otherRoot.CFrame.Y + 10, otherRoot.CFrame.Z))
				v.Parent = workspace
			end
		elseif CarHaxxStuff.SpawnType == "TpToMouse" then
			local Mouse = game.Players.LocalPlayer:GetMouse()
			for i,v in pairs(workspace.Prison_ITEMS.buttons:GetDescendants()) do
				if v.Name == "Car Spawner" and v.ClassName == "Part" then
					workspace.Remote.ItemHandler:InvokeServer(v)
				end
			end
			wait(.5)
			for i,v in pairs(workspace.CarContainer:GetChildren()) do
				v:MoveTo(Mouse.hit.p)
				v.Parent = workspace
			end
		elseif CarHaxxStuff.SpawnType == "TpToPos" then
			if CarHaxxStuff.ToPosPosition ~= nil then
				local pos = CarHaxxStuff.ToPosPosition
				local Mouse = game.Players.LocalPlayer:GetMouse()
				for i,v in pairs(workspace.Prison_ITEMS.buttons:GetDescendants()) do
					if v.Name == "Car Spawner" and v.ClassName == "Part" then
						workspace.Remote.ItemHandler:InvokeServer(v)
					end
				end
				wait(.5)
				for i,v in pairs(workspace.CarContainer:GetChildren()) do
					v:MoveTo(Vector3.new(pos.X, pos.Y + 10, pos.Z))
					v.Parent = workspace
				end
			else
				SendMessage("Set a position first!", Color3.fromRGB(255,0,0))
				wait(10)
			end
		elseif CarHaxxStuff.SpawnType == "TpToClient" then
			for i,v in pairs(workspace.Prison_ITEMS.buttons:GetDescendants()) do
				if v.Name == "Car Spawner" and v.ClassName == "Part" then
					workspace.Remote.ItemHandler:InvokeServer(v)
				end
			end
			wait(.3)
			for i,v in pairs(workspace.CarContainer:GetChildren()) do
				v:MoveTo(Vector3.new(RootPart.CFrame.X, RootPart.CFrame.Y + 10, RootPart.CFrame.Z))
				v.Parent = workspace
			end
		end
	end
end)
-- Misc Mods

local MiscCar = CarHaxxTab:AddSection("Misc")
MiscCar:AddToggle("Car Speed", function(state)
	CarHaxxStuff.CarSpeed = state
	while CarHaxxStuff.CarSpeed do wait()
		if CarHaxxStuff.CarSpeed == false then break end
		for i,v in pairs(game:GetService("Workspace").CarContainer:GetDescendants()) do
			if v.ClassName == "VehicleSeat" then
				v.Torque = 20
				v.MaxSpeed = 800
			end
		end
	end
end)

---------------------------|
-- Global: ----------------|
local GlobalTab = window:CreateTab("Global")
local RemovesSect = GlobalTab:AddSection("Removes")
RemovesSect:AddToggle("Remove Doors", function(state)
	if (state == true) then  
		addFolder("Doors", game.Workspace)
	elseif (state == false) then
		removeFolder("Doors", game.Workspace)
	end
end)
RemovesSect:AddToggle("Remove Fences", function(state)
	if (state == true) then
		addFolder("Prison_Fences", game.Workspace)
	elseif (state == false) then
		removeFolder("Prison_Fences", game.Workspace)
	end
end)
RemovesSect:AddToggle("Remove Trees", function(state)
	if (state == true) then
		addFolder("Trees", game.Workspace)
		addFolder("Prison_Trees", game.Workspace)
	elseif (state == false) then
		removeFolder("Trees", game.Workspace)
		removeFolder("Prison_Trees", game.Workspace)
	end
end)
RemovesSect:AddToggle("Remove Town", function(state)
	if (state == true) then
		addFolder("City_buildings", game.Workspace)
	elseif (state == false) then
		removeFolder("City_buildings", game.Workspace)
	end
end)
-- Misc (idek)

local GlobalMisc = GlobalTab:AddSection("Misc")
GlobalMisc:AddButton("Open Gate", function()
	ItemHandler:InvokeServer(game.Workspace["Prison_ITEMS"].buttons["Prison Gate"]["Prison Gate"])

	messageSender.update("Opened Gate Door")
end)
GlobalMisc:AddButton("Open Garage Door", function()
	local openGarage = game:GetService("Workspace")["Prison_ITEMS"].buttons["Garage Buttons"]["open"]
	ItemHandler:InvokeServer(openGarage)

	messageSender.update("Opened Garage Door")
end)
GlobalMisc:AddButton("Close Garage Door", function()
	local closeGarage = game:GetService("Workspace")["Prison_ITEMS"].buttons["Garage Buttons"]["close"]
	ItemHandler:InvokeServer(closeGarage)

	messageSender.update("Closed Garage Door")
end)
GlobalMisc:AddButton("Reset Character", function()
	Character:BreakJoints()
end)
GlobalMisc:AddButton("Rejoin Game", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId)
end)
-- Advertise 

local AdvertiseSect = GlobalTab:AddSection("Advertise")
AdvertiseSect:AddButton("Advertise", function()
	local message = "You're a script kiddie if you don't use " .. _Name .. " " .. _Version
	ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end)
AdvertiseSect:AddToggle("Spam Advertise", function(state)
	GlobalStuff.IsSpamAdvertising = state
	while GlobalStuff.IsSpamAdvertising do wait()
		if GlobalStuff.IsSpamAdvertising == false then break end
		local message = "I am using " .. _Name .. " " .. _Version .. " . Isnt it hot?"
		ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
		wait(1)
	end
end)
-- Main

local GlobalMain = GlobalTab:AddSection("Main")
GlobalMain:AddToggle("Fullbright", function(state)
	_G.FullBrightEnabled = state
end)
GlobalMain:AddButton("Boost Fps (rj to stop)", function()
	for _,v in pairs(workspace:GetDescendants()) do
	if v.ClassName == "Part"
	or v.ClassName == "SpawnLocation"
	or v.ClassName == "WedgePart"
	or v.ClassName == "Terrain"
	or v.ClassName == "MeshPart" then
	v.Material = "Plastic"
	end
	end
end)
GlobalMain:AddToggle("Bypass Kill All", function(state)
	GlobalStuff.BypassKillAll = state
	while GlobalStuff.BypassKillAll do wait()
		if GlobalStuff.BypassKillAll == false then break end
		ninthKnight()
		wait(3.5)
	end
end)
GlobalMain:AddToggle("Toggle Hud", function(state)
	hud.Visible = state
end)

---------------------------|
-- OtherScripts: ----------|
local otherScriptsTab = window:CreateTab("Other")
local xdddd = otherScriptsTab:AddSection("Main")
xdddd:AddButton("Infinite Yield", function()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"), true))()
end)
xdddd:AddButton("FE Chill", function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/CdDw1CUw'),true))()
end)
xdddd:AddButton("Hat Orbit", function()
	loadstring(game:HttpGet(("https://pastebin.com/raw/sxn5uBb2"), true))()
end)
xdddd:AddButton("Unanchored To Plr", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/UqC0MrJ6", true))()
end)
xdddd:AddButton("Chat Spy", function()
	loadstring(game:HttpGet(("https://pastebin.com/raw/qNMunbP8"), true))()
end)
xdddd:AddButton("Chat Translator", function()
	loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/xxaim/ignore/master/translator.lua'))()
end)


---------------------------|
-- Connects: --------------|

Player.CharacterAdded:Connect(function(character)
	pcall(function()
		Reload()
	end)
	godded = false
	LoopGodded = false
	Player.Character.Animate.Disabled = false
	if ExploitsStuff.LoopGodmode then
		if Player.Character:FindFirstChild("Humanoid") then
			Player.Character.Humanoid.Name = "1"
		end
		local l = Player.Character["1"]:Clone()
		l.Parent = Player.Character
		l.Name = "Humanoid"; wait(0.1)
		Player.Character["1"]:Destroy()
		workspace.CurrentCamera.CameraSubject = Player.Character.Humanoid
		LoopGodded = true
		spawn(function()
			while LoopGodded do wait()
				Player.Character.Animate.Disabled = true; 
			end
		end)
	end
	character:WaitForChild("Humanoid").Died:Connect(function()
		if KillStuff.FlashAura then
			Refresh()
			if KillStuff.KillAura ~= true then
				local backUpTarget = KillStuff.KillAuraTarget
				wait()
				KillStuff.KillAuraTarget = "All"
				wait()
				KillStuff.KillAura = true
				wait(1)
				KillStuff.KillAura = false
				KillStuff.KillAuraTarget = backUpTarget
			end
		end
		if CharacterStuff.AutoRespawn then
			LoadCharEvent:InvokeServer()
		end
		if CharacterStuff.AutoRefresh then
			Refresh()
		end
	end)
	if WeaponsStuff.AutoGuns then
		getGuns()
	end
	if WeaponsStuff.AutoTools then
		giveTools()
	end
	if WeaponsStuff.AutoSword then
		loadstring(game:HttpGet(("https://pastebin.com/raw/TeNjzL80"), true))()
	end
	if (CharacterStuff.TazerBypass == true) then
        game.Players.LocalPlayer.Character:WaitForChild("ClientInputHandler").Disabled = true
    end
end)

---------------------------|
-- Metatables: ------------|
MT.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    local t = {...}
    
    if Method == "FindPartOnRay" and ExploitsStuff.SilentAimEnabled then
        local env = getfenv(2)
        if env.script and env.script.Parent ~= nil and env.script.Parent:IsA("Tool") then
			local plr = GetClosest()
			if plr ~= nil then
				plr = game.Players[plr]
				if plr then
					local char = plr.Character
					if char then
						local head = char:FindFirstChild("Head")
						if head then
							return head, head.CFrame.p, head.CFrame.p    
						end
					end
				end
			end
		end
    end
    
    return oldnamecall(self, unpack(t))
end)


---------------------------|
-- Init Connects: ---------|

local pos = RootPart.CFrame
LoadCharEvent:InvokeServer()
wait()
RootPart.CFrame = pos

---------------------------|
-- Network Ownership: -----|

pcall(function() -- Network Ownership Patch
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/Patch-Shack/Network-Ownership.lua/master/Access'),true))();
end)



---------------------------|
-- Design Stuff: ----------|

typeWrite("Welcome " .. Player.Name .. " to " .. _Name, titleBar.Title)
wait(2)
coroutine.resume(coroutine.create(function()
	while wait() do 
		titleBar.Title.Text = "Vestiria v[4.0.0]"
		if Player.UserId == 1329695538 then
			local text = "Vestiria v[4.0.0] brought to you by T0mGames" .. "\n" .. "Roblox: VestiriaScripter" .. "\n" .."Discord: T0mgames#0477" .. "\n" .. "(love u samar)"
		else
			local text = "Vestiria v[4.0.0] brought to you by T0mGames" .. "\n" .. "Roblox: VestiriaScripter" .. "\n" .."Discord: T0mgames#0477"
		end
		Description.Text = text 
		local r = (math.sin(workspace.DistributedGameTime/2)/2)+0.5
		local g = (math.sin(workspace.DistributedGameTime)/2)+0.5
		local b = (math.sin(workspace.DistributedGameTime*1.5)/2)+0.5
		local color = Color3.new(r, g, b)
		StaminaFrame.BackgroundColor3 = color
	end
end))

---------------------------|
-- Random Messages: -------|
local facts = {
	"Cat's cannot taste sweet things",
	"Surgeons who listen to music during operations perform better than those who don't.",
	"The great wall of China is 1,400 miles long",
	"Women blink nearly twice as much as men.",
	"Donkeys kill more people annually than plane crashes.",
	"Each year 96 billion pounds of food is wasted in the U.S.",
	"Lightning strikes about 6,000 times per minute on this planet",
	"A bird 'chews' with its stomach.",
	"On average, half of all false teeth have some form of radioactivity.",
	"It was discovered on a space mission that a frog can throw up.",
	"The heart of an astronaut actually gets smaller when in outer space.",
	"Your heart pumps about 2,000 gallons of blood each day",
	"Someone on Earth reports seeing a UFO every three minutes.",
	"The speed of a typical raindrop is 17 miles per hour.",
	"The first product to have a bar code was Wrigleys gum",
	"Samar = best person",
	"Ves is world's best prison life scripter"
}
coroutine.resume(coroutine.create(function()
	if getgenv().funFacts == false then return end
	while wait(60) do
		local ranNum = math.random(1,#facts)
		local message = facts[ranNum]
		FactMessage(ranNum,message, Color3.fromRGB(255,0,255))
	end
end))
