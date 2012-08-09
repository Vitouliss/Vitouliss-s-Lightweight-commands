--[[

Vitouliss's Lightweight Commands...

Randomly updated Randomly. 

No version....It just get's updated without you knowing. 

--]]

local banned = {}
local admins = {""}

function check(playerName)
for _,v in pairs(admins) do
if v == playerName then 
print(playerName.. " Is an Admin")
return true
end
end
end 

function checkIfNoob(playerNoob)
for _,v in pairs(banned) do
if v == playerNoob then
print(playerNoob.. " IS A BANNED PLAYER OGMGMGMGMG")
return true 
end
end
end 


game:GetService("Players").PlayerAdded:connect(function(p)
if check(p.Name) then
p.Chatted:connect(function(msg)

local world = game:GetService("Workspace")

if string.sub(string.lower(msg),1,4) == "mes/" then
local omgmes = Instance.new("Message",world)
omgmes.Name = "AdminCommandMessage"
omgmes.Text = p.Name .. " : " .. string.sub(msg,5)
wait(math.random(3,5))
omgmes:Destroy()

elseif string.sub(string.lower(msg),1,3) == "tp/" then
for _,v in pairs(game.Players:GetChildren()) do
if v.Name:lower():match(string.sub(msg:lower(),4)) then
pcall(function()
p.Character:MoveTo(Vector3.new(v.Character.Head.Position))
end)
end
end

elseif string.sub(string.lower(msg),1,4) == "tph/" then
for _,v in pairs(game.Players:GetChildren()) do
if v.Name:lower():match(string.sub(msg:lower(),5)) then
pcall(function()
v.Character:MoveTo(Vector3.new(p.Character.Head.Position))
end)
end
end

elseif string.sub(string.lower(msg),1,4) == "tpp/" then
local tppos = string.sub(msg,5)
p.Character:MoveTo(Vector3.new(tppos))


elseif string.sub(string.lower(msg),1,5) == "kill/" then
for _,v in pairs(game.Players:GetChildren()) do
if v.Name:lower():match(string.sub(msg:lower(),6)) then
pcall(function()
if v.Character then
v.Character:BreakJoints()
end
end) 
end
end

elseif string.lower(msg) == "sethome" then
--[[
for a,b in pairs(world:GetChildren()) do
if b.Name == p.Name.."Home" then 
b:Destroy()
--]]
plyHome = Instance.new("Part",p.Character)
plyHome.Anchored = true
plyHome.Name = "PlayersHome"
plyHome.Locked = true
plyHome.Transparency = 1
plyHome.CanCollide = false 
plyHome.Position = p.Character.Torso.Position
print(p.Name.." Setted his/her home.")
--end
--end 


elseif string.lower(msg) == "home" then
pcall(function()
p.Character:MoveTo(plyHome.Position)
end) 

elseif string.lower(msg) == "delhome" then
pcall(function()
p.Character.PlayersHome:Destroy()
end)

elseif string.sub(string.lower(msg),1,5) == "heal/" then
for _,v in pairs(game.Players:GetChildren()) do
if v.Name:lower():match(string.sub(msg:lower(),6)) then
pcall(function()
for a,b in pairs(v.Character:GetChildren()) do
if b.ClassName == "Humanoid" then
b.Health = b.MaxHealth
end
end
end)
end
end 

elseif string.sub(string.lower(msg),1,7) == "charid/" then
p.CharacterAppearance = "http://www.roblox.com/Asset/CharacterFetch.ashx?userId="..string.sub(msg,8)
p.Character:BreakJoints()

elseif string.sub(string.lower(msg),1,6) == "speed/" then
for a,b in pairs(p.Character:GetChildren()) do
if b.ClassName == "Humanoid" then
b.WalkSpeed = string.sub(msg,7)
end
end

elseif string.sub(string.lower(msg),1,8) == "explode/" then
for _,v in pairs(game.Players:GetChildren()) do
if v.Name:lower():match(string.sub(msg:lower(),9)) then
pcall(function()
if v.Character then 
local expl = Instance.new("Explosion",v.Character)
expl.BlastRadius = 6
expl.Name = "Blame John"
expl.Position = v.Character.Torso.Position
end
end) 
end
end

elseif string.sub(string.lower(msg),1,8) == "setjump/" then
for _,v in pairs(game.Players:GetChildren()) do
if v.Name:lower():match(string.sub(msg:lower(),9)) then
pcall(function()
if v.Character then 
for _,v in pairs(v.Character:GetChildren()) do
if v.ClassName == "BodyVelocity" then
v:Destroy()
local expl = Instance.new("BodyVelocity",v.Character.Torso)
expl.maxForce = Vector3.new(4000,string.sub(msg,9),40000)
expl.Velocity = Vector3.new(0,-90,0)
expl.Name = "OMG JUMP"
end
end
end
end)
end
end

elseif string.lower(msg) == "listcommands" then
local omgmes = Instance.new("Message",p.PlayerGui)
omgmes.Name = "list of commands"
omgmes.Text = "mes/, tp/, tpp/, tph/, kill/, sethome, home, delhome ,heal/, charid/, speed/, explode/, setjump/, gc/, respawn/, clean/"
wait(math.random(5,6))
omgmes:Destroy()

elseif string.sub(string.lower(msg),1,3) == "gc/" then
for _,v in pairs(game.Players:GetChildren()) do
if v.Name:lower():match(string.sub(msg:lower(),4)) then
pcall(function()
v.Character = nil
end)
end
end

elseif string.sub(string.lower(msg),1,3) == "respawn/" then
for _,v in pairs(game.Players:GetChildren()) do
if v.Name:lower():match(string.sub(msg:lower(),4)) then
pcall(function()
local M = Instance.new("Model",Workspace)
local Part = Instance.new("Part",M)
Part.Transparency = 1
Part.CanCollide = false
Part.Anchored = true
Part.Name = "Torso"
Part.Position = Vector3.new(9000,9000,9000)
local Human = Instance.new("Humanoid",M)
Human.Torso = Part
Human.Parent = M
v.Character = M
end)
end
end

elseif string.sub(string.lower(msg),1,6) == "clean/" then
workspace = game.Workspace:GetChildren()
for i = 1,#workspace do
if workspace[i].ClassName == string.sub(msg,7) then 
workspace[i]:Remove()
end
end


end


end)
end
end)

game:GetService("Players").PlayerAdded:connect(function(p)
if checkIfNoob(p.Name) then
p:Destroy()
end
end)