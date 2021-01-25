local guiList = { }
function guiList.infoGui()
  local HelpGui = Instance.new("ScreenGui")
  local BackgroundFrame = Instance.new("Frame")
  local Toppart = Instance.new("Frame")
  local CloseButton = Instance.new("TextButton")
  local UICorner = Instance.new("UICorner")
  local ImageLabel = Instance.new("ImageLabel")
  local UICorner_2 = Instance.new("UICorner")
  local TextLabel = Instance.new("TextLabel")
  local UICorner_3 = Instance.new("UICorner")
  local UICorner_4 = Instance.new("UICorner")
  local ScrollingFrame = Instance.new("ScrollingFrame")
  local TextLabel_2 = Instance.new("TextLabel")
  local TextLabel_3 = Instance.new("TextLabel")
  local TextLabel_4 = Instance.new("TextLabel")
  local TextLabel_5 = Instance.new("TextLabel")
  local TextLabel_6 = Instance.new("TextLabel")
  local UIListLayout = Instance.new("UIListLayout")
  local TextLabel_7 = Instance.new("TextLabel")
  local TextLabel_8 = Instance.new("TextLabel")
  local TextLabel_9 = Instance.new("TextLabel")
  local TextLabel_10 = Instance.new("TextLabel")
  local TextLabel_11 = Instance.new("TextLabel")
  local TextLabel_12 = Instance.new("TextLabel")
  local TextLabel_13 = Instance.new("TextLabel")
  local TextLabel_14 = Instance.new("TextLabel")
  local TextLabel_15 = Instance.new("TextLabel")
  local TextLabel_16 = Instance.new("TextLabel")
  local TextLabel_17 = Instance.new("TextLabel")
  local TextLabel_18 = Instance.new("TextLabel")
  local TextLabel_19 = Instance.new("TextLabel")
  local TextLabel_20 = Instance.new("TextLabel")
  local TextLabel_21 = Instance.new("TextLabel")
  local TextLabel_22 = Instance.new("TextLabel")
  local TextLabel_23 = Instance.new("TextLabel")
  local TextLabel_24 = Instance.new("TextLabel")
  local TextLabel_25 = Instance.new("TextLabel")
  
  --Properties:
  
  HelpGui.Name = "HelpGui"
  HelpGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
  HelpGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  
  BackgroundFrame.Name = "BackgroundFrame"
  BackgroundFrame.Parent = HelpGui
  BackgroundFrame.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
  BackgroundFrame.BorderSizePixel = 0
  BackgroundFrame.Position = UDim2.new(0.186979175, 0, 0.699646592, 0)
  BackgroundFrame.Size = UDim2.new(0, 320, 0, 190)
  BackgroundFrame.Active = true
  BackgroundFrame.Draggable = true
  
  Toppart.Name = "Toppart"
  Toppart.Parent = BackgroundFrame
  Toppart.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
  Toppart.BorderSizePixel = 0
  Toppart.Size = UDim2.new(0, 320, 0, 36)
  
  CloseButton.Name = "CloseButton"
  CloseButton.Parent = Toppart
  CloseButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
  CloseButton.BorderSizePixel = 0
  CloseButton.Position = UDim2.new(0.904268026, 0, 0.111485116, 0)
  CloseButton.Size = UDim2.new(0, 24, 0, 25)
  CloseButton.Font = Enum.Font.SourceSans
  CloseButton.Text = "<b>X</b>"
  CloseButton.RichText = true
  CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
  CloseButton.TextSize = 18.000
  CloseButton.TextWrapped = true
  CloseButton.MouseButton1Down:Connect(function()
  	HelpGui:Destroy()
  end)
  
  UICorner.Parent = CloseButton
  
  ImageLabel.Parent = Toppart
  ImageLabel.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
  ImageLabel.BorderSizePixel = 0
  ImageLabel.Position = UDim2.new(0.020366, 0, 0.0687748045, 0)
  ImageLabel.Size = UDim2.new(0, 31, 0, 30)
  ImageLabel.Image = "http://www.roblox.com/asset/?id=6142456413"
  
  UICorner_2.Parent = ImageLabel
  
  TextLabel.Parent = Toppart
  TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel.BackgroundTransparency = 1.000
  TextLabel.Position = UDim2.new(0.137654498, 0, 0.111485109, 0)
  TextLabel.Size = UDim2.new(0, 170, 0, 25)
  TextLabel.Font = Enum.Font.SourceSans
  TextLabel.RichText = true
  TextLabel.Text = "<b>Vestiria Information</b>"
  TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel.TextSize = 18.000
  TextLabel.TextXAlignment = Enum.TextXAlignment.Left
  
  UICorner_3.Parent = Toppart
  
  UICorner_4.Parent = BackgroundFrame
  
  ScrollingFrame.Parent = BackgroundFrame
  ScrollingFrame.Active = true
  ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  ScrollingFrame.BackgroundTransparency = 1.020
  ScrollingFrame.BorderSizePixel = 0
  ScrollingFrame.Position = UDim2.new(0, 0, 0.236842111, 0)
  ScrollingFrame.Size = UDim2.new(0, 320, 0, 145)
  ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2.0999999, 0)
  
  TextLabel_2.Parent = ScrollingFrame
  TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_2.BackgroundTransparency = 1.000
  TextLabel_2.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_2.Font = Enum.Font.SourceSans
  TextLabel_2.RichText = true
  TextLabel_2.Text = "<b>Player Cases:</b>"
  TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_2.TextSize = 18.000
  TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_2.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_3.Parent = ScrollingFrame
  TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_3.BackgroundTransparency = 1.000
  TextLabel_3.Position = UDim2.new(0, 0, 0.042105265, 0)
  TextLabel_3.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_3.Font = Enum.Font.SourceSans
  TextLabel_3.Text = "    ~ all - Returns everyone"
  TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_3.TextSize = 18.000
  TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_3.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_4.Parent = ScrollingFrame
  TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_4.BackgroundTransparency = 1.000
  TextLabel_4.Position = UDim2.new(0, 0, 0.0842105299, 0)
  TextLabel_4.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_4.Font = Enum.Font.SourceSans
  TextLabel_4.Text = "    ~ others - Returns everyone but you"
  TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_4.TextSize = 18.000
  TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_4.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_5.Parent = ScrollingFrame
  TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_5.BackgroundTransparency = 1.000
  TextLabel_5.Position = UDim2.new(0, 0, 0.126315802, 0)
  TextLabel_5.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_5.Font = Enum.Font.SourceSans
  TextLabel_5.Text = "    ~ me - Returns you"
  TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_5.TextSize = 18.000
  TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_5.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_6.Parent = ScrollingFrame
  TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_6.BackgroundTransparency = 1.000
  TextLabel_6.Position = UDim2.new(0, 0, 0.16842106, 0)
  TextLabel_6.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_6.Font = Enum.Font.SourceSans
  TextLabel_6.Text = "    ~ g - Returns guards"
  TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_6.TextSize = 18.000
  TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_6.TextYAlignment = Enum.TextYAlignment.Bottom
  
  UIListLayout.Parent = ScrollingFrame
  UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
  
  TextLabel_7.Parent = ScrollingFrame
  TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_7.BackgroundTransparency = 1.000
  TextLabel_7.Position = UDim2.new(0, 0, 0.16842106, 0)
  TextLabel_7.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_7.Font = Enum.Font.SourceSans
  TextLabel_7.Text = "    ~ i - Returns Inmates"
  TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_7.TextSize = 18.000
  TextLabel_7.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_7.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_8.Parent = ScrollingFrame
  TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_8.BackgroundTransparency = 1.000
  TextLabel_8.Position = UDim2.new(0, 0, 0.16842106, 0)
  TextLabel_8.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_8.Font = Enum.Font.SourceSans
  TextLabel_8.Text = "    ~ c - Returns Criminals"
  TextLabel_8.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_8.TextSize = 18.000
  TextLabel_8.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_8.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_9.Parent = ScrollingFrame
  TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_9.BackgroundTransparency = 1.000
  TextLabel_9.Position = UDim2.new(0, 0, 0.16842106, 0)
  TextLabel_9.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_9.Font = Enum.Font.SourceSans
  TextLabel_9.Text = "    ~ n - Returns neutral"
  TextLabel_9.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_9.TextSize = 18.000
  TextLabel_9.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_9.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_10.Parent = ScrollingFrame
  TextLabel_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_10.BackgroundTransparency = 1.000
  TextLabel_10.Position = UDim2.new(0, 0, 0.16842106, 0)
  TextLabel_10.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_10.Font = Enum.Font.SourceSans
  TextLabel_10.Text = "    ~ shield - Returns people with a shield"
  TextLabel_10.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_10.TextSize = 18.000
  TextLabel_10.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_10.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_11.Parent = ScrollingFrame
  TextLabel_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_11.BackgroundTransparency = 1.000
  TextLabel_11.Position = UDim2.new(0, 0, 0.16842106, 0)
  TextLabel_11.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_11.Font = Enum.Font.SourceSans
  TextLabel_11.Text = "    ~ armor - Returns people with armor"
  TextLabel_11.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_11.TextSize = 18.000
  TextLabel_11.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_11.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_12.Parent = ScrollingFrame
  TextLabel_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_12.BackgroundTransparency = 1.000
  TextLabel_12.Position = UDim2.new(0, 0, 0.16842106, 0)
  TextLabel_12.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_12.Font = Enum.Font.SourceSans
  TextLabel_12.Text = "    ~ guns - Returns players with guns"
  TextLabel_12.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_12.TextSize = 18.000
  TextLabel_12.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_12.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_13.Parent = ScrollingFrame
  TextLabel_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_13.BackgroundTransparency = 1.000
  TextLabel_13.Position = UDim2.new(0, 0, 0.16842106, 0)
  TextLabel_13.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_13.Font = Enum.Font.SourceSans
  TextLabel_13.Text = "    ~ ct - Returns players with a custom team color"
  TextLabel_13.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_13.TextSize = 18.000
  TextLabel_13.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_13.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_14.Parent = ScrollingFrame
  TextLabel_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_14.BackgroundTransparency = 1.000
  TextLabel_14.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_14.Font = Enum.Font.SourceSans
  TextLabel_14.RichText = true
  TextLabel_14.Text = "<b>Special Arguments:</b>"
  TextLabel_14.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_14.TextSize = 18.000
  TextLabel_14.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_14.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_15.Parent = ScrollingFrame
  TextLabel_15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_15.BackgroundTransparency = 1.000
  TextLabel_15.Position = UDim2.new(0, 0, 0.16842106, 0)
  TextLabel_15.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_15.Font = Enum.Font.SourceSans
  TextLabel_15.Text = "    ~ user <plr> - Returns a player"
  TextLabel_15.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_15.TextSize = 18.000
  TextLabel_15.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_15.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_16.Parent = ScrollingFrame
  TextLabel_16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_16.BackgroundTransparency = 1.000
  TextLabel_16.Position = UDim2.new(0, 0, 0.16842106, 0)
  TextLabel_16.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_16.Font = Enum.Font.SourceSans
  TextLabel_16.RichText = true
  TextLabel_16.Text = "<b>Usage:</b> .t user transfixions / .tp user sin"
  TextLabel_16.TextColor3 = Color3.fromRGB(176, 176, 176)
  TextLabel_16.TextSize = 18.000
  TextLabel_16.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_16.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_17.Parent = ScrollingFrame
  TextLabel_17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_17.BackgroundTransparency = 1.000
  TextLabel_17.Position = UDim2.new(0, 0, 0.16842106, 0)
  TextLabel_17.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_17.Font = Enum.Font.SourceSans
  TextLabel_17.Text = "    ~ preset <name> - Uses a specific preset"
  TextLabel_17.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_17.TextSize = 18.000
  TextLabel_17.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_17.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_18.Parent = ScrollingFrame
  TextLabel_18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_18.BackgroundTransparency = 1.000
  TextLabel_18.Position = UDim2.new(0, 0, 0.16842106, 0)
  TextLabel_18.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_18.Font = Enum.Font.SourceSans
  TextLabel_18.RichText = true
  TextLabel_18.Text = "<b>Usage:</b> .t preset rblue"
  TextLabel_18.TextColor3 = Color3.fromRGB(176, 176, 176)
  TextLabel_18.TextSize = 18.000
  TextLabel_18.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_18.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_19.Parent = ScrollingFrame
  TextLabel_19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_19.BackgroundTransparency = 1.000
  TextLabel_19.Position = UDim2.new(0, 0, 0.16842106, 0)
  TextLabel_19.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_19.Font = Enum.Font.SourceSans
  TextLabel_19.Text = "    ~ rgb <code> - Uses an rgb code"
  TextLabel_19.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_19.TextSize = 18.000
  TextLabel_19.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_19.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_20.Parent = ScrollingFrame
  TextLabel_20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_20.BackgroundTransparency = 1.000
  TextLabel_20.Position = UDim2.new(0, 0, 0.16842106, 0)
  TextLabel_20.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_20.Font = Enum.Font.SourceSans
  TextLabel_20.RichText = true
  TextLabel_20.Text = "<b>Usage:</b> .t rgb 255,255,255"
  TextLabel_20.TextColor3 = Color3.fromRGB(176, 176, 176)
  TextLabel_20.TextSize = 18.000
  TextLabel_20.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_20.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_21.Parent = ScrollingFrame
  TextLabel_21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_21.BackgroundTransparency = 1.000
  TextLabel_21.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_21.Font = Enum.Font.SourceSans
  TextLabel_21.RichText = true
  TextLabel_21.Text = "<b>Joining Commands:</b>"
  TextLabel_21.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_21.TextSize = 18.000
  TextLabel_21.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_21.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_22.Parent = ScrollingFrame
  TextLabel_22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_22.BackgroundTransparency = 1.000
  TextLabel_22.Position = UDim2.new(0, 0, 0.170927331, 0)
  TextLabel_22.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_22.Font = Enum.Font.SourceSans
  TextLabel_22.Text = "    ~ \"\\\" - Join 2 or more commands together"
  TextLabel_22.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_22.TextSize = 18.000
  TextLabel_22.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_22.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_23.Parent = ScrollingFrame
  TextLabel_23.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_23.BackgroundTransparency = 1.000
  TextLabel_23.Position = UDim2.new(0, 0, 0.170927331, 0)
  TextLabel_23.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_23.Font = Enum.Font.SourceSans
  TextLabel_23.RichText = true
  TextLabel_23.Text = "<b>Usage:</b> .t i\tp back"
  TextLabel_23.TextColor3 = Color3.fromRGB(176, 176, 176)
  TextLabel_23.TextSize = 18.000
  TextLabel_23.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_23.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_24.Parent = ScrollingFrame
  TextLabel_24.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_24.BackgroundTransparency = 1.000
  TextLabel_24.Position = UDim2.new(0, 0, 0.170927331, 0)
  TextLabel_24.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_24.Font = Enum.Font.SourceSans
  TextLabel_24.Text = "    ~ \",\" - Join 2 or more args together"
  TextLabel_24.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_24.TextSize = 18.000
  TextLabel_24.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_24.TextYAlignment = Enum.TextYAlignment.Bottom
  
  TextLabel_25.Parent = ScrollingFrame
  TextLabel_25.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel_25.BackgroundTransparency = 1.000
  TextLabel_25.Position = UDim2.new(0, 0, 0.170927331, 0)
  TextLabel_25.Size = UDim2.new(0, 300, 0, 16)
  TextLabel_25.Font = Enum.Font.SourceSans
  TextLabel_25.RichText = true
  TextLabel_25.Text = "<b>Usage:</b> .kill sinister,annoyed"
  TextLabel_25.TextColor3 = Color3.fromRGB(176, 176, 176)
  TextLabel_25.TextSize = 18.000
  TextLabel_25.TextXAlignment = Enum.TextXAlignment.Left
  TextLabel_25.TextYAlignment = Enum.TextYAlignment.Bottom
