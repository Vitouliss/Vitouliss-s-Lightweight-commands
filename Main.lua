--[[

Vitouliss's Lightweight Commands...

Randomly updated Randomly. 

No version....It just get's updated without you knowing.

--]]

local banned = {}
local admins = {"Player","Vitouliss14","Vitouliss","NB3"}
local commands = {"mes/","hi/","tp/","tph/","tpp/","kill/","sethome/","home/","delhome/","heal/",
"charid/","speed/","explode/","setjump/","listcommands","gc/","respawn/","clean/","cleanall/",
"loadchar/"}

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

elseif string.sub(string.lower(msg),1,4) == "hi/" then
local omgmes = Instance.new("Hint",world)
omgmes.Name = "AdminCommandHint"
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

elseif string.sub(string.lower(msg),1,8) == "sethome/" then
--[[
for a,b in pairs(world:GetChildren()) do
if b.Name == p.Name.."Home" then 
b:Destroy()
--]]
plyHome = Instance.new("Part",p.Character)
plyHome.Anchored = true
plyHome.Name = string.sub(msg,9)
plyHome.Locked = true
plyHome.Transparency = 1
plyHome.CanCollide = false 
plyHome.Position = p.Character.Torso.Position
print(p.Name.." Setted his/her home.")
--end
--end 


elseif string.sub(string.lower(msg),1,5) == "home/" then
pcall(function()
for _,e in pairs(p.Character:GetChildren()) do 
if e.Name == string.sub(msg,6) then 
p.Character:MoveTo(e.Position)
end
end
end) 

elseif string.sub(string.lower(msg),1,8) == "delhome/" then
pcall(function()
for _,e in pairs(p.Character:GetChildren()) do 
if e.Name == string.sub(msg,9) then 
e:Destroy()
end
end
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
for _,v in pairs(p.Character.Torso:GetChildren()) do
if v.ClassName == "BodyVelocity" then
v:Destroy()
else 

local expl = Instance.new("BodyVelocity",p.Character.Torso)
local yesdothis = tonumber(string.sub(msg,9))
expl.maxForce = Vector3.new(4000,yesdothis,40000)
expl.velocity = Vector3.new(0,-90,0)
expl.Name = "OMG JUMP"
end
end 

elseif string.lower(msg) == "listcommands" then
local omgmes = Instance.new("Message",p.PlayerGui)
omgmes.Name = "list of commands"
for a,b in pairs(commands) do
omgmes.Text = b
end 
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
pcall(function()
workspace = game.Workspace:GetChildren()
for i = 1,#workspace do
if workspace[i].ClassName == string.sub(msg,7) then 
workspace[i]:Destroy()
end
end
end)

elseif string.sub(string.lower(msg),1,9) == "cleanall/" then
pcall(function()
local hur = game:GetChildren()
for b = 1,#hur do
if hur[b].ClassName == string.sub(msg,10) then 
hur[b]:Destroy()
end
end
end)

--The only piece of clean code here. 
elseif string.sub(string.lower(msg),1,9) == "loadchar/" then
  for _,b in pairs(game:GetService("Players"):GetChildren()) do
		if b.Name:lower():match(string.sub(msg:lower(),10)) then
			b:LoadCharacter(true)
		end
	end
end
-- End of piece of clean code: status = ""

end)
end
end)

game:GetService("Players").PlayerAdded:connect(function(p)
if checkIfNoob(p.Name) then
p:Destroy()
end
end) 