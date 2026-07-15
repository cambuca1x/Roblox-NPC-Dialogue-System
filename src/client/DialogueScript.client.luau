local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = game.Players.LocalPlayer
local npc = game.Workspace:WaitForChild("DraguysssOnYT")

local npcGui = npc:WaitForChild("Head"):WaitForChild("gui")
local prompt = npc:WaitForChild("ProximityPrompt")

local responsesGui = player.PlayerGui:WaitForChild("Dialogue"):WaitForChild("DialogueResponses")

local responseButton = responsesGui:WaitForChild("imgButton")
local responseButton2 = responsesGui:WaitForChild("imgButton2")

local function typeText(textLabel, message)
    
    textLabel.Text = ""
    local sound = ReplicatedStorage:WaitForChild("TypeSound")

    for i = 1, #message do
        textLabel.Text = string.sub(message, 1, i)
        sound:Play()
        task.wait(0.025)
    end
end

prompt.Triggered:Connect(function()
    prompt.Enabled = false
    npcGui.Dialogue.Visible = true

    typeText(npcGui.Dialogue,  "I need your help! These bandits are terrorizing the town! Can you help me?")

    task.wait(0.5)

    responseButton.text.Text = "Of course!"
    responseButton.Visible = true 

    responseButton2.text.Text = "Hell nah bruh"
    responseButton2.Visible = true
end)

responseButton.Activated:Connect(function()
    typeText(npcGui.Dialogue,  "Great! Go defeat 4 of them and come back to me, I will reward you!")
    responseButton.Visible = false
    responseButton2.Visible = false

    task.wait(2)

    npcGui.Dialogue.Visible = false
    prompt.Enabled = true
end)

responseButton2.Activated:Connect(function()
    typeText(npcGui.Dialogue, "Wow... Aren't you kind...")
    responseButton2.Visible = false
    responseButton.Visible = false

    task.wait(2)

    npcGui.Dialogue.Visible = false
    prompt.Enabled = true
end)