end

function guiList.colorGui()
  local LoadCharEvent = game.workspace.Remote.loadchar
local Player = game:GetService("Players").LocalPlayer
local Camera = game.workspace.CurrentCamera
function customColor(colorCode)
  local pos = Player.Character.HumanoidRootPart.CFrame
  local cpos = Camera.CFrame
  LoadCharEvent:InvokeServer("", colorCode)
  wait() Player.Character.HumanoidRootPart.CFrame = pos; Camera.CFrame = cpos
end
local ColorGui = Instance.new("ScreenGui")
local BackgroundFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Topframe = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local UICorner_3 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local ColorPallete = Instance.new("Frame")
local SelectionFrame = Instance.new("Frame")
local SelectedColor = Instance.new("TextLabel")
local ChangeButton = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")

--Properties:

ColorGui.Name = "ColorGui"
ColorGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ColorGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

BackgroundFrame.Name = "BackgroundFrame"
BackgroundFrame.Parent = ColorGui
BackgroundFrame.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
BackgroundFrame.Position = UDim2.new(0.00833333377, 0, 0.0930506513, 0)
BackgroundFrame.Size = UDim2.new(0, 200, 0, 320)
BackgroundFrame.Active = true
BackgroundFrame.Draggable = true

UICorner.Parent = BackgroundFrame

