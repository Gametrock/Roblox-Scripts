--Auto Pickup for https://www.roblox.com/games/6147702473/Legendary-Bizarre-Adventures

--Save the player in a variable
local player = game:GetService("Players").LocalPlayer
repeat task.wait() until player.Character

--Function to execute when an object is added to Workspace
function ChildAdded(child)
    if child.ClassName == "Tool" then
        local oldCFrame = player.Character:WaitForChild("HumanoidRootPart").CFrame
        player.Character:SetPrimaryPartCFrame(child:WaitForChild("Handle").CFrame)
        repeat player.Character:SetPrimaryPartCFrame(child.Handle.CFrame) task.wait() until child.Parent == player.Character
        player.Character:SetPrimaryPartCFrame(oldCFrame)
    end
end

--Check if there are already any tools so we can pick up them
for _,v in pairs(game.Workspace:GetChildren()) do
    ChildAdded(v)    
end

--When a child is added to Workspace, pass it to the ChildAdded function
game.Workspace.ChildAdded:Connect(ChildAdded)
