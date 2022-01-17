--Auto Pickup for https://www.roblox.com/games/6147702473/Legendary-Bizarre-Adventures

--Save the player in a variable
local player = game:GetService("Players").LocalPlayer

--Stops the script from glitching out if many items spawns at the exact same time
local db = false

--Function to execute when an object is added to Workspace
function ChildAdded(child)
    if child.ClassName == "Tool" then
        if db then repeat task.wait() until db == false end
        db = true
        local oldCFrame = player.Character:WaitForChild("HumanoidRootPart").CFrame
        player.Character:SetPrimaryPartCFrame(child:WaitForChild("Handle").CFrame)
        repeat player.Character:SetPrimaryPartCFrame(child.Handle.CFrame) task.wait() until child.Parent == player.Character
        player.Character:SetPrimaryPartCFrame(oldCFrame)
        db = false
    end
end

--Check if there are already any tools so we can pick up them
for _,v in pairs(game.Workspace:GetChildren()) do
    ChildAdded(v)    
end

--When a child is added to Workspace, pass it to the ChildAdded function
game.Workspace.ChildAdded:Connect(ChildAdded)