Topframe.Name = "Topframe"
Topframe.Parent = BackgroundFrame
Topframe.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Topframe.BorderSizePixel = 0
Topframe.Position = UDim2.new(0, 0, -9.30786118e-05, 0)
Topframe.Size = UDim2.new(0, 200, 0, 36)

ImageLabel.Parent = Topframe
ImageLabel.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.0266889632, 0, 0.0722222254, 0)
ImageLabel.Size = UDim2.new(0, 30, 0, 30)
ImageLabel.Image = "http://www.roblox.com/asset/?id=6142456413"

UICorner_2.Parent = ImageLabel

UICorner_3.Parent = Topframe

TextLabel.Parent = Topframe
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.217699125, 0, 0.138019145, 0)
TextLabel.Size = UDim2.new(0, 122, 0, 25)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.RichText = true
TextLabel.Text = "<b>Vestiria Color Gui</b>"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 18.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

CloseButton.Name = "CloseButton"
CloseButton.Parent = Topframe
CloseButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0.850101292, 0, 0.137953639, 0)
CloseButton.Size = UDim2.new(0, 24, 0, 25)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.RichText = true
CloseButton.Text = "<b>X</b>"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18.000
CloseButton.TextWrapped = true
CloseButton.MouseButton1Down:Connect(function()
    ColorGui:Destroy()
end)

UICorner_4.Parent = CloseButton

ColorPallete.Name = "ColorPallete"
ColorPallete.Parent = BackgroundFrame
ColorPallete.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ColorPallete.BackgroundTransparency = 1.000
ColorPallete.Position = UDim2.new(0, 0, 0.134375006, 0)
ColorPallete.Size = UDim2.new(0, 200, 0, 215)

SelectionFrame.Name = "SelectionFrame"
SelectionFrame.Parent = BackgroundFrame
SelectionFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
SelectionFrame.BackgroundTransparency = 1.000
SelectionFrame.Position = UDim2.new(0, 0, 0.824999988, 0)
SelectionFrame.Size = UDim2.new(0, 200, 0, 56)

SelectedColor.Name = "SelectedColor"
SelectedColor.Parent = SelectionFrame
SelectedColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SelectedColor.BackgroundTransparency = 1.000
SelectedColor.Position = UDim2.new(0.00499999896, 0, 0.0535714291, 0)
SelectedColor.Size = UDim2.new(0, 190, 0, 25)
SelectedColor.Font = Enum.Font.SourceSans
SelectedColor.RichText = true
SelectedColor.Text = "<b>Selected Color:</b> Really black"
SelectedColor.TextWrapped = true
SelectedColor.TextColor3 = Color3.fromRGB(255, 255, 255)
SelectedColor.TextSize = 16.000
SelectedColor.TextXAlignment = Enum.TextXAlignment.Left
SelectedColor.TextYAlignment = Enum.TextYAlignment.Top

ChangeButton.Name = "ChangeButton"
ChangeButton.Parent = SelectionFrame
ChangeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ChangeButton.BorderSizePixel = 0
ChangeButton.Position = UDim2.new(0.0899998397, 0, 0.607142866, 0)
ChangeButton.Size = UDim2.new(0, 166, 0, 15)
ChangeButton.Font = Enum.Font.SourceSans
ChangeButton.Text = "Change Color"
ChangeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ChangeButton.TextScaled = true
ChangeButton.TextSize = 14.000
ChangeButton.TextWrapped = true
ChangeButton.MouseButton1Down:Connect(function()
  customColor(_G.ColorSelected)
end)

UICorner_5.Parent = ChangeButton

local ColorPalette128 = {
  BrickColor.new(Color3.new(39/255, 70/255, 45/255)),
  BrickColor.new(Color3.new(80/255, 109/255, 84/255)),
  BrickColor.new(Color3.new(0/255, 143/255, 156/255)),
  BrickColor.new(Color3.new(27/255, 42/255, 53/255)),
  BrickColor.new(Color3.new(33/255, 84/255, 185/255)),
  BrickColor.new(Color3.new(0/255, 16/255, 176/255)),
  BrickColor.new(Color3.new(0/255, 32/255, 96/255)),
  BrickColor.new(Color3.new(44/255, 101/255, 29/255)),
  BrickColor.new(Color3.new(40/255, 127/255, 71/255)),
  BrickColor.new(Color3.new(18/255, 238/255, 212/255)),
  BrickColor.new(Color3.new(91/255, 93/255, 105/255)),
  BrickColor.new(Color3.new(82/255, 124/255, 174/255)),
  BrickColor.new(Color3.new(51/255, 88/255, 130/255)),
  BrickColor.new(Color3.new(16/255, 42/255, 220/255)),
  BrickColor.new(Color3.new(61/255, 21/255, 133/255)),
  BrickColor.new(Color3.new(58/255, 125/255, 21/255)),
  BrickColor.new(Color3.new(52/255, 142/255, 64/255)),
  BrickColor.new(Color3.new(91/255, 154/255, 76/255)),
  BrickColor.new(Color3.new(0/255, 255/255, 255/255)),
  BrickColor.new(Color3.new(116/255, 134/255, 157/255)),
  BrickColor.new(Color3.new(110/255, 153/255, 202/255)),
  BrickColor.new(Color3.new(13/255, 105/255, 172/255)),
  BrickColor.new(Color3.new(0/255, 0/255, 255/255)),
  BrickColor.new(Color3.new(89/255, 34/255, 89/255)),
  BrickColor.new(Color3.new(31/255, 128/255, 29/255)),
  BrickColor.new(Color3.new(75/255, 151/255, 75/255)),
  BrickColor.new(Color3.new(127/255, 142/255, 100/255)),
  BrickColor.new(Color3.new(0/255, 255/255, 0/255)),
  BrickColor.new(Color3.new(159/255, 243/255, 233/255)),
  BrickColor.new(Color3.new(159/255, 161/255, 172/255)),
  BrickColor.new(Color3.new(9/255, 137/255, 207/255)),
  BrickColor.new(Color3.new(140/255, 91/255, 159/255)),
  BrickColor.new(Color3.new(98/255, 37/255, 209/255)),
  BrickColor.new(Color3.new(123/255, 0/255, 123/255)),
  BrickColor.new(Color3.new(120/255, 144/255, 130/255)),
  BrickColor.new(Color3.new(124/255, 156/255, 107/255)),
  BrickColor.new(Color3.new(138/255, 171/255, 133/255)),
  BrickColor.new(Color3.new(185/255, 196/255, 177/255)),
  BrickColor.new(Color3.new(175/255, 221/255, 255/255)),
  BrickColor.new(Color3.new(159/255, 173/255, 192/255)),
  BrickColor.new(Color3.new(4/255, 175/255, 236/255)),
  BrickColor.new(Color3.new(180/255, 128/255, 255/255)),
  BrickColor.new(Color3.new(167/255, 94/255, 155/255)),
  BrickColor.new(Color3.new(123/255, 47/255, 123/255)),
  BrickColor.new(Color3.new(107/255, 50/255, 124/255)),
  BrickColor.new(Color3.new(193/255, 190/255, 66/255)),
  BrickColor.new(Color3.new(164/255, 189/255, 71/255)),
  BrickColor.new(Color3.new(148/255, 190/255, 129/255)),
  BrickColor.new(Color3.new(168/255, 189/255, 153/255)),
  BrickColor.new(Color3.new(223/255, 223/255, 222/255)),
  BrickColor.new(Color3.new(202/255, 203/255, 209/255)),
  BrickColor.new(Color3.new(128/255, 187/255, 219/255)),
  BrickColor.new(Color3.new(177/255, 167/255, 255/255)),
  BrickColor.new(Color3.new(255/255, 102/255, 204/255)),
  BrickColor.new(Color3.new(255/255, 0/255, 191/255)),
  BrickColor.new(Color3.new(170/255, 0/255, 170/255)),
  BrickColor.new(Color3.new(151/255, 0/255, 0/255)),
  BrickColor.new(Color3.new(255/255, 175/255, 0/255)),
  BrickColor.new(Color3.new(255/255, 255/255, 0/255)),
  BrickColor.new(Color3.new(161/255, 196/255, 140/255)),
  BrickColor.new(Color3.new(177/255, 229/255, 166/255)),
  BrickColor.new(Color3.new(204/255, 255/255, 204/255)),
  BrickColor.new(Color3.new(229/255, 228/255, 223/255)),
  BrickColor.new(Color3.new(180/255, 210/255, 228/255)),
  BrickColor.new(Color3.new(152/255, 194/255, 219/255)),
  BrickColor.new(Color3.new(255/255, 152/255, 220/255)),
  BrickColor.new(Color3.new(255/255, 89/255, 89/255)),
  BrickColor.new(Color3.new(255/255, 0/255, 0/255)),
  BrickColor.new(Color3.new(196/255, 40/255, 28/255)),
  BrickColor.new(Color3.new(117/255, 0/255, 0/255)),
  BrickColor.new(Color3.new(239/255, 184/255, 56/255)),
  BrickColor.new(Color3.new(245/255, 205/255, 48/255)),
  BrickColor.new(Color3.new(248/255, 217/255, 109/255)),
  BrickColor.new(Color3.new(253/255, 234/255, 141/255)),
  BrickColor.new(Color3.new(255/255, 255/255, 204/255)),
  BrickColor.new(Color3.new(231/255, 231/255, 236/255)),
  BrickColor.new(Color3.new(199/255, 212/255, 228/255)),
  BrickColor.new(Color3.new(224/255, 178/255, 208/255)),
  BrickColor.new(Color3.new(212/255, 144/255, 189/255)),
  BrickColor.new(Color3.new(190/255, 104/255, 98/255)),
  BrickColor.new(Color3.new(163/255, 75/255, 75/255)),
  BrickColor.new(Color3.new(86/255, 36/255, 36/255)),
  BrickColor.new(Color3.new(213/255, 115/255, 61/255)),
  BrickColor.new(Color3.new(218/255, 133/255, 65/255)),
  BrickColor.new(Color3.new(241/255, 231/255, 199/255)),
  BrickColor.new(Color3.new(254/255, 243/255, 187/255)),
  BrickColor.new(Color3.new(248/255, 248/255, 248/255)),
  BrickColor.new(Color3.new(242/255, 243/255, 243/255)),
  BrickColor.new(Color3.new(232/255, 186/255, 200/255)),
  BrickColor.new(Color3.new(255/255, 201/255, 201/255)),
  BrickColor.new(Color3.new(255/255, 148/255, 148/255)),
  BrickColor.new(Color3.new(150/255, 85/255, 85/255)),
  BrickColor.new(Color3.new(143/255, 76/255, 42/255)),
  BrickColor.new(Color3.new(170/255, 85/255, 0/255)),
  BrickColor.new(Color3.new(226/255, 155/255, 64/255)),
  BrickColor.new(Color3.new(211/255, 190/255, 150/255)),
  BrickColor.new(Color3.new(226/255, 220/255, 188/255)),
  BrickColor.new(Color3.new(237/255, 234/255, 234/255)),
  BrickColor.new(Color3.new(233/255, 218/255, 218/255)),
  BrickColor.new(Color3.new(255/255, 204/255, 153/255)),
  BrickColor.new(Color3.new(234/255, 184/255, 146/255)),
  BrickColor.new(Color3.new(218/255, 134/255, 122/255)),
  BrickColor.new(Color3.new(136/255, 62/255, 62/255)),
  BrickColor.new(Color3.new(105/255, 64/255, 40/255)),
  BrickColor.new(Color3.new(188/255, 155/255, 93/255)),
  BrickColor.new(Color3.new(199/255, 172/255, 120/255)),
  BrickColor.new(Color3.new(202/255, 191/255, 163/255)),
  BrickColor.new(Color3.new(187/255, 179/255, 178/255)),
  BrickColor.new(Color3.new(205/255, 205/255, 205/255)),
  BrickColor.new(Color3.new(215/255, 197/255, 154/255)),
  BrickColor.new(Color3.new(204/255, 142/255, 105/255)),
  BrickColor.new(Color3.new(124/255, 92/255, 70/255)),
  BrickColor.new(Color3.new(108/255, 88/255, 75/255)),
  BrickColor.new(Color3.new(160/255, 132/255, 79/255)),
  BrickColor.new(Color3.new(149/255, 121/255, 119/255)),
  BrickColor.new(Color3.new(149/255, 137/255, 136/255)),
  BrickColor.new(Color3.new(171/255, 168/255, 158/255)),
  BrickColor.new(Color3.new(175/255, 148/255, 131/255)),
  BrickColor.new(Color3.new(150/255, 103/255, 102/255)),
  BrickColor.new(Color3.new(160/255, 95/255, 53/255)),
  BrickColor.new(Color3.new(86/255, 66/255, 54/255)),
  BrickColor.new(Color3.new(126/255, 104/255, 63/255)),
  BrickColor.new(Color3.new(99/255, 95/255, 98/255)),
  BrickColor.new(Color3.new(163/255, 162/255, 165/255)),
  BrickColor.new(Color3.new(105/255, 102/255, 92/255)),
  BrickColor.new(Color3.new(90/255, 76/255, 66/255)),
  BrickColor.new(Color3.new(106/255, 57/255, 9/255)),
  BrickColor.new(Color3.new(17/255, 17/255, 17/255)),
  BrickColor.new(Color3.new(99/255, 95/255, 98/255)),
  BrickColor.new(Color3.new(163/255, 162/255, 165/255)),
  BrickColor.new(Color3.new(205/255, 205/255, 205/255)),
  BrickColor.new(Color3.new(223/255, 223/255, 222/255)),
  BrickColor.new(Color3.new(237/255, 234/255, 234/255)),
  BrickColor.new(Color3.new(27/255, 42/255, 53/255)),
  BrickColor.new(Color3.new(91/255, 93/255, 105/255)),
  BrickColor.new(Color3.new(159/255, 161/255, 172/255)),
  BrickColor.new(Color3.new(202/255, 203/255, 209/255)),
  BrickColor.new(Color3.new(231/255, 231/255, 236/255)),
  BrickColor.new(Color3.new(248/255, 248/255, 248/255)),

}
local RatioResize = math.min(ColorPallete.AbsoluteSize.X,ColorPallete.AbsoluteSize.Y)/286

local SizeX,SizeY,BasePosY = 22 * RatioResize,math.ceil(24 * RatioResize),math.ceil(20 * RatioResize)
local ColorUsed = 0


local function CreateSquare(PosX,PosY)
  ColorUsed = ColorUsed + 1
  local Frame = Instance.new("ImageButton")
  Frame.ImageColor3 = ColorPalette128[ColorUsed].Color
  Frame.Size = UDim2.new(0,SizeX - 1,0,SizeY - 1)
  Frame.Position = UDim2.new(0,PosX * SizeX + 1,0,PosY * BasePosY + 1)
  Frame.Image = "rbxassetid://322507428"
  Frame.BackgroundTransparency = 1
  Frame.Parent = ColorPallete
end

local function FrameToPalette128(ColorPallete)


  for i = 3, 9 do
    CreateSquare(i,0)
  end
  for i = 2.5, 9.5 do
    CreateSquare(i,1)
  end
  for i = 2, 10 do
    CreateSquare(i,2)
  end
  for i = 1.5, 10.5 do
    CreateSquare(i,3)
  end
  for i = 1, 11 do
    CreateSquare(i,4)
  end
  for i = 0.5, 11.5 do
    CreateSquare(i,5)
  end
  for i = 0, 12 do
    CreateSquare(i,6)
  end
  for i = 0.5, 11.5 do
    CreateSquare(i,7)
  end
  for i = 1, 11 do
    CreateSquare(i,8)
  end
  for i = 1.5, 10.5 do
    CreateSquare(i,9)
  end
  for i = 2, 10 do
    CreateSquare(i,10)
  end
  for i = 2.5, 9.5 do
    CreateSquare(i,11)
  end
  for i = 3, 9 do
    CreateSquare(i,12)
  end
  for i = 0.5, 11.5 do
    CreateSquare(i,13.5 - 8/20)
  end
end

FrameToPalette128(FrameToPalette128)
wait()
_G.ColorSelected = "Really black"
local path = game:GetService("Players").LocalPlayer.PlayerGui.ColorGui.BackgroundFrame.ColorPallete
for i,v in next, path:GetChildren() do
  v.MouseButton1Down:Connect(function()
    local color = BrickColor.new(v.ImageColor3)
    SelectedColor.Text = "<b>Selected Color:</b> "..color.Name
    _G.ColorSelected = v.ImageColor3
  end)
end
end

function guiList.tpGui()
  local TeleportGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopFrame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local CloseButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local BeInm = Instance.new("TextButton")
local BeCrim = Instance.new("TextButton")
local BeNeu = Instance.new("TextButton")
local BeGuard = Instance.new("TextButton")
local Refresh = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local SpawnButton = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local Nexus = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local Yard = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local Armory = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local Cells = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")
local Back = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")
local Cafe = Instance.new("TextButton")
local UICorner_11 = Instance.new("UICorner")
local Driveway = Instance.new("TextButton")
local UICorner_12 = Instance.new("UICorner")
local Roof = Instance.new("TextButton")
local UICorner_13 = Instance.new("UICorner")
local UICorner_14 = Instance.new("UICorner")

--Properties:

TeleportGui.Name = "TeleportGui"
TeleportGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
TeleportGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = TeleportGui
MainFrame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
MainFrame.Position = UDim2.new(0.00885415077, 0, 0.487632513, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 288)
MainFrame.Active = true
MainFrame.Draggable = true

TopFrame.Name = "TopFrame"
TopFrame.Parent = MainFrame
TopFrame.BackgroundColor3 = Color3.fromRGB(83, 83, 83)
TopFrame.Size = UDim2.new(0, 200, 0, 35)

ImageLabel.Parent = TopFrame
ImageLabel.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.0149999997, 0, 0.057, 0)
ImageLabel.Size = UDim2.new(0, 30, 0, 30)
ImageLabel.Image = "http://www.roblox.com/asset/?id=6142456413"

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ImageLabel

TextLabel.Parent = TopFrame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.189999998, 0, 0.114142939, 0)
TextLabel.Size = UDim2.new(0, 153, 0, 30)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.RichText = true
TextLabel.Text = "<b>Vestiria TpGui</b>"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 16.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

UICorner_2.CornerRadius = UDim.new(0, 10)
UICorner_2.Parent = TopFrame

CloseButton.Name = "CloseButton"
CloseButton.Parent = TopFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0.834268034, 0, 0.140056551, 0)
CloseButton.Size = UDim2.new(0, 24, 0, 25)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.RichText = true
CloseButton.Text = "<b>X</b>"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18.000
CloseButton.TextWrapped = true
CloseButton.MouseButton1Down:Connect(function()
	TeleportGui:Destroy()
end)

UICorner_3.Parent = CloseButton

BeInm.Name = "BeInm"
BeInm.Parent = MainFrame
BeInm.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
BeInm.BorderSizePixel = 0
BeInm.Position = UDim2.new(0.0149999997, 0, 0.140000001, 0)
BeInm.Size = UDim2.new(0, 10, 0, 40)
BeInm.Font = Enum.Font.SourceSans
BeInm.Text = ""
BeInm.TextColor3 = Color3.fromRGB(0, 0, 0)
BeInm.TextSize = 14.000
BeInm.MouseButton1Down:Connect(function()
		_G.execCmd("t inm", game.Players.LocalPlayer)
end)

BeCrim.Name = "BeCrim"
BeCrim.Parent = MainFrame
BeCrim.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
BeCrim.BorderSizePixel = 0
BeCrim.Position = UDim2.new(0.0649999976, 0, 0.140000001, 0)
BeCrim.Size = UDim2.new(0, 10, 0, 40)
BeCrim.Font = Enum.Font.SourceSans
BeCrim.Text = ""
BeCrim.TextColor3 = Color3.fromRGB(0, 0, 0)
BeCrim.TextSize = 14.000
BeCrim.MouseButton1Down:Connect(function()
		_G.execCmd("t crim", game.Players.LocalPlayer)
end)

BeNeu.Name = "BeNeu"
BeNeu.Parent = MainFrame
BeNeu.BackgroundColor3 = Color3.fromRGB(176, 176, 176)
BeNeu.BorderSizePixel = 0
BeNeu.Position = UDim2.new(0.114999995, 0, 0.140000001, 0)
BeNeu.Size = UDim2.new(0, 10, 0, 40)
BeNeu.Font = Enum.Font.SourceSans
BeNeu.Text = ""
BeNeu.TextColor3 = Color3.fromRGB(0, 0, 0)
BeNeu.TextSize = 14.000
BeNeu.MouseButton1Down:Connect(function()
	_G.execCmd("t n", game.Players.LocalPlayer)
end)

BeGuard.Name = "BeGuard"
BeGuard.Parent = MainFrame
BeGuard.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
BeGuard.BorderSizePixel = 0
BeGuard.Position = UDim2.new(0.164999992, 0, 0.140000001, 0)
BeGuard.Size = UDim2.new(0, 10, 0, 40)
BeGuard.Font = Enum.Font.SourceSans
BeGuard.Text = ""
BeGuard.TextColor3 = Color3.fromRGB(0, 0, 0)
BeGuard.TextSize = 14.000
BeGuard.MouseButton1Down:Connect(function()
	_G.execCmd("t g", game.Players.LocalPlayer)
end)

Refresh.Name = "Refresh"
Refresh.Parent = MainFrame
Refresh.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Refresh.BorderColor3 = Color3.fromRGB(20, 20, 20)
Refresh.Position = UDim2.new(0.25999999, 0, 0.140000001, 0)
Refresh.Size = UDim2.new(0, 63, 0, 40)
Refresh.Font = Enum.Font.Code
Refresh.Text = "Refresh"
Refresh.TextColor3 = Color3.fromRGB(255, 255, 255)
Refresh.TextSize = 15.000
Refresh.MouseButton1Down:Connect(function()
		_G.execCmd("re", game.Players.LocalPlayer)
end)

UICorner_4.CornerRadius = UDim.new(0, 10)
UICorner_4.Parent = Refresh

SpawnButton.Name = "SpawnButton"
SpawnButton.Parent = MainFrame
SpawnButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SpawnButton.BorderColor3 = Color3.fromRGB(20, 20, 20)
SpawnButton.Position = UDim2.new(0.609999955, 0, 0.140000001, 0)
SpawnButton.Size = UDim2.new(0, 70, 0, 40)
SpawnButton.Font = Enum.Font.Code
SpawnButton.Text = "Spawn"
SpawnButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpawnButton.TextSize = 15.000
SpawnButton.MouseButton1Down:Connect(function()
	game.workspace.Remote.loadchar:InvokeServer()
end)

UICorner_5.CornerRadius = UDim.new(0, 10)
UICorner_5.Parent = SpawnButton

Nexus.Name = "Nexus"
Nexus.Parent = MainFrame
Nexus.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Nexus.BorderColor3 = Color3.fromRGB(20, 20, 20)
Nexus.Position = UDim2.new(0.0249999985, 0, 0.306666672, 0)
Nexus.Size = UDim2.new(0, 90, 0, 40)
Nexus.Font = Enum.Font.Code
Nexus.Text = "Nexus"
Nexus.TextColor3 = Color3.fromRGB(255, 255, 255)
Nexus.TextSize = 15.000
Nexus.MouseButton1Down:Connect(function()
		_G.execCmd("tp pos nex", Player)
end)

UICorner_6.CornerRadius = UDim.new(0, 10)
UICorner_6.Parent = Nexus

Yard.Name = "Yard"
Yard.Parent = MainFrame
Yard.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Yard.BorderColor3 = Color3.fromRGB(20, 20, 20)
Yard.Position = UDim2.new(0.519999981, 0, 0.306666672, 0)
Yard.Size = UDim2.new(0, 90, 0, 40)
Yard.Font = Enum.Font.Code
Yard.Text = "Yard"
Yard.TextColor3 = Color3.fromRGB(255, 255, 255)
Yard.TextSize = 15.000
Yard.MouseButton1Down:Connect(function()
		_G.execCmd("tp pos yard", Player)
end)

UICorner_7.CornerRadius = UDim.new(0, 10)
UICorner_7.Parent = Yard

Armory.Name = "Armory"
Armory.Parent = MainFrame
Armory.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Armory.BorderColor3 = Color3.fromRGB(20, 20, 20)
Armory.Position = UDim2.new(0.0249999985, 0, 0.476666689, 0)
Armory.Size = UDim2.new(0, 90, 0, 40)
Armory.Font = Enum.Font.Code
Armory.Text = "Armory"
Armory.TextColor3 = Color3.fromRGB(255, 255, 255)
Armory.TextSize = 15.000
Armory.MouseButton1Down:Connect(function()
		_G.execCmd("tp pos arm", Player)
end)

UICorner_8.CornerRadius = UDim.new(0, 10)
UICorner_8.Parent = Armory

Cells.Name = "Cells"
Cells.Parent = MainFrame
Cells.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Cells.BorderColor3 = Color3.fromRGB(20, 20, 20)
Cells.Position = UDim2.new(0.519999981, 0, 0.476666689, 0)
Cells.Size = UDim2.new(0, 90, 0, 40)
Cells.Font = Enum.Font.Code
Cells.Text = "Cells"
Cells.TextColor3 = Color3.fromRGB(255, 255, 255)
Cells.TextSize = 15.000
Cells.MouseButton1Down:Connect(function()
		_G.execCmd("tp pos cells", Player)
end)

UICorner_9.CornerRadius = UDim.new(0, 10)
UICorner_9.Parent = Cells

Back.Name = "Back"
Back.Parent = MainFrame
Back.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Back.BorderColor3 = Color3.fromRGB(20, 20, 20)
Back.Position = UDim2.new(0.0249999985, 0, 0.636666656, 0)
Back.Size = UDim2.new(0, 90, 0, 40)
Back.Font = Enum.Font.Code
Back.Text = "Back"
Back.TextColor3 = Color3.fromRGB(255, 255, 255)
Back.TextSize = 15.000
Back.MouseButton1Down:Connect(function()
		_G.execCmd("tp pos back", Player)
end)

UICorner_10.CornerRadius = UDim.new(0, 10)
UICorner_10.Parent = Back

Cafe.Name = "Cafe"
Cafe.Parent = MainFrame
Cafe.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Cafe.BorderColor3 = Color3.fromRGB(20, 20, 20)
Cafe.Position = UDim2.new(0.519999981, 0, 0.636666656, 0)
Cafe.Size = UDim2.new(0, 90, 0, 40)
Cafe.Font = Enum.Font.Code
Cafe.Text = "Cafe"
Cafe.TextColor3 = Color3.fromRGB(255, 255, 255)
Cafe.TextSize = 15.000
Cafe.MouseButton1Down:Connect(function()
		_G.execCmd("tp pos cafe", Player)
end)

UICorner_11.CornerRadius = UDim.new(0, 10)
UICorner_11.Parent = Cafe

Driveway.Name = "Driveway"
Driveway.Parent = MainFrame
Driveway.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Driveway.BorderColor3 = Color3.fromRGB(20, 20, 20)
Driveway.Position = UDim2.new(0.0249999985, 0, 0.799999952, 0)
Driveway.Size = UDim2.new(0, 90, 0, 40)
Driveway.Font = Enum.Font.Code
Driveway.Text = "Driveway"
Driveway.TextColor3 = Color3.fromRGB(255, 255, 255)
Driveway.TextSize = 15.000
Driveway.MouseButton1Down:Connect(function()
		_G.execCmd("tp pos driv", Player)
end)

UICorner_12.CornerRadius = UDim.new(0, 10)
UICorner_12.Parent = Driveway

Roof.Name = "Roof"
Roof.Parent = MainFrame
Roof.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Roof.BorderColor3 = Color3.fromRGB(20, 20, 20)
Roof.Position = UDim2.new(0.519999981, 0, 0.799999952, 0)
Roof.Size = UDim2.new(0, 90, 0, 40)
Roof.Font = Enum.Font.Code
Roof.Text = "Roof"
Roof.TextColor3 = Color3.fromRGB(255, 255, 255)
Roof.TextSize = 15.000
Roof.MouseButton1Down:Connect(function()
		_G.execCmd("tp pos roof", Player)
end)

UICorner_13.CornerRadius = UDim.new(0, 10)
UICorner_13.Parent = Roof

UICorner_14.CornerRadius = UDim.new(0, 10)
UICorner_14.Parent = MainFrame
end

function guiList.loadCommands()
  local CommandsV2 = Instance.new("ScreenGui")
	local fun = Instance.new("Frame")
	local BackgroundFrame = Instance.new("Frame")
	local Topframe = Instance.new("Frame")
	local ImageLabel = Instance.new("ImageLabel")
	local UICorner = Instance.new("UICorner")
	local UICorner_2 = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")
	local CloseButton = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")
	local UICorner_4 = Instance.new("UICorner")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local Information = Instance.new("Frame")
	local UICorner_5 = Instance.new("UICorner")
	local Topframe_2 = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local CloseButton_2 = Instance.new("TextButton")
	local UICorner_7 = Instance.new("UICorner")
	local CmdName = Instance.new("TextLabel")
	local Aliases = Instance.new("TextLabel")
	local Args = Instance.new("TextLabel")
	local Examples = Instance.new("TextLabel")

	--Properties:

	CommandsV2.Name = "CommandsV2"
	CommandsV2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	CommandsV2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	fun.Name = "fun"
	fun.Parent = CommandsV2
	fun.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	fun.BackgroundTransparency = 1.000
	fun.Size = UDim2.new(0, 100, 0, 100)

	BackgroundFrame.Name = "BackgroundFrame"
	BackgroundFrame.Parent = fun
	BackgroundFrame.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
	BackgroundFrame.Position = UDim2.new(2.91916609, 0, 6.23679638, 0)
	BackgroundFrame.Size = UDim2.new(0, 299, 0, 200)
	BackgroundFrame.Active = true
	BackgroundFrame.Draggable = true

	Topframe.Name = "Topframe"
	Topframe.Parent = BackgroundFrame
	Topframe.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	Topframe.BorderSizePixel = 0
	Topframe.Position = UDim2.new(0, 0, -9.30786118e-05, 0)
	Topframe.Size = UDim2.new(0, 299, 0, 36)

	ImageLabel.Parent = Topframe
	ImageLabel.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(0.0266889632, 0, 0.0722222254, 0)
	ImageLabel.Size = UDim2.new(0, 30, 0, 30)
	ImageLabel.Image = "http://www.roblox.com/asset/?id=6142456413"

	UICorner.Parent = ImageLabel

	UICorner_2.Parent = Topframe

	TextLabel.Parent = Topframe
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0.157699078, 0, 0.138019115, 0)
	TextLabel.Size = UDim2.new(0, 170, 0, 25)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.RichText = true
	TextLabel.Text = "<b>Vestiria Command List</b>"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 18.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left

	CloseButton.Name = "CloseButton"
	CloseButton.Parent = Topframe
	CloseButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	CloseButton.BorderSizePixel = 0
	CloseButton.Position = UDim2.new(0.890101314, 0, 0.137953639, 0)
	CloseButton.Size = UDim2.new(0, 24, 0, 25)
	CloseButton.Font = Enum.Font.SourceSans
	CloseButton.RichText = true
	CloseButton.Text = "<b>X</b>"
	CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.TextSize = 18.000
	CloseButton.TextWrapped = true
	CloseButton.MouseButton1Down:Connect(function()
		BackgroundFrame.Visible = false
	end)

	UICorner_3.Parent = CloseButton

	UICorner_4.Parent = BackgroundFrame

	ScrollingFrame.Parent = BackgroundFrame
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.Position = UDim2.new(0, 0, 0.215000004, 0)
	ScrollingFrame.Size = UDim2.new(0, 299, 0, 157)
	ScrollingFrame.CanvasSize = UDim2.new(5, 0, 20, 0)

	local function addSection(text)
		local SectionExample = Instance.new("TextButton")
		SectionExample.Name = "SectionExample"
		SectionExample.Parent = ScrollingFrame
		SectionExample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SectionExample.BackgroundTransparency = 1.000
		SectionExample.Position = UDim2.new(0.00936454814, 0, -0.000500000024, 0)
		SectionExample.Size = UDim2.new(0, 281, 0, 16)
		SectionExample.Font = Enum.Font.SourceSans
		SectionExample.RichText = true
		SectionExample.Text = text
		SectionExample.TextColor3 = Color3.fromRGB(255, 255, 255)
		SectionExample.TextSize = 18.000
		SectionExample.TextXAlignment = Enum.TextXAlignment.Left
		SectionExample.TextYAlignment = Enum.TextYAlignment.Bottom
	end
	addSection("<b>--- Team:</b>")

	UIListLayout.Parent = ScrollingFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	local function addButton(text, func, last)
		if last == "GreyButton" then
			local WhiteButton = Instance.new("TextButton")
			WhiteButton.Name = "WhiteButton"
			WhiteButton.Parent = ScrollingFrame
			WhiteButton.BackgroundColor3 = Color3.fromRGB(134, 134, 134)
			WhiteButton.BackgroundTransparency = 1.000
			WhiteButton.Position = UDim2.new(0.00936454814, 0, -0.000500000024, 0)
			WhiteButton.Size = UDim2.new(0, 281, 0, 16)
			WhiteButton.Font = Enum.Font.SourceSans
			WhiteButton.Text = text
			WhiteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			WhiteButton.TextSize = 18.000
			WhiteButton.TextXAlignment = Enum.TextXAlignment.Left
			WhiteButton.TextYAlignment = Enum.TextYAlignment.Bottom
			getgenv().lastOne = "WhiteButton"
			WhiteButton.MouseButton1Down:Connect(func)
		elseif last == "WhiteButton" then
			local GreyButton = Instance.new("TextButton")
			GreyButton.Name = "GreyButton"
			GreyButton.Parent = ScrollingFrame
			GreyButton.BackgroundColor3 = Color3.fromRGB(134, 134, 134)
			GreyButton.BackgroundTransparency = 1.000
			GreyButton.Position = UDim2.new(0.00936454814, 0, -0.000500000024, 0)
			GreyButton.Size = UDim2.new(0, 281, 0, 16)
			GreyButton.Font = Enum.Font.SourceSans
			GreyButton.Text = text
			GreyButton.TextColor3 = Color3.fromRGB(153, 153, 153)
			GreyButton.TextSize = 18.000
			GreyButton.TextXAlignment = Enum.TextXAlignment.Left
			GreyButton.TextYAlignment = Enum.TextYAlignment.Bottom
			getgenv().lastOne = "GreyButton"
			GreyButton.MouseButton1Down:Connect(func)
		end
	end


	Information.Name = "Information"
	Information.Parent = BackgroundFrame
	Information.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
	Information.Position = UDim2.new(1.02341151, 0, 0, 0)
	Information.Size = UDim2.new(0, 190, 0, 200)
	Information.Visible = false

	UICorner_5.Parent = Information

	Topframe_2.Name = "Topframe"
	Topframe_2.Parent = Information
	Topframe_2.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	Topframe_2.BorderSizePixel = 0
	Topframe_2.Position = UDim2.new(0, 0, -0.002235936, 0)
	Topframe_2.Size = UDim2.new(0, 190, 0, 36)

	UICorner_6.Parent = Topframe_2

	CloseButton_2.Name = "CloseButton"
	CloseButton_2.Parent = Topframe_2
	CloseButton_2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	CloseButton_2.BorderSizePixel = 0
	CloseButton_2.Position = UDim2.new(0.832206547, 0, 0.110175863, 0)
	CloseButton_2.Size = UDim2.new(0, 24, 0, 25)
	CloseButton_2.Font = Enum.Font.SourceSans
	CloseButton_2.RichText = true
	CloseButton_2.Text = "<b>X</b>"
	CloseButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton_2.TextSize = 18.000
	CloseButton_2.TextWrapped = true
	CloseButton_2.MouseButton1Down:Connect(function()
		Information.Visible = false
	end)

	UICorner_7.Parent = CloseButton_2

	CmdName.Name = "CmdName"
	CmdName.Parent = Topframe_2
	CmdName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CmdName.BackgroundTransparency = 1.000
	CmdName.Position = UDim2.new(0.0471724682, 0, 0.165796921, 0)
	CmdName.Size = UDim2.new(0, 127, 0, 25)
	CmdName.Font = Enum.Font.SourceSans
	CmdName.RichText = true
	CmdName.Text = "<b>.team</b>"
	CmdName.TextColor3 = Color3.fromRGB(255, 255, 255)
	CmdName.TextSize = 18.000
	CmdName.TextXAlignment = Enum.TextXAlignment.Left

	Aliases.Name = "Aliases"
	Aliases.Parent = Information
	Aliases.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Aliases.BackgroundTransparency = 1.000
	Aliases.Position = UDim2.new(0.0471724682, 0, 0.213098392, 0)
	Aliases.Size = UDim2.new(0, 172, 0, 33)
	Aliases.Font = Enum.Font.SourceSans
	Aliases.RichText = true
	Aliases.Text = "<b>Aliases:</b> t, team"
	Aliases.TextColor3 = Color3.fromRGB(255, 255, 255)
	Aliases.TextSize = 16.000
	Aliases.TextWrapped = true
	Aliases.TextXAlignment = Enum.TextXAlignment.Left
	Aliases.TextYAlignment = Enum.TextYAlignment.Top

	Args.Name = "Args"
	Args.Parent = Information
	Args.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Args.BackgroundTransparency = 1.000
	Args.Position = UDim2.new(0.0471724644, 0, 0.413098454, 0)
	Args.Size = UDim2.new(0, 172, 0, 47)
	Args.Font = Enum.Font.SourceSans
	Args.RichText = true
	Args.Text = "<b>Arguments:</b> [teamname], user [name], rgb [code]"
	Args.TextColor3 = Color3.fromRGB(255, 255, 255)
	Args.TextSize = 16.000
	Args.TextWrapped = true
	Args.TextXAlignment = Enum.TextXAlignment.Left
	Args.TextYAlignment = Enum.TextYAlignment.Top

	Examples.Name = "Examples"
	Examples.Parent = Information
	Examples.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Examples.BackgroundTransparency = 1.000
	Examples.Position = UDim2.new(0.0471724682, 0, 0.648098409, 0)
	Examples.Size = UDim2.new(0, 172, 0, 47)
	Examples.Font = Enum.Font.SourceSans
	Examples.RichText = true
	Examples.Text = "<b>Examples:</b> .t i / .team user trans / .t rgb 255,255,255"
	Examples.TextColor3 = Color3.fromRGB(255, 255, 255)
	Examples.TextSize = 16.000
	Examples.TextWrapped = true
	Examples.TextXAlignment = Enum.TextXAlignment.Left
	Examples.TextYAlignment = Enum.TextYAlignment.Top
	getgenv().lastOne = "WhiteButton"
	for i,v in next, _G.cmds do
		if v.FUNC == nil then
			addSection("<b>--- "..v.NAME..":</b>")
		else
		    print(v.NAME)
			addButton(v.NAME .. " - ".. v.DESC, function()
				local str = ""
				if #v.ALIAS > 0 then
					for i,v in next, v.ALIAS do
						str = str .. v .. ","
					end
				end
				CmdName.Text = "<b>."..v.NAME.."</b>"
				Aliases.Text = "<b>Aliases: </b>"..str
				Args.Text = "<b>Args: </b>".. v.INFO.args
				Examples.Text = "<b>Examples: </b>".. v.INFO.examples
				Information.Visible = true
			end, getgenv().lastOne)
		end
	end
end

function guiList.cmdBar()
  local CmdBar = Instance.new("ScreenGui")
  local MainFrame = Instance.new("Frame")
  local TopFrame = Instance.new("Frame")
  local CloseButton = Instance.new("TextButton")
  local UICorner = Instance.new("UICorner")
  local TextLabel = Instance.new("TextLabel")
  local ImageLabel = Instance.new("ImageLabel")
  local UICorner_2 = Instance.new("UICorner")
  local UICorner_3 = Instance.new("UICorner")
  local HelpButton = Instance.new("TextButton")
  local UICorner_4 = Instance.new("UICorner")
  local Input = Instance.new("TextBox")
  local UICorner_5 = Instance.new("UICorner")
  local UICorner_6 = Instance.new("UICorner")
  
  --Properties:
  
  CmdBar.Name = "CmdBar"
  CmdBar.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
  CmdBar.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  
  MainFrame.Name = "MainFrame"
  MainFrame.Parent = CmdBar
  MainFrame.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
  MainFrame.BorderSizePixel = 0
  MainFrame.Position = UDim2.new(0.00885416567, 0, 0.864546537, 0)
  MainFrame.Size = UDim2.new(0, 263, 0, 80)
  MainFrame.Active = true
  MainFrame.Draggable = true
  
  TopFrame.Name = "TopFrame"
  TopFrame.Parent = MainFrame
  TopFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
  TopFrame.BorderSizePixel = 0
  TopFrame.Size = UDim2.new(0, 263, 0, 43)
  
  CloseButton.Name = "CloseButton"
  CloseButton.Parent = TopFrame
  CloseButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
  CloseButton.BorderSizePixel = 0
  CloseButton.Position = UDim2.new(0.866768003, 0, 0.186046511, 0)
  CloseButton.Size = UDim2.new(0, 24, 0, 25)
  CloseButton.Font = Enum.Font.SourceSans
  CloseButton.RichText = true
  CloseButton.Text = "<b>X</b>"
  CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
  CloseButton.TextSize = 18.000
  CloseButton.TextWrapped = true
  CloseButton.MouseButton1Down:Connect(function()
  	CmdBar:Destroy()
  end)
  
  UICorner.Parent = CloseButton
  
  TextLabel.Parent = TopFrame
  TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel.BackgroundTransparency = 1.000
  TextLabel.Position = UDim2.new(0.165779501, 0, 0.186046511, 0)
  TextLabel.Size = UDim2.new(0, 170, 0, 25)
  TextLabel.Font = Enum.Font.SourceSans
  TextLabel.RichText = true 
  TextLabel.Text = "<b>Vestiria Command Bar</b>"
  TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextLabel.TextSize = 18.000
  TextLabel.TextXAlignment = Enum.TextXAlignment.Left
  
  ImageLabel.Parent = TopFrame
  ImageLabel.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
  ImageLabel.BorderSizePixel = 0
  ImageLabel.Position = UDim2.new(0.0266159698, 0, 0.139534891, 0)
  ImageLabel.Size = UDim2.new(0, 30, 0, 30)
  ImageLabel.Image = "http://www.roblox.com/asset/?id=6142456413"
  
  UICorner_2.Parent = ImageLabel
  
  UICorner_3.Parent = TopFrame
  
  HelpButton.Name = "HelpButton"
  HelpButton.Parent = TopFrame
  HelpButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
  HelpButton.BorderSizePixel = 0
  HelpButton.Position = UDim2.new(0.752699554, 0, 0.186046511, 0)
  HelpButton.Size = UDim2.new(0, 24, 0, 25)
  HelpButton.Font = Enum.Font.SourceSans
  HelpButton.RichText = true 
  HelpButton.Text = "<b>?</b>"
  HelpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
  HelpButton.TextSize = 18.000
  HelpButton.TextWrapped = true
  HelpButton.MouseButton1Down:Connect(function()
    guiList.loadCommands()
  end)
  
  UICorner_4.Parent = HelpButton
  
  Input.Name = "Input"
  Input.Parent = MainFrame
  Input.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
  Input.BorderSizePixel = 0
  Input.Position = UDim2.new(0.0266666766, 0, 0.625, 0)
  Input.Size = UDim2.new(0, 245, 0, 19)
  Input.Font = Enum.Font.Code
  Input.PlaceholderText = "Press . to focus command bar"
  Input.Text = ""
  Input.TextColor3 = Color3.fromRGB(255, 255, 255)
  Input.TextSize = 14.000
  Input.TextXAlignment = Enum.TextXAlignment.Left
  
  UICorner_5.Parent = Input
  
  UICorner_6.Parent = MainFrame
  
  local prefix = _G.info.prefix
  local commandBox = game.Players.LocalPlayer.PlayerGui.CmdBar.MainFrame.Input
  game:GetService("Players").LocalPlayer:GetMouse().KeyDown:Connect(function(key)
  	if key == prefix then
  		if not commandBox:IsFocused() then
  			commandBox:CaptureFocus()
  			spawn(function()
  				repeat commandBox.Text="" until commandBox.Text==""
  			end)
  		end
  	end
  end)
  commandBox.FocusLost:Connect(function(enterpressed)
  	if enterpressed then
  		_G.execCmd(commandBox.Text, game.Players.LocalPlayer)
  	end
  	wait()
  	if not commandBox:IsFocused()then
  		commandBox.Text=""
  	end
  end)
end

return guiList
