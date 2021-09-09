local key = _G.Key or ""
local http_request = http_request
if syn then 
    http_request = syn.request
elseif SENTINEL_V2 then
    http_request = request 
end

local getservice = game.GetService
local httpservice = getservice(game, "HttpService")

local function http_request_get(url, headers) 
    return http_request({Url=url,Method="GET",Headers=headers or nil}).Body 
end

local function jsondecode(json)
    local jsonTable = {}
     pcall(function() jsonTable = httpservice.JSONDecode(httpservice,json) end)
    return jsonTable
end

local chars = '0123456789'
local length = 50
local randomString = ''

charTable = {}
for c in chars:gmatch"." do
    table.insert(charTable, c)
end

for i = 1, length do
    randomString = randomString .. charTable[math.random(1, #charTable)]
end

local body = http_request_get('https://httpbin.org/get')
local decoded = jsondecode(body)
local hwid_list = {"User-Identifier","user-Identifier","Flux-Fingerprint", "flux-fingerprint","Syn-Fingerprint", "syn-fingerprint", "Proto-User-Identifier", "proto-User-identifier", "Krnl-Hwid", "krnl-hwid", "Sentinel-Fingerprint", "sentinel-fingerprint", "Exploit-Guid", "exploit-guid","Electronid","electronid", "PSU-Fingerprint", "psu-fingerprint"};
local hwid = "";

for i, v in next, hwid_list do
    if decoded.headers[v] then
        hwid = decoded.headers[v];
        break
    end
end

local randoms = randomString

local data = jsondecode(http_request_get("http://191.96.37.76/server.php?key=".. key .."&random="..randoms))

if data.Hwid == "Unknown" then
http_request_get("http://191.96.37.76/changehwid.php?key=".. key .."&hwid="..hwid)
game.Players.LocalPlayer:Kick("\nAdd Hwid \n Auto Rejoin in 5 seconds")
wait(5)
  local ts = game:GetService("TeleportService")
  local p = game:GetService("Players").LocalPlayer
  ts:Teleport(game.PlaceId, p)
 else

if data.Key == key then
    if data.Blacklist == "False" then
            if data.Hwid == hwid then
                    print("Whitelist !!!")
					local maincolor = Color3.fromRGB(255,255,255)
					local firstpage = '' 
					local old = game.CoreGui:FindFirstChild('ScreenGui') 
					if old  then 
						old:Destroy()
					end
					local function Vector2ToUDim2(v2)
						return UDim2.new(0, v2.X, 0, v2.Y)
					end
					local tween = game:GetService("TweenService")
					local library = {currenttab = '',toggled = false}
					local RainbowModeColorValue = 0
					coroutine.wrap(function()
						while wait() do
							RainbowModeColorValue = RainbowModeColorValue + 1 / 255
							if RainbowModeColorValue >= 1 then
								RainbowModeColorValue = 0
							end
						end
					end)()
					
					local function dragify(Frame)
						dragToggle = nil
						dragSpeed = 2 
						dragInput = nil
						dragStart = nil
						dragPos = nil
						function updateInput(input)
							if not busy  then 
								Delta = input.Position - dragStart
								Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
								game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {Position = Position}):Play()
							end 
						end
						Frame.InputBegan:Connect(function(input)
							if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
								dragToggle = true
								dragStart = input.Position
								startPos = Frame.Position
								input.Changed:Connect(function()
									if (input.UserInputState == Enum.UserInputState.End) then
										dragToggle = false
									end
								end)
							end
						end)
						Frame.InputChanged:Connect(function(input)
							if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
								dragInput = input
							end
						end)
						game:GetService("UserInputService").InputChanged:Connect(function(input)
							if (input == dragInput and dragToggle) then
								updateInput(input)
							end
						end)
					end
					local ScreenGui = Instance.new("ScreenGui")
					local bind = Enum.KeyCode.RightControl
					function library:SetBind(new)
						bind = new 
					end
					function library:Destroy()
						ScreenGui:Destroy()
					end
					function library:NewWindow(RezxHub)
					
						local MainWindow = Instance.new("ImageLabel")
						local Mouse = game.Players.LocalPlayer:GetMouse()
						local Circle = Instance.new("ImageLabel")
						Circle.Name = "Circle"
						Circle.Parent = ScreenGui
						Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Circle.BackgroundTransparency = 1
						Circle.ZIndex = 10
						Circle.Image = "http://www.roblox.com/asset/?id=6031625146"
						Circle.ImageColor3 = Color3.fromRGB(255, 255, 255)
						Circle.ImageTransparency = 0.5
						local function CircleClick(Button, X, Y)
							coroutine.resume(coroutine.create(function()
								Button.ClipsDescendants = true
								local Circle = ScreenGui:WaitForChild("Circle"):Clone()
								Circle.Parent = Button
								local NewX = X - Circle.AbsolutePosition.X
								local NewY = Y - Circle.AbsolutePosition.Y
								Circle.Position = UDim2.new(0, NewX, 0, NewY)
								local Size = 0
								if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
									Size = Button.AbsoluteSize.X * 1.5
								elseif Button.AbsoluteSize.X < Button.AbsoluteSize.Y then
									Size = Button.AbsoluteSize.Y * 1.5
								elseif Button.AbsoluteSize.X == Button.AbsoluteSize.Y then
									Size = Button.AbsoluteSize.X * 1.5
								end
								local Time = 0.5
								tween:Create(Circle,TweenInfo.new(Time,Enum.EasingStyle.Sine),{Size = UDim2.new(0, Size, 0, Size),Position = UDim2.new(0.5, -Size / 2, 0.5, -Size / 2)}):Play()
								for i = 1, 10 do
									Circle.ImageTransparency = Circle.ImageTransparency + 0.05
									wait(Time / 10)
								end
								Circle:Destroy()
							end))
						end
						local Close = Instance.new("ImageButton")
						local SectionTab = Instance.new("Frame")
						local Section_List = Instance.new("UIListLayout")
						local Hub = Instance.new("TextLabel")
						local UICorner_10 = Instance.new("UICorner")
						local Porn = Instance.new("TextLabel")
						local Custom = Instance.new("TextLabel")
						local btnGradient_2 = Instance.new("UIGradient")
						ScreenGui.Parent = game.CoreGui
						MainWindow.Name = "MainWindow"
						MainWindow.Parent = ScreenGui
						MainWindow.AnchorPoint = Vector2.new(0.5, 0.5)
						MainWindow.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
						MainWindow.BackgroundTransparency = 1
						MainWindow.ClipsDescendants = true
						MainWindow.Position = UDim2.new(0.5, 0, 0.5, 0)
						MainWindow.Size = UDim2.new(0, 0, 0, 0)
						MainWindow.Image = "rbxassetid://3570695787"
						MainWindow.ImageColor3 = Color3.fromRGB(39, 39, 39)
						MainWindow.ScaleType = Enum.ScaleType.Slice
						MainWindow.SliceCenter = Rect.new(100, 100, 100, 100)
						MainWindow.SliceScale = 0.050
						MainWindow.AnchorPoint = Vector2.new(0.5,0.5)
						local PageFoler = Instance.new("Folder")
						PageFoler.Parent = MainWindow
						PageFoler.Name = 'Pages'
						--<<<  Make Connection 
						tween:Create(MainWindow,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 440, 0, 282)}):Play()
						dragify(MainWindow)
						game:GetService("UserInputService").InputBegan:Connect(function(input)
							if input.KeyCode == bind then 
								if library.toggled == false then
									library.toggled = true  
									tween:Create(MainWindow,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size = UDim2.new(0, 0, 0, 0)}):Play()
								else 
									library.toggled = false 
									tween:Create(MainWindow,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 440, 0, 282)}):Play()
								end 
							end
						end)
					
						-- >>>
						SectionTab.Name = "SectionTab"
						SectionTab.Parent = MainWindow
						SectionTab.BackgroundColor3 = Color3.fromRGB(255,255,255)
						SectionTab.BackgroundTransparency = 1
						SectionTab.Position = UDim2.new(0.046052631, 0, 0.142078027, 0)
						SectionTab.Size = UDim2.new(0, 414, 0, 21)
						Section_List.Name = "Section_List"
						Section_List.Parent = SectionTab
						Section_List.FillDirection = Enum.FillDirection.Horizontal
						Section_List.SortOrder = Enum.SortOrder.LayoutOrder
						Section_List.Padding = UDim.new(0, 6)
						Close.Name = "Close"
						Close.Parent = MainWindow
						Close.BackgroundColor3 = maincolor
						Close.BackgroundTransparency = 1
						Close.Position = UDim2.new(0.915366888, 0, 0.0280000009, 0)
						Close.Size = UDim2.new(0, 21, 0, 21)
						Close.Image = "http://www.roblox.com/asset/?id=6031094678"
						local UIGradientMainColor = Instance.new("UIGradient")
					
						UIGradientMainColor.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(137, 0, 254)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(223, 0, 255))}
						UIGradientMainColor.Parent = Close
						
						Close.ScaleType = Enum.ScaleType.Fit
						Close.MouseButton1Click:Connect(function()
							tween:Create(MainWindow,TweenInfo.new(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size = UDim2.new(0,0,0,0)}):Play()
							wait(0.3)
							ScreenGui:Destroy()
						end)
						Close.MouseLeave:Connect(function()
							tween:Create(Close,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageColor3 = maincolor}):Play()
						end)
						Close.MouseEnter:Connect(function()
							tween:Create(Close,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageColor3 = Color3.fromRGB(245, 245, 245)}):Play()
						end)
						local UICorner_9 = Instance.new("UICorner")
					
						local function showall()
							for i, v in next,PageFoler[library.currenttab]:GetChildren() do
								if filter(v) then
									v.Visible = true
								end
							end
						end
					
						UICorner_10.CornerRadius = UDim.new(0.150000006, 0)
						UICorner_10.Parent = Hub
						Porn.Name = "Demon"
						Porn.Parent = MainWindow
						Porn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Porn.BackgroundTransparency = 1
						Porn.Position = UDim2.new(0.06, 0, 0.03, 0)
						Porn.Size = UDim2.new(0, 43, 0, 21)
						Porn.Font = Enum.Font.SourceSansBold
						Porn.Text = RezxHub
						Porn.TextColor3 = Color3.fromRGB(255, 255, 255)
						Porn.TextSize = 16.000
						Custom.Name = "Custom"
						Custom.Parent = MainWindow
						Custom.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Custom.BackgroundTransparency = 1
						Custom.Position = UDim2.new(0.2, 0, 0.027999986, 0)
						Custom.Size = UDim2.new(0, 102, 0, 21)
						Custom.Visible = false
						Custom.Font = Enum.Font.SourceSansBold
						Custom.Text = "Demon Hub"
						Custom.TextColor3 = Color3.fromRGB(255, 255, 255)
						Custom.TextSize = 16.000
						Custom.TextXAlignment = Enum.TextXAlignment.Left
						btnGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, maincolor), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(193, 116, 22))}
						btnGradient_2.Rotation = 90
						btnGradient_2.Name = "btnGradient"
						btnGradient_2.Parent = Custom
						local TabHandler = {}
						function TabHandler:NewSection(nam)
					
							local name = tostring(nam) or tostring(math.random(1,5000))
							local TabFrame = Instance.new("ScrollingFrame")
							local Element_List = Instance.new("UIListLayout")
							local TabName = Instance.new("TextButton")
							local Underline = Instance.new("Frame")
							local base = UDim2.new(0.037083853, 0, 0.269503534, 0)
							TabFrame.Name = name 
							TabFrame.Parent = PageFoler
							TabFrame.Active = true
							TabFrame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
							TabFrame.BorderSizePixel = 0
							TabFrame.Position = base
							TabFrame.Size = UDim2.new(0, 412, 0, 200)
							TabFrame.ScrollBarThickness = 0
							TabFrame.Visible = false 
							TabFrame.ClipsDescendants  = true 
					
							Element_List.Name = "Element_List"
							Element_List.Parent = TabFrame
							Element_List.HorizontalAlignment = Enum.HorizontalAlignment.Center
							Element_List.SortOrder = Enum.SortOrder.LayoutOrder
							Element_List.Padding = UDim.new(0, 3)
							Element_List:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
								local absoluteSize = Element_List.AbsoluteContentSize
								TabFrame.CanvasSize = UDim2.new(0, absoluteSize.X, 0, absoluteSize.Y)
							end)
							TabName.Name = name .. ": Tab"
							TabName.Parent = SectionTab
							TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							TabName.BackgroundTransparency = 1
							TabName.Size = UDim2.new(0, 49, 0, 21)
							TabName.Font = Enum.Font.SourceSansBold
							TabName.Text = name
							TabName.TextColor3 = Color3.fromRGB(150,150,150)
							TabName.TextSize = 14.000
					
							Underline.Name = "Underline"
							Underline.Parent = TabName
							Underline.BackgroundColor3 = maincolor
							Underline.Position = UDim2.new(0, 0, 0.952380955, 0)
							Underline.Size = UDim2.new(0, 0, 0, 1)
							Underline.Visible = true 
							Underline.BorderSizePixel  = 0
							Underline.AnchorPoint = Vector2.new(0,0)
							if firstpage == '' then
								wait(0.4)
								firstpage = name 
								tween:Create(Underline,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{Size = UDim2.new(0, 49, 0, 1)}):Play()
								tween:Create(TabName,TweenInfo.new(0.3,Enum.EasingStyle.Sine),{TextColor3 = Color3.fromRGB(255,255,255)}):Play()
								TabFrame.Visible = true 
								TabFrame.Position = base + UDim2.new(-1, 0, 0, 0)
								local tween = game.TweenService:Create(TabFrame, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
									Position = base
								})
								tween:Play()
							end
							TabName.MouseButton1Click:Connect(function()
								for i,v in pairs(PageFoler:GetChildren()) do 
									if v.Visible == true then 
										local tween = game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
											Position = base + UDim2.new(1, 0, 0, 0),
										})
										tween:Play()
										tween.Completed:Wait()
										v.Visible = false 
									end 
								end
								for i,v in pairs(SectionTab:GetChildren()) do
									if v.Name:find("Tab") then 
										tween:Create(v.Underline,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{Size = UDim2.new(0, 0, 0, 1)}):Play()
										tween:Create(v,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{TextColor3 = Color3.fromRGB(150,150,150)}):Play()						
										library.currenttab = tostring(name)
										local a = math.random(1,5)
									end
								end
								tween:Create(Underline,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{Size = UDim2.new(0, 49, 0, 1)}):Play()
								tween:Create(TabName,TweenInfo.new(0.3,Enum.EasingStyle.Sine),{TextColor3 = Color3.fromRGB(255,255,255)}):Play()
								for i,v in pairs(PageFoler:GetChildren()) do 
									if v.Name == name then 
										v.Visible = true 
										v.Position = base + UDim2.new(-1, 0, 0, 0)
										local tween = game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
											Position = base
										})
										tween:Play()
									end
								end
							end)
							local Element = {}
							function Element:Bind(nam,ke,callbackontyp,callbac)
								if typeof(callbac) ~= 'function' then warn("Element:Bind() need 4 arguments (<str> name,<enum> key,<boolean> callbackwhenconfirm,<function> callback) ") end 
								local callbackontype = callbackontyp or false
								local name = tostring(nam) or "Keybind"
								local key = ke or Enum.KeyCode.F
								local callback = callbac or function() end
								local name = tostring(nam) or tostring(math.random(1,5000))
								local keyname = tostring(key.Name)
								local NewBind = Instance.new("TextButton")
								local Bind = Instance.new("TextButton")
								NewBind.Name = "NewBind"
								NewBind.Parent = TabFrame
								NewBind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								NewBind.BackgroundTransparency = 1
								NewBind.Position = UDim2.new(0.0606796145, 0, -0.0673758835, 0)
								NewBind.Size = UDim2.new(0, 404, 0, 21)
								NewBind.Font = Enum.Font.SourceSansBold
								NewBind.Text = name
								NewBind.TextColor3 = Color3.fromRGB(200, 200, 200)
								NewBind.TextSize = 14.000
								NewBind.TextWrapped = true
								NewBind.TextXAlignment = Enum.TextXAlignment.Left
								Bind.Name = "Bind"
								Bind.Font = Enum.Font.SourceSansBold
								Bind.Parent = NewBind
								Bind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								Bind.BackgroundTransparency = 1
								Bind.BorderSizePixel = 0
								Bind.Position = UDim2.new(0.938, 0,-0.095, 0)
								Bind.Size = UDim2.new(0, 25, 0, 25)
								Bind.Text = keyname
								Bind.TextSize = 16
								Bind.TextColor3 = Color3.fromRGB(255,255,255)
								local tog = false 
								local function fadeon()
									tween:Create(Bind,TweenInfo.new(0.2),{TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
									tween:Create(NewBind,TweenInfo.new(0.2),{TextColor3 = Color3.fromRGB(255,255,255)}):Play()
								end
								local function fadeoff()
									tween:Create(Bind,TweenInfo.new(0.2),{TextColor3 = maincolor}):Play()
									tween:Create(NewBind,TweenInfo.new(0.2),{TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
								end
								local function Bind1()
									Bind.Text = "..."
									local uis = game:GetService("UserInputService").InputBegan:wait()
									if uis.KeyCode.Name ~= "Unknown" and uis.UserInputType  == Enum.UserInputType.Keyboard then
										Bind.Text =  uis.KeyCode.Name
										key = uis.KeyCode
									end
									if callbackontype then
										callback(key)
									end
								end
								if  not callbackontype  then 
									game:GetService("UserInputService").InputBegan:connect(function(current, pressed)
										if not pressed then
											if current.KeyCode.Name == key.Name then
												callback(key)
											end
										end
									end)
								end 
								NewBind.MouseEnter:Connect(fadeon)
								NewBind.MouseLeave:Connect(fadeoff)
								Bind.MouseButton1Click:Connect(Bind1)
								NewBind.MouseButton1Click:Connect(Bind1)
							end
							function Element:Button(name,callback)
								local NewButton = Instance.new("TextButton")
								local btnRound = Instance.new("UICorner")
								NewButton.Name = "NewButton"
								NewButton.Parent = TabFrame
								NewButton.BackgroundColor3 = Color3.fromRGB(48,48,48)
								NewButton.BorderSizePixel = 0
								NewButton.Position = UDim2.new(0.144532919, 0, 0.00531914877, 0)
								NewButton.Size = UDim2.new(0, 404, 0, 21)
								NewButton.AutoButtonColor = false
								NewButton.Font = Enum.Font.SourceSansBold
								NewButton.Text = name 
								NewButton.TextColor3 = Color3.fromRGB(200,200,200)
								NewButton.TextSize = 14.000
								NewButton.Visible = true
								NewButton.ZIndex = 1
								btnRound.CornerRadius = UDim.new(0.12, 0)
								btnRound.Name = "btnRound"
								btnRound.Parent = NewButton
								local BtnIcon = Instance.new("ImageButton")
								BtnIcon.Name = "BtnIcon"
								BtnIcon.Parent = NewButton
								BtnIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								BtnIcon.BackgroundTransparency = 1
								BtnIcon.BorderSizePixel = 0
								BtnIcon.Position = UDim2.new(0.9455, 0,0.05, 0)
								BtnIcon.Size = UDim2.new(0, 19, 0, 19)
								BtnIcon.AutoButtonColor = false
								BtnIcon.ImageColor3 = Color3.fromRGB(200,200,200)
								BtnIcon.ZIndex = 5
								local function fadeon()
									tween:Create(NewButton,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{BackgroundColor3 = Color3.fromRGB(70,70,70),TextColor3 = Color3.fromRGB(255,255,255)}):Play()
									tween:Create(BtnIcon,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
					
								end
								local function fadeoff()
									tween:Create(NewButton,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{BackgroundColor3 = Color3.fromRGB(48,48,48),TextColor3 = Color3.fromRGB(200,200,200)}):Play()
									tween:Create(BtnIcon,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageColor3 = Color3.fromRGB(200,200,200)}):Play()	
								end
								NewButton.MouseEnter:Connect(fadeon)
								NewButton.MouseLeave:Connect(fadeoff)
								NewButton.MouseButton1Click:Connect(function()
									CircleClick(NewButton, Mouse.X, Mouse.Y)
									callback()
								end)
								BtnIcon.MouseButton1Click:Connect(function()
									CircleClick(NewButton, Mouse.X, Mouse.Y)
									callback()
								end)
							end
					
							function Element:Slider(nam,mi,ma,callbac)
								local name = nam or 'Slider'
								local min = mi or 1 
					
								local max = ma or 10
								local callback = callbac or function() end 
								local NewSlider = Instance.new("TextLabel")
								local SliderBackground = Instance.new("Frame")
					
								local SliderRound = Instance.new("UICorner")
								local Slide = Instance.new("ImageButton")
								local Des = Instance.new("TextLabel")
					
					
								NewSlider.Name = "NewSlider"
								NewSlider.Parent = TabFrame
								NewSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								NewSlider.BackgroundTransparency = 1
								NewSlider.Position = UDim2.new(0.0606796145, 0, -0.0673758835, 0)
								NewSlider.Size = UDim2.new(0, 404, 0, 21)
								NewSlider.Font = Enum.Font.SourceSansBold
								NewSlider.Text = name
								NewSlider.TextColor3 = Color3.fromRGB(200, 200, 200)
								NewSlider.TextSize = 14.000
								NewSlider.TextWrapped = true
								NewSlider.TextXAlignment = Enum.TextXAlignment.Left
					
								SliderBackground.Name = "SliderBackground"
								SliderBackground.Parent = NewSlider
								SliderBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
								SliderBackground.Position = UDim2.new(0.725247502, 0, 0.380952388, 0)
								SliderBackground.Size = UDim2.new(0, 95, 0, 4)
					
					
								SliderRound.CornerRadius = UDim.new(0.5, 0)
								SliderRound.Name = "SliderRound"
								SliderRound.Parent = SliderBackground
					
								Slide.Name = "Slide"
								Slide.Parent = SliderBackground
								Slide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								Slide.BackgroundTransparency = 1
								Slide.Position = UDim2.new(-7.4505806e-09, 0, -1.75, 0)
								Slide.Size = UDim2.new(0, 18, 0, 18)
								Slide.Image = "http://www.roblox.com/asset/?id=6031625146"
								local UIGradientMainColor6 = Instance.new("UIGradient")
					
								UIGradientMainColor6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(137, 0, 254)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(223, 0, 255))}
								UIGradientMainColor6.Parent = Slide
					
								Des.Name = "Des"
								Des.Parent = NewSlider
								Des.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								Des.BackgroundTransparency = 1
								Des.Position = UDim2.new(0.520, 0, -0.067, 0)
								Des.Size = UDim2.new(0, 55, 0, 21)
								Des.Font = Enum.Font.SourceSansBold
								Des.Text = min..'/'..max
								Des.TextColor3 = Color3.fromRGB(200, 200, 200)
								Des.TextSize = 14.000
								Des.TextWrapped = true
								Des.AutomaticSize = Enum.AutomaticSize.X
								Des.TextXAlignment = Enum.TextXAlignment.Right
								local down = false 
					
								local function fadeon()
									tween:Create(NewSlider,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{TextColor3 = Color3.fromRGB(255,255,255)}):Play()
									tween:Create(Des,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{TextColor3 = Color3.fromRGB(255,255,255)}):Play()
								end
								local function fadeoff()
									if down then return end 
									tween:Create(NewSlider,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{TextColor3 = Color3.fromRGB(200,200,200)}):Play()
									tween:Create(Des,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{TextColor3 = Color3.fromRGB(200,200,200)}):Play()
					
								end
								Des.MouseEnter:Connect(fadeon)
								NewSlider.MouseEnter:Connect(fadeon)
								Des.MouseLeave:Connect(fadeoff)
								NewSlider.MouseLeave:Connect(fadeoff)
					
								Slide.MouseButton1Down:connect(function()
									down = true
									fadeon()
									while down and game:GetService('RunService').RenderStepped:wait() do
										local percentage = math.clamp(((Mouse.X  - SliderBackground.AbsolutePosition.X) / (SliderBackground.AbsoluteSize.X)), 0,1)
					
										Slide:TweenPosition(UDim2.new(percentage - 0.1, 0, -1.75, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.05)
										tween:Create(Slide,TweenInfo.new(0.2),{Size = UDim2.new(0, 18, 0, 18),ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
										-- tween:Create(SliderBackground2,TweenInfo.new(0.05,Enum.EasingStyle.Sine),{Size = UDim2.new(SliderBackground.Size.X, 0, 4)}):Play()
					
										local value = (percentage * (max - min)) + min
										Des.Text = string.format("%d/%d", value, max)
										spawn(function()
											callback(value)
										end)
									end
								end)
								game:GetService("UserInputService").InputEnded:Connect(function(input)
									if input.UserInputType == Enum.UserInputType.MouseButton1 and down == true  then
										down = false
										wait()
										tween:Create(Slide,TweenInfo.new(0.2),{ImageColor3 = maincolor}):Play()
					
					
										fadeoff()
									end 
								end)
					
							end
							function Element:Drop(nam,lis,cb)
								local dropfunc = {}
								local name = tostring(nam) or math.random(1,5000)
								local list = lis or {}
								local callback = cb or function() end 
								local DropdownToggle = Instance.new("TextButton")
								local DropRound = Instance.new("UICorner")
								local DropToggleIcon = Instance.new("ImageButton")
								local DropRefresh = Instance.new("ImageButton")
								local DropList = Instance.new("ScrollingFrame")
								local DropListLayout = Instance.new("UIListLayout")
								local DropListRound = Instance.new("UICorner")
								DropdownToggle.Name = "DropdownToggle"
								DropdownToggle.Parent = TabFrame
								local UIGradientMainColor5 = Instance.new("UIGradient")
					
								UIGradientMainColor5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(137, 0, 254)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(223, 0, 255))}
								UIGradientMainColor5.Parent = DropdownToggle
								DropdownToggle.BorderSizePixel = 0
								DropdownToggle.Position = UDim2.new(-0.00239206385, 0, 0.0443262421, 0)
								DropdownToggle.Size = UDim2.new(0, 404, 0, 21)
								DropdownToggle.ZIndex = 5
								DropdownToggle.AutoButtonColor = false
								DropdownToggle.Font = Enum.Font.SourceSansBold
								DropdownToggle.Text = name 
								DropdownToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
								DropdownToggle.TextSize = 14.000
								DropRound.CornerRadius = UDim.new(0.150000006, 0)
								DropRound.Name = "DropRound"
								DropRound.Parent = DropdownToggle
								DropToggleIcon.Name = "DropToggleIcon"
								DropToggleIcon.Parent = DropdownToggle
								DropToggleIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								DropToggleIcon.BackgroundTransparency = 1
								DropToggleIcon.BorderSizePixel = 0
								DropToggleIcon.Position = UDim2.new(0.938118815, 0, -0.095238097, 0)
								DropToggleIcon.Size = UDim2.new(0, 25, 0, 25)
								DropToggleIcon.AutoButtonColor = false
								DropToggleIcon.Image = "http://www.roblox.com/asset/?id=6034818372"
								DropToggleIcon.ImageColor3 = Color3.fromRGB(0, 0, 0)
								DropToggleIcon.ZIndex = 5
					
					
								DropRefresh.Name = "DropdownRefreshButton"
								DropRefresh.Parent = DropdownToggle
								DropRefresh.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								DropRefresh.BackgroundTransparency = 1
								DropRefresh.BorderSizePixel = 0
								DropRefresh.Position = UDim2.new(0.89, 0, -0.095238097, 0)
								DropRefresh.Size = UDim2.new(0, 23, 0, 23)
								DropRefresh.AutoButtonColor = false
								DropRefresh.Image = "http://www.roblox.com/asset/?id=6031097226"
								DropRefresh.ImageColor3 = Color3.fromRGB(0, 0, 0)
								DropRefresh.ZIndex = 5
								DropRefresh.Visible = false 
								DropRefresh.ImageTransparency  = 1
								DropList.Name = "DropList"
								DropList.Parent = TabFrame
								DropList.Active = true
								DropList.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
								DropList.BorderSizePixel = 0
								DropList.Position = UDim2.new(0, 0, 1.16215849, 0)
								DropList.Size = UDim2.new(0, 404, 0, 0)
								DropList.Visible = false
								DropList.ZIndex = 1
								DropList.ScrollBarThickness = 2
								DropListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
									local absoluteSize = DropListLayout.AbsoluteContentSize
									DropList.CanvasSize = UDim2.new(0, absoluteSize.X, 0, absoluteSize.Y)
								end)
								DropListLayout.Name = "DropListLayout"
								DropListLayout.Parent = DropList
								DropListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
								DropListLayout.SortOrder = Enum.SortOrder.LayoutOrder
								DropListLayout.Padding = UDim.new(0,2)
								DropListRound.CornerRadius = UDim.new(0.150000006, 0)
								DropListRound.Name = "DropListRound"
								DropListRound.Parent = DropList
								local tog = false
								local function Close()
									tog = false
									tween:Create(DropToggleIcon,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{Rotation  = 0,ImageColor3 = Color3.fromRGB(0, 0, 0) }):Play()
									tween:Create(DropList,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
										Size = UDim2.new(0, 404, 0, 0)
									}):Play()
									wait(0.2)
									DropList.Visible = false
								end
								local function Check()
									CircleClick(DropdownToggle, Mouse.X, Mouse.Y)
									if tog == false then 
										tween:Create(DropRefresh,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{ImageTransparency  = 1}):Play()
										tog = true 
					
										tween:Create(DropToggleIcon,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{Rotation  = 180 ,ImageColor3 = Color3.fromRGB(50,50,50)}):Play()
										DropList.Visible = true 
										tween:Create(DropList,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
											Size = UDim2.new(0, 404, 0, 56)
										}):Play()
									else 
										Close()
										tween:Create(DropRefresh,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{ImageTransparency  = 0}):Play()
									end
								end
								local function add(v)
									local DropListBtn = Instance.new("TextButton")
									local UICorner = Instance.new("UICorner")
									DropListBtn.Name = "DropListBtn"
									DropListBtn.Parent = DropList
									DropListBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
									DropListBtn.Size = UDim2.new(0, 398,0, 17)
									DropListBtn.ZIndex = 1
									DropListBtn.AutoButtonColor = false
									DropListBtn.Font = Enum.Font.SourceSansBold
									DropListBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
									DropListBtn.TextSize = 12.000
									DropListBtn.Text = tostring(v)
									UICorner.CornerRadius = UDim.new(0.150000006, 0)
									UICorner.Parent = DropListBtn
									DropListBtn.MouseButton1Click:Connect(function()
										callback(tostring(v))
										Close()
									end)
									local function fadeon()
										tween:Create(DropListBtn,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{BackgroundColor3 = Color3.fromRGB(50,50,50)}):Play()
									end
									local function fadeoff()
										tween:Create(DropListBtn,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{BackgroundColor3 = Color3.fromRGB(50,50,50)}):Play()
									end
									DropListBtn.MouseEnter:Connect(fadeon)
									DropListBtn.MouseLeave:Connect(fadeoff)
								end
								local function clearlist()
									for i,v in next,DropList:GetChildren() do 
										if v:IsA("TextButton") then 
											v:Destroy()
										end
									end
								end
								local function refresh(list)
									clearlist()
									for i,v in next,list do 
										add(v)
									end
								end
								for i,v in pairs(list) do 
									add(v)
								end
								local old = DropToggleIcon.Position
								local function fadeon()
									if tog then return end
									tween:Create(DropRefresh,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{ImageTransparency  = 0}):Play()
									for i=1,2 do 
										tween:Create(DropToggleIcon,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Position = old + UDim2.new(0,0,0.2,0)}):Play()
										wait(0.1)
										tween:Create(DropToggleIcon,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Position = old}):Play()
										wait(0.1)
									end 
								end
								local function fadeoff()
									tween:Create(DropRefresh,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{ImageTransparency  = 1}):Play()
									--	tween:Create(DropdownToggle,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{BackgroundColor3 = maincolor}):Play()
								end
								DropdownToggle.MouseEnter:Connect(fadeon)
								DropdownToggle.MouseLeave:Connect(fadeoff)
								DropdownToggle.MouseButton1Click:Connect(Check)
								DropToggleIcon.MouseButton1Click:Connect(Check)
								-- Addition function
								function dropfunc:Clear()
									clearlist()
								end
								function dropfunc:Add(a)
									add(tostring(a))
								end
								function dropfunc:Remove(a)
									for i,v in next,DropList:GetChildren() do 
										if v:IsA("TextButton") and v.Text == tostring(a) then 
											v:Destroy()
										end
									end
								end
								function dropfunc:Refresh(list)
									refresh(list)
								end
								function dropfunc:on(path)
									DropRefresh.Visible = true 
									DropRefresh.MouseButton1Click:Connect(function()
										tween:Create(DropRefresh,TweenInfo.new(0.5,Enum.EasingStyle.Sine),{Rotation = DropRefresh.Rotation +  180 * 4}):Play()
										if  tostring(typeof(path)) == 'table' then 
											refresh(path)
										else 
											clearlist()
											for i,v in next,path:GetChildren() do
												add(v.Name)
											end
										end
									end)
								end
								return dropfunc
							end
							function  Element:h1(text,hidetext)
								local hide = hidetext or false  
								local h1Holder = Instance.new("Frame")
								local Line = Instance.new("Frame")
								local H1Text = Instance.new("TextLabel")
					
								h1Holder.Name = text
								h1Holder.Parent = TabFrame
								h1Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								h1Holder.BackgroundTransparency = 1.000
								h1Holder.Position = UDim2.new(0.0339805819, 0, 0.589999974, 0)
								h1Holder.Size = UDim2.new(0, 384, 0, 33)
					
								Line.Name = "Line"
								Line.Parent = h1Holder
								
								local UIGradientMainColor2 = Instance.new("UIGradient")
					
								UIGradientMainColor2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(137, 0, 254)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(223, 0, 255))}
								UIGradientMainColor2.Parent = Line
								Line.BorderSizePixel = 0
								Line.Position = UDim2.new(-0.0504904948, 0, 0.436788619, 0)
								Line.Size = UDim2.new(0, 421, 0, 2)
					
								H1Text.Name = "H1Text"
								H1Text.Parent = Line
								H1Text.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
								H1Text.Position = UDim2.new(0.39, 0,-4.833, 0)
								H1Text.Size = UDim2.new(0, 103, 0, 20)
								H1Text.Font = Enum.Font.SourceSansBold
								H1Text.Text = text or 'H1'
								H1Text.Visible = not hide 
								H1Text.BorderSizePixel = 0 
								H1Text.TextColor3 = Color3.fromRGB(255,255,255)
								H1Text.TextScaled = true
								H1Text.TextSize = 16.000
								H1Text.TextWrapped = true
							end
							function Element:Box(nam,callbac)
								local boxfunc = {}
								local name = tostring(nam) or"Box"
								local callback = callbac or function() end 
								local name = tostring(nam) or tostring(math.random(1,5000))
								local NewBox = Instance.new("TextButton")
								local Box = Instance.new("TextBox")
								local Hover = Instance.new("ImageLabel")		NewBox.Name = "NewBox"
								local Underline = Instance.new("Frame")
								Underline.Name = "Underline"
								Underline.Parent = Box
								local UIGradientMainColor3 = Instance.new("UIGradient")
					
								UIGradientMainColor3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(137, 0, 254)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(223, 0, 255))}
								UIGradientMainColor3.Parent = Underline
								Underline.Position = UDim2.new(0, 0, 0.952380955, 0)
								Underline.Size = UDim2.new(0, 0, 0, 1)
								Underline.Visible = true 
								Underline.AnchorPoint = Vector2.new(0,0)
								Underline.BorderSizePixel = 0
								NewBox.Parent = TabFrame
								NewBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								NewBox.BackgroundTransparency = 1
								NewBox.Position = UDim2.new(0.0606796145, 0, -0.0673758835, 0)
								NewBox.Size = UDim2.new(0, 404, 0, 21)
								NewBox.Font = Enum.Font.SourceSansBold
								NewBox.Text = name
								NewBox.TextColor3 = Color3.fromRGB(200, 200, 200)
								NewBox.TextSize = 14.000
								NewBox.TextWrapped = true
								NewBox.TextXAlignment = Enum.TextXAlignment.Left
								Box.Name = "Box"
								Box.Font = Enum.Font.Arial
								Box.Parent = NewBox
								Box.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
								Box.BorderSizePixel = 0
								Box.Position = UDim2.new(0.552, 0,0.048, 0)
								Box.Size = UDim2.new(0, 181,0, 20)
								Box.PlaceholderText = 'Text'
								Box.PlaceholderColor3  = Color3.fromRGB(90,90,90)
								Box.TextSize = 14
								Box.TextColor3 = Color3.fromRGB(255,255,255)
								Box.Text = ''
								local tog = false 
								local function fadeon()
									--	tween:Create(Box,TweenInfo.new(0.2),{ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
									tween:Create(NewBox,TweenInfo.new(0.2),{TextColor3 = Color3.fromRGB(255,255,255)}):Play()
								end
								local function fadeoff()
									--	tween:Create(Box,TweenInfo.new(0.2),{ImageColor3 = maincolor}):Play()	if not tog then 
									if not tog then 
										tween:Create(NewBox,TweenInfo.new(0.2),{TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
									end 
								end
								Box.MouseEnter:Connect(fadeon)
								Box.MouseLeave:Connect(fadeoff)
								NewBox.MouseEnter:Connect(fadeon)
								NewBox.MouseLeave:Connect(fadeoff)
								Box.Focused:Connect(function()
									tween:Create(Underline,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{Size = UDim2.new(0, 181, 0, 1) }):Play()
									tog = true 
									fadeon()
								end)
								Box.FocusLost:Connect(function()
									tween:Create(Underline,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{Size = UDim2.new(0, 0, 0, 1) }):Play()
									tog = false 
									fadeoff()
									callback(tostring(Box.Text))
								end)
								-- Additional Function 
								function  boxfunc:Refresh(new)
									Box.Text = new 
								end
								return boxfunc  
							end
							function  Element:Text(tex,ico)
								local vis = (ico ~= nil and true) or false 
								local icon = vis and tostring(ico) or ''
								local textfunc = {}
								local text = tex or 'TextValue'
								local NewText = Instance.new("TextLabel")
								local ImageLabel = Instance.new("ImageLabel")
					
								NewText.Name = "TextA"
								NewText.Parent = TabFrame
								NewText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								NewText.BackgroundTransparency = 1
								NewText.Position = UDim2.new(0.00364077673, 0, 0.109999999, 0)
								NewText.Size = UDim2.new(0, 409, 0, 30)
								NewText.Font = (vis and Enum.Font.SourceSansBold) or  Enum.Font.SourceSansBold
								NewText.Text = text 
								NewText.TextColor3 =  Color3.fromRGB(255, 255, 255)
								NewText.TextSize = 18.000
					
					
					
								ImageLabel.Parent = NewText
								ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								ImageLabel.BackgroundTransparency = 1.000
								ImageLabel.Position = UDim2.new(0.0366748162, 0, 0.100000009, 0)
								ImageLabel.Size = UDim2.new(0, 23, 0, 23)
								ImageLabel.Image = icon
								ImageLabel.Visible = vis 
					
								-- Additional Function 
								function  textfunc:Refresh(new,ico1)
									local vis1 = (ico1 ~= nil and true) or false 
									local icon1 = vis and tostring(ico1) or ''
					
									NewText.Text = new 
									ImageLabel.Image  =( vis1 and icon1) or icon 
								end
								return textfunc  
							end
							function Element:Toggle(nam,callback)
								local togfunc = {}
								local name = tostring(nam) or tostring(math.random(1,5000))
								local NewToggle = Instance.new("TextButton")
								local Toggle = Instance.new("ImageButton")
								local Hover = Instance.new("ImageLabel")		NewToggle.Name = "NewToggle"
								NewToggle.Parent = TabFrame
								NewToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								NewToggle.BackgroundTransparency = 1
								NewToggle.Position = UDim2.new(0.0606796145, 0, -0.0673758835, 0)
								NewToggle.Size = UDim2.new(0, 404, 0, 21)
								NewToggle.Font = Enum.Font.SourceSansBold
								NewToggle.Text = name
								NewToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
								NewToggle.TextSize = 14.000
								NewToggle.TextWrapped = true
								NewToggle.TextXAlignment = Enum.TextXAlignment.Left
								Toggle.Name = "Toggle"
								Toggle.Parent = NewToggle
								Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								Toggle.BackgroundTransparency = 1
								Toggle.BorderSizePixel = 0
								Toggle.Position = UDim2.new(0.938118815, 0, -0.095238097, 0)
								Toggle.Size = UDim2.new(0, 25, 0, 25)
								Toggle.AutoButtonColor = false
								Toggle.Image = "http://www.roblox.com/asset/?id=6031068420"
								local UIGradientMainColor4 = Instance.new("UIGradient")
					
								UIGradientMainColor4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(137, 0, 254)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(223, 0, 255))}
								UIGradientMainColor4.Parent = Toggle
								Toggle.ImageTransparency  = 0 
								local tog = false 
								local function fadeon()
									tween:Create(Toggle,TweenInfo.new(0.2),{ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
									tween:Create(NewToggle,TweenInfo.new(0.2),{TextColor3 = Color3.fromRGB(255,255,255)}):Play()
								end
								local function fadeoff()
									tween:Create(Toggle,TweenInfo.new(0.2),{ImageColor3 = maincolor}):Play()
									tween:Create(NewToggle,TweenInfo.new(0.2),{TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
								end
								local function toggle()
									tween:Create(Toggle,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{ImageTransparency  = 1 }):Play()
									wait(0.1) 
									if tog == false then 
										tog = true 
										Toggle.Image = 'http://www.roblox.com/asset/?id=6031068421'
									else 
										tog = false 
										Toggle.Image = "http://www.roblox.com/asset/?id=6031068420"
									end
									tween:Create(Toggle,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{ImageTransparency  = 0 }):Play()
					
									callback(tog)
					
								end
								Toggle.MouseEnter:Connect(fadeon)
								Toggle.MouseLeave:Connect(fadeoff)
								NewToggle.MouseEnter:Connect(fadeon)
								NewToggle.MouseLeave:Connect(fadeoff)
								Toggle.MouseButton1Click:Connect(toggle)
								NewToggle.MouseButton1Click:Connect(toggle) 
					
								-- Additional Function 
								function togfunc:Set(a)
									Toggle.Image = (a == true and "http://www.roblox.com/asset/?id=6031068421" or "http://www.roblox.com/asset/?id=6031068420" )
									tog = a  
					
									callback(tog)
					
								end
								return togfunc 
							end
							return Element
						end
						return TabHandler
					end
					
					local Demon = library:NewWindow("Dragon Hub","")
					local AutoFarm = Demon:NewSection("Auto Farm")
					local Stat = Demon:NewSection("Combat")
					local Teleport = Demon:NewSection("Teleport")
					local Misc = Demon:NewSection("Visuals")
					local Buy = Demon:NewSection("Misc")
					local Settings = Demon:NewSection("Settings")
					
					local games = {
						[2753915549] = {
							Title = "Blox Fruits",
							Icons = "C",
							Welcome = function()
								return tostring(
									"<Color=Purple>Welcome " ..
										"<Color=Purple>" ..
										game:GetService("Players").LocalPlayer.Name .. "!" .. " \n<Color=Blue>Demon Hub"
								)
							end
						}
					}
					if games[game.PlaceId] then
						if games[game.PlaceId].Title == "Blox Fruits" then
							local function notify(types, ...)
								if types == "Notify" then
									require(game.ReplicatedStorage.Notification).new(...):Display()
								end
							end
							notify("Notify", games[game.PlaceId].Welcome())
						end
					end
					
					local gamesz = {
						[4442272183] = {
							Title = "Blox Fruits",
							Icons = "C",
							Welcome = function()
								return tostring(
									"<Color=Purple>Welcome " ..
										"<Color=Purple>" ..
										game:GetService("Players").LocalPlayer.Name .. "!" .. " \n<Color=Blue>Dragon Hub")
							end
						}
					}
					if gamesz[game.PlaceId] then
						if gamesz[game.PlaceId].Title == "Blox Fruits" then
							local function notify(types, ...)
								if types == "Notify" then
									require(game.ReplicatedStorage.Notification).new(...):Display()
								end
							end
							notify("Notify", gamesz[game.PlaceId].Welcome())
						end
					end
					
					AFM = nil
					AutoNew = nil
					AutoFactory = nil
					Core = nil
					Superhuman = nil
					DeathStep = nil
					AutoSaber = nil
					AutoAccessories = nil
					AutoRengoku = nil
					FarmBoss = nil
					AutoBartilo = nil
					AutoSharkman = nil
					AutoFramEctoplasm = nil
					GunMastery = nil
					FruitMastery = nil
					TpChest = nil
					
					local VirtualUser = game:GetService("VirtualUser")
					local placeId = game.PlaceId
					if placeId == 2753915549 then
						OldWorld = true
					elseif placeId == 4442272183 then
						NewWorld = true
					end
					Magnet = true
					function CheckQuest()
						local MyLevel = game.Players.localPlayer.Data.Level.Value
						if OldWorld then
							if MyLevel == 1 or MyLevel <= 9 then -- Bandit
								Ms = "Bandit [Lv. 5]"
								NaemQuest = "BanditQuest1"
								LevelQuest = 1
								NameMon = "Bandit"
								CFrameQuest = CFrame.new(1061.66699, 16.5166187, 1544.52905, -0.942978859, -3.33851502e-09, 0.332852632, 7.04340497e-09, 1, 2.99841325e-08, -0.332852632, 3.06188177e-08, -0.942978859)
								CFrameMon = CFrame.new(1199.31287, 52.2717781, 1536.91516, -0.929782331, 6.60215846e-08, -0.368109822, 3.9077392e-08, 1, 8.06501603e-08, 0.368109822, 6.06023249e-08, -0.929782331)
							elseif MyLevel == 10 or MyLevel <= 14 then -- Monkey
								Ms = "Monkey [Lv. 14]"
								NaemQuest = "JungleQuest"
								LevelQuest = 1
								NameMon = "Monkey"
								CFrameQuest = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
								CFrameMon = CFrame.new(-1402.74609, 98.5633316, 90.6417007, 0.836947978, 0, 0.547282517, -0, 1, -0, -0.547282517, 0, 0.836947978)
							elseif MyLevel == 15 or MyLevel <= 29 then -- Gorilla
								Ms = "Gorilla [Lv. 20]"
								NaemQuest = "JungleQuest"
								LevelQuest = 2
								NameMon = "Gorilla"
								CFrameQuest = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
								CFrameMon = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
							elseif MyLevel == 30 or MyLevel <= 39 then -- Pirate
								Ms = "Pirate [Lv. 35]"
								NaemQuest = "BuggyQuest1"
								LevelQuest = 1
								NameMon = "Pirate"
								CFrameQuest = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
								CFrameMon = CFrame.new(-1219.32324, 4.75205183, 3915.63452, -0.966492832, -6.91238853e-08, 0.25669381, -5.21195496e-08, 1, 7.3047012e-08, -0.25669381, 5.72206496e-08, -0.966492832)
							elseif MyLevel == 40 or MyLevel <= 59 then -- Brute
								Ms = "Brute [Lv. 45]"
								NaemQuest = "BuggyQuest1"
								LevelQuest = 2
								NameMon = "Brute"
								CFrameQuest = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
								CFrameMon = CFrame.new(-1146.49646, 96.0936813, 4312.1333, -0.978175163, -1.53222057e-08, 0.207781896, -3.33316912e-08, 1, -8.31738873e-08, -0.207781896, -8.82843523e-08, -0.978175163)
							elseif MyLevel == 60 or MyLevel <= 74 then -- Desert Bandit
								Ms = "Desert Bandit [Lv. 60]"
								NaemQuest = "DesertQuest"
								LevelQuest = 1
								NameMon = "Desert Bandit"
								CFrameQuest = CFrame.new(897.031128, 6.43846416, 4388.97168, -0.804044724, 3.68233266e-08, 0.594568789, 6.97835176e-08, 1, 3.24365246e-08, -0.594568789, 6.75715199e-08, -0.804044724)
								CFrameMon = CFrame.new(932.788818, 6.4503746, 4488.24609, -0.998625934, 3.08948351e-08, 0.0524050146, 2.79967303e-08, 1, -5.60361286e-08, -0.0524050146, -5.44919629e-08, -0.998625934)
							elseif MyLevel == 75 or MyLevel <= 89 then -- Desert Officre
								Ms = "Desert Officer [Lv. 70]"
								NaemQuest = "DesertQuest"
								LevelQuest = 2
								NameMon = "Desert Officer"
								CFrameQuest = CFrame.new(897.031128, 6.43846416, 4388.97168, -0.804044724, 3.68233266e-08, 0.594568789, 6.97835176e-08, 1, 3.24365246e-08, -0.594568789, 6.75715199e-08, -0.804044724)
								CFrameMon = CFrame.new(1580.03198, 4.61375761, 4366.86426, 0.135744005, -6.44280718e-08, -0.990743816, 4.35738308e-08, 1, -5.90598574e-08, 0.990743816, -3.51534837e-08, 0.135744005)
							elseif MyLevel == 90 or MyLevel <= 99 then -- Snow Bandits
								Ms = "Snow Bandit [Lv. 90]"
								NaemQuest = "SnowQuest"
								LevelQuest = 1
								NameMon = "Snow Bandits"
								CFrameQuest = CFrame.new(1384.14001, 87.272789, -1297.06482, 0.348555952, -2.53947841e-09, -0.937287986, 1.49860568e-08, 1, 2.86358204e-09, 0.937287986, -1.50443711e-08, 0.348555952)
								CFrameMon = CFrame.new(1370.24316, 102.403511, -1411.52905, 0.980274439, -1.12995728e-08, 0.197641045, -9.57343449e-09, 1, 1.04655214e-07, -0.197641045, -1.04482936e-07, 0.980274439)
							elseif MyLevel == 100 or MyLevel <= 119 then -- Snowman
								Ms = "Snowman [Lv. 100]"
								NaemQuest = "SnowQuest"
								LevelQuest = 2
								NameMon = "Snowman"
								CFrameQuest = CFrame.new(1384.14001, 87.272789, -1297.06482, 0.348555952, -2.53947841e-09, -0.937287986, 1.49860568e-08, 1, 2.86358204e-09, 0.937287986, -1.50443711e-08, 0.348555952)
								CFrameMon = CFrame.new(1370.24316, 102.403511, -1411.52905, 0.980274439, -1.12995728e-08, 0.197641045, -9.57343449e-09, 1, 1.04655214e-07, -0.197641045, -1.04482936e-07, 0.980274439)
							elseif MyLevel == 120 or MyLevel <= 149 then -- Chief Petty Officer
								Ms = "Chief Petty Officer [Lv. 120]"
								NaemQuest = "MarineQuest2"
								LevelQuest = 1
								NameMon = "Chief Petty Officer"
								CFrameQuest = CFrame.new(-5035.0835, 28.6520386, 4325.29443, 0.0243340395, -7.08064647e-08, 0.999703884, -6.36926814e-08, 1, 7.23777944e-08, -0.999703884, -6.54350671e-08, 0.0243340395)
								CFrameMon = CFrame.new(-4882.8623, 22.6520386, 4255.53516, 0.273695946, -5.40380647e-08, -0.96181643, 4.37720793e-08, 1, -4.37274998e-08, 0.96181643, -3.01326679e-08, 0.273695946)
							elseif MyLevel == 150 or MyLevel <= 174 then -- Sky Bandit
								Ms = "Sky Bandit [Lv. 150]"
								NaemQuest = "SkyQuest"
								LevelQuest = 1
								NameMon = "Sky Bandit"
								CFrameQuest = CFrame.new(-4841.83447, 717.669617, -2623.96436, -0.875942111, 5.59710216e-08, -0.482416272, 3.04023082e-08, 1, 6.08195947e-08, 0.482416272, 3.86078725e-08, -0.875942111)
								CFrameMon = CFrame.new(-4970.74219, 294.544342, -2890.11353, -0.994874597, -8.61311236e-08, -0.101116329, -9.10836206e-08, 1, 4.43614923e-08, 0.101116329, 5.33441664e-08, -0.994874597)
							elseif MyLevel == 175 or MyLevel <= 224 then -- Dark Master
								Ms = "Dark Master [Lv. 175]"
								NaemQuest = "SkyQuest"
								LevelQuest = 2
								NameMon = "Dark Master"
								CFrameQuest = CFrame.new(-4841.83447, 717.669617, -2623.96436, -0.875942111, 5.59710216e-08, -0.482416272, 3.04023082e-08, 1, 6.08195947e-08, 0.482416272, 3.86078725e-08, -0.875942111)
								CFrameMon = CFrame.new(-5220.58594, 430.693298, -2278.17456, -0.925375521, 1.12086873e-08, 0.379051805, -1.05115507e-08, 1, -5.52320891e-08, -0.379051805, -5.50948407e-08, -0.925375521)
							elseif MyLevel == 225 or MyLevel <= 274 then -- Toga Warrior
								Ms = "Toga Warrior [Lv. 225]"
								NaemQuest = "ColosseumQuest"
								LevelQuest = 1
								NameMon = "Toga Warrior"
								CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
								CFrameMon = CFrame.new(-1779.97583, 44.6077499, -2736.35474, 0.984437346, 4.10396339e-08, 0.175734788, -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, 0.984437346)
							elseif MyLevel == 275 or MyLevel <= 299 then -- Gladiato
								Ms = "Gladiator [Lv. 275]"
								NaemQuest = "ColosseumQuest"
								LevelQuest = 2
								NameMon = "Gladiato"
								CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
								CFrameMon = CFrame.new(-1274.75903, 58.1895943, -3188.16309, 0.464524001, 6.21005611e-08, 0.885560572, -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, 0.464524001)
							elseif MyLevel == 300 or MyLevel <= 329 then -- Military Soldier
								Ms = "Military Soldier [Lv. 300]"
								NaemQuest = "MagmaQuest"
								LevelQuest = 1
								NameMon = "Military Soldier"
								CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
								CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814, 9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
							elseif MyLevel == 300 or MyLevel <= 374 then -- Military Spy
								Ms = "Military Spy [Lv. 330]"
								NaemQuest = "MagmaQuest"
								LevelQuest = 2
								NameMon = "Military Spy"
								CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
								CFrameMon = CFrame.new(-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, 0.982100308, -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
							elseif MyLevel == 375 or MyLevel <= 399 then -- Fishman Warrior
								Ms = "Fishman Warrior [Lv. 375]"
								NaemQuest = "FishmanQuest"
								LevelQuest = 1
								NameMon = "Fishman Warrior"
								CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
								CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.91687, -0.0817126185, 8.90751153e-08, 0.996655822, 2.00889794e-08, 1, -8.77269599e-08, -0.996655822, 1.28533992e-08, -0.0817126185)
							elseif MyLevel == 400 or MyLevel <= 449 then -- Fishman Commando
								Ms = "Fishman Commando [Lv. 400]"
								NaemQuest = "FishmanQuest"
								LevelQuest = 2
								NameMon = "Fishman Commando"
								CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
								CFrameMon = CFrame.new(61885.5039, 18.4828243, 1504.17896, 0.577502489, 0, -0.816389024, -0, 1.00000012, -0, 0.816389024, 0, 0.577502489)
							elseif MyLevel == 450 or MyLevel <= 474 then -- God's Guards
								Ms = "God's Guard [Lv. 450]"
								NaemQuest = "SkyExp1Quest"
								LevelQuest = 1
								NameMon = "God's Guards"
								CFrameQuest = CFrame.new(-4721.71436, 845.277161, -1954.20105, -0.999277651, -5.56969759e-09, 0.0380011722, -4.14751478e-09, 1, 3.75035256e-08, -0.0380011722, 3.73188307e-08, -0.999277651)
								CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.92542, -0.93441087, -6.77488776e-09, -0.356197298, 1.12145182e-08, 1, -4.84390199e-08, 0.356197298, -4.92565206e-08, -0.93441087)
							elseif MyLevel == 475 or MyLevel <= 524 then -- Shandas
								Ms = "Shanda [Lv. 475]"
								NaemQuest = "SkyExp1Quest"
								LevelQuest = 2
								NameMon = "Shandas"
								CFrameQuest = CFrame.new(-7863.63672, 5545.49316, -379.826324, 0.362120807, -1.98046344e-08, -0.93213129, 4.05822291e-08, 1, -5.48095125e-09, 0.93213129, -3.58431969e-08, 0.362120807)
								CFrameMon = CFrame.new(-7685.12354, 5601.05127, -443.171509, 0.150056243, 1.79768236e-08, -0.988677442, 6.67798661e-09, 1, 1.91962481e-08, 0.988677442, -9.48289181e-09, 0.150056243)
							elseif MyLevel == 525 or MyLevel <= 549 then -- Royal Squad
								Ms = "Royal Squad [Lv. 525]"
								NaemQuest = "SkyExp2Quest"
								LevelQuest = 1
								NameMon = "Royal Squad"
								CFrameQuest = CFrame.new(-7902.66895, 5635.96387, -1411.71802, 0.0504222959, 2.5710392e-08, 0.998727977, 1.12541557e-07, 1, -3.14249675e-08, -0.998727977, 1.13982921e-07, 0.0504222959)
								CFrameMon = CFrame.new(-7685.02051, 5606.87842, -1442.729, 0.561947823, 7.69527464e-09, -0.827172697, -4.24974544e-09, 1, 6.41599973e-09, 0.827172697, -9.01838604e-11, 0.561947823)
							elseif MyLevel == 550 or MyLevel <= 624 then -- Royal Soldier
								Ms = "Royal Soldier [Lv. 550]"
								NaemQuest = "SkyExp2Quest"
								LevelQuest = 2
								NameMon = "Royal Soldier"
								CFrameQuest = CFrame.new(-7902.66895, 5635.96387, -1411.71802, 0.0504222959, 2.5710392e-08, 0.998727977, 1.12541557e-07, 1, -3.14249675e-08, -0.998727977, 1.13982921e-07, 0.0504222959)
								CFrameMon = CFrame.new(-7864.44775, 5661.94092, -1708.22351, 0.998389959, 2.28686137e-09, -0.0567218624, 1.99431383e-09, 1, 7.54200258e-08, 0.0567218624, -7.54117195e-08, 0.998389959)
							elseif MyLevel == 625 or MyLevel <= 649 then -- Galley Pirate
								Ms = "Galley Pirate [Lv. 625]"
								NaemQuest = "FountainQuest"
								LevelQuest = 1
								NameMon = "Galley Pirate"
								CFrameQuest = CFrame.new(5254.60156, 38.5011406, 4049.69678, -0.0504891425, -3.62066501e-08, -0.998724639, -9.87921389e-09, 1, -3.57534553e-08, 0.998724639, 8.06145284e-09, -0.0504891425)
								CFrameMon = CFrame.new(5595.06982, 41.5013695, 3961.47095, -0.992138803, -2.11610267e-08, -0.125142589, -1.34249509e-08, 1, -6.26613996e-08, 0.125142589, -6.04887518e-08, -0.992138803)
							elseif MyLevel >= 650 then -- Galley Captain
								Ms = "Galley Captain [Lv. 650]"
								NaemQuest = "FountainQuest"
								LevelQuest = 2
								NameMon = "Galley Captain"
								CFrameQuest = CFrame.new(5254.60156, 38.5011406, 4049.69678, -0.0504891425, -3.62066501e-08, -0.998724639, -9.87921389e-09, 1, -3.57534553e-08, 0.998724639, 8.06145284e-09, -0.0504891425)
								CFrameMon = CFrame.new(5658.5752, 38.5361786, 4928.93506, -0.996873081, 2.12391046e-06, -0.0790185928, 2.16989656e-06, 1, -4.96097414e-07, 0.0790185928, -6.66008248e-07, -0.996873081)
							end
						end
						if NewWorld then
							if MyLevel == 700 or MyLevel <= 724 then -- Raider [Lv. 700]
								Ms = "Raider [Lv. 700]"
								NaemQuest = "Area1Quest"
								LevelQuest = 1
								NameMon = "Raider"
								CFrameQuest = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
								CFrameMon = CFrame.new(-737.026123, 39.1748352, 2392.57959, 0.272128761, 0, -0.962260842, -0, 1, -0, 0.962260842, 0, 0.272128761)
							elseif MyLevel == 725 or MyLevel <= 774 then -- Mercenary [Lv. 725]
								Ms = "Mercenary [Lv. 725]"
								NaemQuest = "Area1Quest"
								LevelQuest = 2
								NameMon = "Mercenary"
								CFrameQuest = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
								CFrameMon = CFrame.new(-973.731995, 95.8733215, 1836.46936, 0.999135971, 2.02326991e-08, -0.0415605344, -1.90767793e-08, 1, 2.82094952e-08, 0.0415605344, -2.73922804e-08, 0.999135971)
							elseif MyLevel == 775 or MyLevel <= 799 then -- Swan Pirate [Lv. 775]
								Ms = "Swan Pirate [Lv. 775]"
								NaemQuest = "Area2Quest"
								LevelQuest = 1
								NameMon = "Swan Pirate"
								CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
								CFrameMon = CFrame.new(970.369446, 142.653198, 1217.3667, 0.162079468, -4.85452638e-08, -0.986777723, 1.03357589e-08, 1, -4.74980872e-08, 0.986777723, -2.50063148e-09, 0.162079468)
							elseif MyLevel == 800 or MyLevel <= 874 then -- Factory Staff [Lv. 800]
								Ms = "Factory Staff [Lv. 800]"
								NaemQuest = "Area2Quest"
								LevelQuest = 2
								NameMon = "Factory Staff"
								CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
								CFrameMon = CFrame.new(296.786499, 72.9948196, -57.1298141, -0.876037002, -5.32364979e-08, 0.482243896, -3.87658332e-08, 1, 3.99718729e-08, -0.482243896, 1.63222538e-08, -0.876037002)
							elseif MyLevel == 875 or MyLevel <= 899 then -- Marine Lieutenant [Lv. 875]
								Ms = "Marine Lieutenant [Lv. 875]"
								NaemQuest = "MarineQuest3"
								LevelQuest = 1
								NameMon = "Marine Lieutenant"
								CFrameQuest = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
								CFrameMon = CFrame.new(-2913.26367, 73.0011826, -2971.64282, 0.910507619, 0, 0.413492233, 0, 1.00000012, 0, -0.413492233, 0, 0.910507619)
							elseif MyLevel == 900 or MyLevel <= 949 then -- Marine Captain [Lv. 900]
								Ms = "Marine Captain [Lv. 900]"
								NaemQuest = "MarineQuest3"
								LevelQuest = 2
								NameMon = "Marine Captain"
								CFrameQuest = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
								CFrameMon = CFrame.new(-1868.67688, 73.0011826, -3321.66333, -0.971402287, 1.06502087e-08, 0.237439692, 3.68856199e-08, 1, 1.06050372e-07, -0.237439692, 1.11775684e-07, -0.971402287)
							elseif MyLevel == 950 or MyLevel <= 974 then -- Zombie [Lv. 950]
								Ms = "Zombie [Lv. 950]"
								NaemQuest = "ZombieQuest"
								LevelQuest = 1
								NameMon = "Zombie"
								CFrameQuest = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
								CFrameMon = CFrame.new(-5634.83838, 126.067039, -697.665039, -0.992770672, 6.77618939e-09, 0.120025545, 1.65461245e-08, 1, 8.04023372e-08, -0.120025545, 8.18070234e-08, -0.992770672)
							elseif MyLevel == 975 or MyLevel <= 999 then -- Vampire [Lv. 975]
								Ms = "Vampire [Lv. 975]"
								NaemQuest = "ZombieQuest"
								LevelQuest = 2
								NameMon = "Vampire"
								CFrameQuest = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
								CFrameMon = CFrame.new(-6030.32031, 6.4377408, -1313.5564, -0.856965423, 3.9138893e-08, -0.515373945, -1.12178942e-08, 1, 9.45958547e-08, 0.515373945, 8.68467822e-08, -0.856965423)
							elseif MyLevel == 1000 or MyLevel <= 1049 then -- Snow Trooper [Lv. 1000] **
								Ms = "Snow Trooper [Lv. 1000]"
								NaemQuest = "SnowMountainQuest"
								LevelQuest = 1
								NameMon = "Snow Trooper"
								CFrameQuest = CFrame.new(604.964966, 401.457062, -5371.69287, 0.353063971, 1.89520435e-08, -0.935599446, -5.81846002e-08, 1, -1.70033754e-09, 0.935599446, 5.50377841e-08, 0.353063971)
								CFrameMon = CFrame.new(535.893433, 401.457062, -5329.6958, -0.999524176, 0, 0.0308452044, 0, 1, -0, -0.0308452044, 0, -0.999524176)
							elseif MyLevel == 1050 or MyLevel <= 1099 then -- Winter Warrior [Lv. 1050]
								Ms = "Winter Warrior [Lv. 1050]"
								NaemQuest = "SnowMountainQuest"
								LevelQuest = 2
								NameMon = "Winter Warrior"
								CFrameQuest = CFrame.new(604.964966, 401.457062, -5371.69287, 0.353063971, 1.89520435e-08, -0.935599446, -5.81846002e-08, 1, -1.70033754e-09, 0.935599446, 5.50377841e-08, 0.353063971)
								CFrameMon = CFrame.new(1223.7417, 454.575226, -5170.02148, 0.473996818, 2.56845354e-08, 0.880526543, -5.62456428e-08, 1, 1.10811016e-09, -0.880526543, -5.00510211e-08, 0.473996818)
							elseif MyLevel == 1100 or MyLevel <= 1124 then -- Lab Subordinate [Lv. 1100]
								Ms = "Lab Subordinate [Lv. 1100]"
								NaemQuest = "IceSideQuest"
								LevelQuest = 1
								NameMon = "Lab Subordinate"
								CFrameQuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
								CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721, -0.569419742, -2.49055017e-08, 0.822046936, -6.96206541e-08, 1, -1.79282633e-08, -0.822046936, -6.74401548e-08, -0.569419742)
							elseif MyLevel == 1125 or MyLevel <= 1174 then -- Horned Warrior [Lv. 1125]
								Ms = "Horned Warrior [Lv. 1125]"
								NaemQuest = "IceSideQuest"
								LevelQuest = 2
								NameMon = "Horned Warrior"
								CFrameQuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
								CFrameMon = CFrame.new(-6400.85889, 24.7645149, -5818.63574, -0.964845479, 8.65926566e-08, -0.262817472, 3.98261392e-07, 1, -1.13260398e-06, 0.262817472, -1.19745812e-06, -0.964845479)
							elseif MyLevel == 1175 or MyLevel <= 1199 then -- Magma Ninja [Lv. 1175]
								Ms = "Magma Ninja [Lv. 1175]"
								NaemQuest = "FireSideQuest"
								LevelQuest = 1
								NameMon = "Magma Ninja"
								CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
								CFrameMon = CFrame.new(-5496.65576, 58.6890411, -5929.76855, -0.885073781, 0, -0.465450764, 0, 1.00000012, -0, 0.465450764, 0, -0.885073781)
							elseif MyLevel == 1200 or MyLevel <= 1249 then -- Lava Pirate [Lv. 1200]
								Ms = "Lava Pirate [Lv. 1200]"
								NaemQuest = "FireSideQuest"
								LevelQuest = 2
								NameMon = "Lava Pirate"
								CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
								CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633, -0.196780294, 0, 0.98044765, 0, 1.00000012, -0, -0.98044765, 0, -0.196780294)
							elseif MyLevel == 1250 or MyLevel <= 1274 then -- Ship Deckhand [Lv. 1250]
								Ms = "Ship Deckhand [Lv. 1250]"
								NaemQuest = "ShipQuest1"
								LevelQuest = 1
								NameMon = "Ship Deckhand"
								CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
								CFrameMon = CFrame.new(1163.80872, 138.288452, 33058.4258, -0.998580813, 5.49076979e-08, -0.0532564968, 5.57436763e-08, 1, -1.42118655e-08, 0.0532564968, -1.71604082e-08, -0.998580813)
							elseif MyLevel == 1275 or MyLevel <= 1299 then -- Ship Engineer [Lv. 1275]
								Ms = "Ship Engineer [Lv. 1275]"
								NaemQuest = "ShipQuest1"
								LevelQuest = 2
								NameMon = "Ship Engineer"
								CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
								CFrameMon = CFrame.new(916.666504, 44.0920448, 32917.207, -0.99746871, -4.85034697e-08, -0.0711069331, -4.8925461e-08, 1, 4.19294288e-09, 0.0711069331, 7.66126895e-09, -0.99746871)
							elseif MyLevel == 1300 or MyLevel <= 1324 then -- Ship Steward [Lv. 1300]
								Ms = "Ship Steward [Lv. 1300]"
								NaemQuest = "ShipQuest2"
								LevelQuest = 1
								NameMon = "Ship Steward"
								CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
								CFrameMon = CFrame.new(918.743286, 129.591064, 33443.4609, -0.999792814, -1.7070947e-07, -0.020350717, -1.72559169e-07, 1, 8.91351277e-08, 0.020350717, 9.2628369e-08, -0.999792814)
							elseif MyLevel == 1325 or MyLevel <= 1349 then -- Ship Officer [Lv. 1325]
								Ms = "Ship Officer [Lv. 1325]"
								NaemQuest = "ShipQuest2"
								LevelQuest = 2
								NameMon = "Ship Officer"
								CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
								CFrameMon = CFrame.new(786.051941, 181.474106, 33303.2969, 0.999285698, -5.32193063e-08, 0.0377905183, 5.68968588e-08, 1, -9.62386864e-08, -0.0377905183, 9.83201005e-08, 0.999285698)
							elseif MyLevel == 1350 or MyLevel <= 1374 then -- Arctic Warrior [Lv. 1350]
								Ms = "Arctic Warrior [Lv. 1350]"
								NaemQuest = "FrostQuest"
								LevelQuest = 1
								NameMon = "Arctic Warrior"
								CFrameQuest = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
								CFrameMon = CFrame.new(5995.07471, 57.3188477, -6183.47314, 0.702747107, -1.53454167e-07, -0.711440146, -1.08168464e-07, 1, -3.22542007e-07, 0.711440146, 3.03620908e-07, 0.702747107)
							elseif MyLevel == 1375 or MyLevel <= 1424 then -- Snow Lurker [Lv. 1375]
								Ms = "Snow Lurker [Lv. 1375]"
								NaemQuest = "FrostQuest"
								LevelQuest = 2
								NameMon = "Snow Lurker"
								CFrameQuest = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
								CFrameMon = CFrame.new(5518.00684, 60.5559731, -6828.80518, -0.650781393, -3.64292951e-08, 0.759265184, -4.07668654e-09, 1, 4.44854642e-08, -0.759265184, 2.58550248e-08, -0.650781393)
							elseif MyLevel == 1425 or MyLevel <= 1449 then -- Sea Soldier [Lv. 1425]
								Ms = "Sea Soldier [Lv. 1425]"
								NaemQuest = "ForgottenQuest"
								LevelQuest = 1
								NameMon = "Sea Soldier"
								CFrameQuest = CFrame.new(-3052.99097, 236.881363, -10148.1943, -0.997911751, 4.42321983e-08, 0.064591676, 4.90968759e-08, 1, 7.37270085e-08, -0.064591676, 7.67442998e-08, -0.997911751)
								CFrameMon = CFrame.new(-3029.78467, 66.944252, -9777.38184, -0.998552859, 1.09555076e-08, 0.0537791774, 7.79564235e-09, 1, -5.89660658e-08, -0.0537791774, -5.84614881e-08, -0.998552859)
							elseif MyLevel >= 1450 then -- Water Fighter [Lv. 1450]
								Ms = "Water Fighter [Lv. 1450]"
								NaemQuest = "ForgottenQuest"
								LevelQuest = 2
								NameMon = "Water Fighter"
								CFrameQuest = CFrame.new(-3052.99097, 236.881363, -10148.1943, -0.997911751, 4.42321983e-08, 0.064591676, 4.90968759e-08, 1, 7.37270085e-08, -0.064591676, 7.67442998e-08, -0.997911751)
								CFrameMon = CFrame.new(-3262.00098, 298.699615, -10553.6943, -0.233570755, -4.57538185e-08, 0.972339869, -5.80986068e-08, 1, 3.30992194e-08, -0.972339869, -4.87605725e-08, -0.233570755)
							end
						end
					end
					
					local LocalPlayer = game:GetService("Players").LocalPlayer
					local VirtualUser = game:GetService('VirtualUser')
					
					AutoFarm:h1("Auto Farm")
					
					AutoFarm:Toggle("Auto Farm Level",function(vu)
						local args = {
							[1] = "AbandonQuest"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						AFM = vu
						AFMmain = vu
					end)
					
					game:GetService("RunService").Heartbeat:Connect(function()
						if AFM or FarmBoss then
							if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
							end
						end
					end)
					
					local LocalPlayer = game:GetService("Players").LocalPlayer
					local VirtualUser = game:GetService('VirtualUser')
					function autofarm()
						if AFM then
							if LocalPlayer.PlayerGui.Main.Quest.Visible == false then
								StatrMagnet = false
								CheckQuest()
								print()
								LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
								wait(1.1)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuest, LevelQuest)
							elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
								CheckQuest()
								LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
								if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
									pcall(
										function()
											for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
												CheckQuest()  
												if v.Name == Ms then
													repeat wait()
														EquipWeapon(SelectToolWeapon)
														if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
															if string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
																if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
																	local args = {
																		[1] = "Buso"
																	}
																	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
																end
																game:GetService'VirtualUser':CaptureController()
																game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
																game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
																v.HumanoidRootPart.CanCollide = false
																v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
																PosMon = v.HumanoidRootPart.CFrame
																StatrMagnet = true
																v.HumanoidRootPart.CanCollide = false
															else
																StatrMagnet = false
																CheckQuest()
																print()
																LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
																wait(1.5)
																game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuest, LevelQuest)
															end  
														else
															CheckQuest() 
															game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
														end 
													until not v.Parent or v.Humanoid.Health <= 0 or AFM == false or LocalPlayer.PlayerGui.Main.Quest.Visible == false
													StatrMagnet = false
													CheckQuest() 
													game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
												end
											end
										end
									)
								else
									CheckQuest()
									game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
								end 
							end
						end
					end
					
					spawn(function()
						pcall(function()
							while wait() do
								if AFM then
									autofarm()
								end 
							end
						end)
					end)
					
					spawn(function()
						pcall(function()
							while wait() do
								if AFM and game.Players.localPlayer.PlayerGui.Main.Quest.Visible == true then
									EquipWeapon(SelectToolWeapon)
								end
							end
						end)
					end)
					
					CheckQuest()
					SelectToolWeapon = ""
					function EquipWeapon(ToolSe)
						if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
							local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
							wait(.1)
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
						end
					end
					
					AutoFarm:Toggle("Auto New World",function(vu)
						AutoNew = vu
					end)
					
					spawn(function()
						pcall(function()
							while wait(.1) do
								if AutoNew then
									local MyLevel = game.Players.localPlayer.Data.Level.Value
									if MyLevel >= 700 and OldWorld then
										_G.AF = false
										SelectToolWeapon = "Key"
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4849.29883, 5.65138149, 719.611877)
										wait(0.5)
										local args = {
											[1] = "DressrosaQuestProgress",
											[2] = "Detective"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										wait(0.5)
										if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
											local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
											wait(.4)
											game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
										end
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1347.7124, 37.3751602, -1325.6488)
										wait(0.5)
										function click()
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
										end
										if game.Workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") and game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
											CheckBoss = true
											SelectToolWeapon = SelectToolWeaponOld
											for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
												if CheckBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Ice Admiral [Lv. 700] [Boss]" then
													repeat wait(.1)
														pcall(function() 
															v.HumanoidRootPart.Transparency = 0.5
															v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
															v.HumanoidRootPart.BrickColor = BrickColor.new("White")
															v.HumanoidRootPart.CanCollide = false
															game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0, 10, 10)
															click()
														end)
													until not CheckBoss or not v.Parent or v.Humanoid.Health <= 0
												end
											end
											CheckBoss = false
											wait(0.5)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1166.23743, 7.65220165, 1728.36487)
											wait(0.5)
											local args = {
												[1] = "TravelDressrosa" -- OLD WORLD to NEW WORLD
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										else
											if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
												local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
												wait(.4)
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
											end
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1347.7124, 37.3751602, -1325.6488)
										end 
									end
								end 
							end
						end)
					end)
					
					AutoFarm:Toggle("Auto Factory",function(value)
						AutoFactory = value
					end)
					
					spawn(function()
						pcall(function()
							while wait() do
								if AutoFactory then
									if game.Workspace.Enemies:FindFirstChild("Core") then
										Core = true
										AFM = false
										for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
											if Core and v.Name == "Core" and v.Humanoid.Health > 0 then
												repeat wait(.1)
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(448.46756, 199.356781, -441.389252)
													EquipWeapon(SelectToolWeapon)
													game:GetService'VirtualUser':CaptureController()
													game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
													
												until not Core or v.Humanoid.Health <= 0  or _G.Factory == false
											end
										end
									end
								end
							end
						end)
					end)
					
					AutoFarm:Toggle("Auto Superhuman",function(vu)
						Superhuman = vu
					end)
					spawn(function()
						pcall(function()
							while wait() do
								if Superhuman then
									if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
										local args = {
											[1] = "BuyBlackLeg"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
										if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
											SelectToolWeapon = "Black Leg"
										end
										if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
											SelectToolWeapon = "Electro"
										end
										if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
											SelectToolWeapon = "Fishman Karate"
										end
										if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
											SelectToolWeapon = "Dragon Claw"
										end
										if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
											local args = {
												[1] = "BuyElectro"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
											local args = {
												[1] = "BuyElectro"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
											local args = {
												[1] = "BuyFishmanKarate"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
											local args = {
												[1] = "BuyFishmanKarate"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 then
											local args = {
												[1] = "BlackbeardReward",
												[2] = "DragonClaw",
												[3] = "1"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											local args = {
												[1] = "BlackbeardReward",
												[2] = "DragonClaw",
												[3] = "2"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
										end
										if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
											local args = {
												[1] = "BlackbeardReward",
												[2] = "DragonClaw",
												[3] = "1"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											local args = {
												[1] = "BlackbeardReward",
												[2] = "DragonClaw",
												[3] = "2"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
										end
										if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 then
											local args = {
												[1] = "BuySuperhuman"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
											local args = {
												[1] = "BuySuperhuman"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
										end
								end
							end
						end)
					end)
					
					AutoFarm:Toggle("Auto DeathStep",function(value)
						DeathStep = value
					end)
					spawn(function()
						pcall(function()
							while wait() do
								if DeathStep then
									if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 then
										local args = {
											[1] = "BuyDeathStep"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end  
									if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then
										local args = {
											[1] = "BuyDeathStep"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end  
									if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449 then
										SelectToolWeapon = "Black Leg"
									end  
								end
							end
						end)
					end)
					
					AutoFarm:Toggle("Auto Saber",function(Value)
						AutoSaber = Value
					end)
					spawn(function()
						pcall(function()
							while wait() do
								if AutoSaber then
									local off = game:GetService("Workspace").Map.Jungle.Final:FindFirstChild("Part")
									local MyLevel = game.Players.localPlayer.Data.Level.Value
									if MyLevel >= 200 and AFM == true then
										repeat wait(.1)
											AFM = false
											function accept1()
												local string_1 = "ProQuestProgress";
												local string2 = "SickMan";
												local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
												Target:InvokeServer(string_1, string_2);
											end
											function accept2()
												local string_1 = "ProQuestProgress";
												local string2 = "RichSon";
												local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
												Target:InvokeServer(string_1, string2);
											end
											function saber()
												if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
													for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
														if v.Name == "Mob Leader [Lv. 120] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
															repeat wait()
																pcall(function()
																	if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
																		local args = {
																			[1] = "Buso"
																		}
																		game:GetService("ReplicatedStorage").Remotes.CommF:InvokeServer(unpack(args))
																	end
																	EquipWeapon(SelectToolWeapon)
																	v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
																	v.HumanoidRootPart.CanCollide = false
																	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0, 10, 10)
																	game:GetService'VirtualUser':CaptureController()
																	game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
																end)
															until v.Humanoid.Health == 0
														end
													end
												end
											end
											function accept3()
												local string_1 = "ProQuestProgress";
												local string2 = "RichSon";
												local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
												Target:InvokeServer(string_1, string_2);
											end
											wait(.1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1421.87024, 55.4666862, 21.7750397)
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1647.19556, 29.1544189, 438.299408)
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1324.10144, 31.4560413, -461.404114)
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1152.38464, 9.74718285, -700.309875)
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1180.89563, 21.0007095, 187.861374)
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1610.00757, 11.5049858, 164.001587)
											wait(2)
											local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Torch")
											wait(.4)
											game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
											wait(.1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1114.55762, 4.9214654, 4349.2334, -0.618430376, -1.56903435e-09, 0.785839617, -5.04992048e-09, 1, -1.97748973e-09, -0.785839617, -5.19136734e-09, -0.618430376)
											wait(5.5)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1114.26721, 4.16943789, 4366.15332)
											wait(1)
											local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Cup")
											wait(.4)
											game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1397.0614, 37.3480072, -1321.03955, -0.0699888021, -5.05999473e-08, 0.997547925, -7.48410045e-08, 1, 4.54734241e-08, -0.997547925, -7.14748296e-08, -0.0699888021)
											wait(4.5)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1457.87976, 88.2521744, -1390.39575)
											wait(1.5)
											accept1()
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-909.106689, 13.7520342, 4077.34888)
											wait(1.1)
											accept2()
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2852.90234, 7.56227827, 5367.72412)
											wait(1.5)
											EquipWeapon(SelectToolWeapon)
											wait(1)
											saber()
											wait(2)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-909.106689, 13.7520342, 4077.34888)
											wait(1.1)
											accept3()
											wait(1)
											local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Relic")
											wait(.4)
											game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1405.84094, 29.8519993, 5.05432224, 0.859020233, -4.18967083e-08, 0.511941671, 4.07572731e-09, 1, 7.49999103e-08, -0.511941671, -6.23399004e-08, 0.859020233)
											wait(1)
											if off.CanCollide == false then
												AutoSaber = false
												AFM = true
											end
											
										until AutoSaber == false or off.CanCollide == false or AFM == true
									elseif MyLevel >= 200 then
										repeat wait(.1)
											function accept1()
												local string_1 = "ProQuestProgress";
												local string2 = "SickMan";
												local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
												Target:InvokeServer(string_1, string_2);
											end
											function accept2()
												local string_1 = "ProQuestProgress";
												local string2 = "RichSon";
												local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
												Target:InvokeServer(string_1, string2);
											end
											function saber()
												for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
													if v.Name == "Mob Leader [Lv. 120] [Boss]" then
														repeat wait()
															for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
																if v.Name == "Mob Leader [Lv. 120] [Boss]" then
																	if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
																		local args = {
																			[1] = "Buso"
																		}
																		game:GetService("ReplicatedStorage").Remotes.CommF:InvokeServer(unpack(args))
																	end
																	EquipWeapon(SelectToolWeapon)
																	v.HumanoidRootPart.CanCollide = false
																	v.HumanoidRootPart.Size = Vector3.new(50,50,50)
																	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,15,0)
																	game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
																	game:GetService'VirtualUser':CaptureController()
																	game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
																	game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
																end
															end
														until v.Humanoid.Health == 0
													end
												end
											end
											function accept3()
												local string_1 = "ProQuestProgress";
												local string2 = "RichSon";
												local Target = game:GetService("ReplicatedStorage").Remotes["CommF"];
												Target:InvokeServer(string_1, string_2);
											end
											wait(.1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1421.87024, 55.4666862, 21.7750397)
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1647.19556, 29.1544189, 438.299408)
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1324.10144, 31.4560413, -461.404114)
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1152.38464, 9.74718285, -700.309875)
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1180.89563, 21.0007095, 187.861374)
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1610.00757, 11.5049858, 164.001587)
											wait(2)
											local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Torch")
											wait(.4)
											game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
											wait(.1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1114.55762, 4.9214654, 4349.2334, -0.618430376, -1.56903435e-09, 0.785839617, -5.04992048e-09, 1, -1.97748973e-09, -0.785839617, -5.19136734e-09, -0.618430376)
											wait(5.5)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1114.26721, 4.16943789, 4366.15332)
											wait(1)
											local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Cup")
											wait(.4)
											game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1397.0614, 37.3480072, -1321.03955, -0.0699888021, -5.05999473e-08, 0.997547925, -7.48410045e-08, 1, 4.54734241e-08, -0.997547925, -7.14748296e-08, -0.0699888021)
											wait(4.5)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1457.87976, 88.2521744, -1390.39575)
											wait(1.5)
											accept1()
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-909.106689, 13.7520342, 4077.34888)
											wait(1.1)
											accept2()
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2852.90234, 7.56227827, 5367.72412)
											wait(1.5)
											EquipWeapon(SelectToolWeapon)
											wait(1)
											saber()
											wait(2)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-909.106689, 13.7520342, 4077.34888)
											wait(1.1)
											accept3()
											wait(1)
											local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Relic")
											wait(.4)
											game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
											wait(1)
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1405.84094, 29.8519993, 5.05432224, 0.859020233, -4.18967083e-08, 0.511941671, 4.07572731e-09, 1, 7.49999103e-08, -0.511941671, -6.23399004e-08, 0.859020233)
											wait(1)
											if off.CanCollide == false then
												AutoSaber = false
											end
											
										until AutoSaber == false or off.CanCollide == false
										if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
											for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
												if v.Name == "Saber Expert [Lv. 200] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
													repeat wait()
														pcall(function()
															if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
																local args = {
																	[1] = "Buso"
																}
																game:GetService("ReplicatedStorage").Remotes.CommF:InvokeServer(unpack(args))
															end
															EquipWeapon(SelectToolWeapon)
															v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
															v.HumanoidRootPart.CanCollide = false
															game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0, 15, 10)
															game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
															game:GetService'VirtualUser':CaptureController()
															game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
															game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
														end)
													until AutoOpenSaber == true or v.Humanoid.Health <= 0
												end
											end
										end
									end
								end
							end
						end)
					end)
					
					
					
					Wapon = {}
						for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
							if v:IsA("Tool") then
								table.insert(Wapon ,v.Name)
							end
						end
						for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
							if v:IsA("Tool") then
								table.insert(Wapon, v.Name)
							end
						end
					
					local SelectWeapona = AutoFarm:Drop("Select Weapon",Wapon,function(Value)
						SelectToolWeapon = Value
						SelectToolWeaponOld = Value
					end)
					
					AutoFarm:Button("Refresh Weapon","", function()
						SelectWeapona:Refresh()
						Wapon = {}
						for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
							if v:IsA("Tool") then
								SelectWeapona:Add(v.Name)
							end
						end
						for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
							if v:IsA("Tool") then
								SelectWeapona:Add(v.Name)
							end
						end
					end)
					
					AutoFarm:h1("Auto Accessories")
					
					WaponAccessories = {}
					for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
						if v:IsA("Tool") then 
							if v.ToolTip == "Wear" then    
								table.insert(WaponAccessories, v.Name)
							end
						end
					end
					SelectTooAccessories = ""
					AutoFarm:Toggle("Auto Accessories",function(Value)
							AutoAccessories = Value 
					end)
					spawn(function()
						pcall(function()
							while wait() do
								if AutoAccessories then
									CheckAccessories = game.Players.LocalPlayer.Character
									if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
										if CheckAccessories:FindFirstChild("CoolShades") or CheckAccessories:FindFirstChild("BlackSpikeyCape") or CheckAccessories:FindFirstChild("BlueSpikeyCape") or CheckAccessories:FindFirstChild("RedSpikeyCape") or CheckAccessories:FindFirstChild("Chopper") or CheckAccessories:FindFirstChild("MarineCape") or CheckAccessories:FindFirstChild("GhoulMask") or CheckAccessories:FindFirstChild("MarineCap") or CheckAccessories:FindFirstChild("PinkCape") or CheckAccessories:FindFirstChild("SaboTopHat") or CheckAccessories:FindFirstChild("SwanGlasses") or CheckAccessories:FindFirstChild("UsoapHat") or CheckAccessories:FindFirstChild("Corrida") or CheckAccessories:FindFirstChild("ZebraCap") or CheckAccessories:FindFirstChild("TomoeRing") or CheckAccessories:FindFirstChild("BlackCape") or CheckAccessories:FindFirstChild("SwordsmanHat") or CheckAccessories:FindFirstChild("SantaHat") or CheckAccessories:FindFirstChild("ElfHat") or CheckAccessories:FindFirstChild("DarkCoat") then
										else
											EquipWeapon(SelectTooAccessories)
											wait(0.1)
											game:GetService'VirtualUser':CaptureController()
											game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
											wait(0.1)
											if game.Players.LocalPlayer.Character:FindFirstChild(SelectTooAccessories) then
												game.Players.LocalPlayer.Character:FindFirstChild(SelectTooAccessories).Parent = game.Players.LocalPlayer:FindFirstChild("Backpack")
											end
											wait(1)
										end
									end
								end
							end
						end)
					end)
					
					local SelectAccessories = AutoFarm:Drop("Select Accessories",WaponAccessories,function(Value)
						SelectTooAccessories = Value
					end)
					
					AutoFarm:h1("Auto Rengoku")
					
					AutoFarm:Toggle("Auto Rengoku",function(value)
						AutoRengoku = value
					end)
					function EquipWeaponRengoku(ToolSe)
						if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
							local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
							wait(.4)
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
						end
					end
					
					WaponRengoku = {}
					for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
						if v:IsA("Tool") then
							table.insert(WaponRengoku ,v.Name)
						end
					end
					for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
						if v:IsA("Tool") then
							table.insert(WaponRengoku, v.Name)
						end
					end
					local Rengoku = AutoFarm:Drop("Select Weapon",WaponRengoku,function(Value)
						RengokuWeapon = Value
					end)
					spawn(function()
						pcall(function()
							while wait() do
								if AutoRengoku then
									if game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or  game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
										EquipWeaponRengoku("Hidden Key")
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6571.81885, 296.689758, -6966.76514, 0.825126112, 8.412257e-10, 0.564948559, -2.42370835e-08, 1, 3.39100339e-08, -0.564948559, -4.16727595e-08, 0.825126112)
									elseif game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") then
										for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
											if v.Name == "Snow Lurker [Lv. 1375]" then
												repeat wait()
													EquipWeaponRengoku(RengokuWeapon)
													game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
													VirtualUser:CaptureController()
													VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
													game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0)
													PosMon = v.HumanoidRootPart.CFrame
													StatrMagnetRengoku = true
												until game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or AutoRengoku == false or not v.Parent
												StatrMagnetRengoku = false
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5518.00684, 60.5559731, -6828.80518, -0.650781393, -3.64292951e-08, 0.759265184, -4.07668654e-09, 1, 4.44854642e-08, -0.759265184, 2.58550248e-08, -0.650781393)
												
											end
										end
									end
							   end
							end
						end)
					end)
					
					spawn(function()
						pcall(function()
							while wait() do
								if AutoRengoku then
									if game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or  game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
										EquipWeapon("Hidden Key")
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6571.81885, 296.689758, -6966.76514, 0.825126112, 8.412257e-10, 0.564948559, -2.42370835e-08, 1, 3.39100339e-08, -0.564948559, -4.16727595e-08, 0.825126112)
									elseif game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") then
										for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
											if v.Name == "Snow Lurker [Lv. 1375]" and v.Humanoid.Health > 0 then
												repeat wait()
													if game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") then
														EquipWeapon(RengokuWeapon)
														PosMon = v.HumanoidRootPart.CFrame
														game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
														game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
														VirtualUser:CaptureController()
														VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
														StatrMagnetRengoku = true
													else
														StatrMagnetRengoku = false
														game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5518.00684, 60.5559731, -6828.80518, -0.650781393, -3.64292951e-08, 0.759265184, -4.07668654e-09, 1, 4.44854642e-08, -0.759265184, 2.58550248e-08, -0.650781393)
														
													end
												until game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or AutoRengoku == false or not v.Parent or v.Humanoid.Health <= 0
												StatrMagnetRengoku = false
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5518.00684, 60.5559731, -6828.80518, -0.650781393, -3.64292951e-08, 0.759265184, -4.07668654e-09, 1, 4.44854642e-08, -0.759265184, 2.58550248e-08, -0.650781393)
											end
										end
									end
								end
							end
						end)
					end)
					
					spawn(function()
						while wait() do
							pcall(function()
								if AFM and StatrMagnet and Magnet then
									CheckQuest()
									for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
										if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
											if v.Name == "Factory Staff [Lv. 800]" and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
												wait()
												if HideHitBlox then
													v.HumanoidRootPart.Transparency = 0.75
												else
													v.HumanoidRootPart.Transparency = 1
												end
												v.Head.CanCollide = false
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
												v.HumanoidRootPart.CFrame = PosMon
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											elseif v.Name == Ms and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 400 then
												wait()
												if HideHitBlox then
													v.HumanoidRootPart.Transparency = 0.75
												else
													v.HumanoidRootPart.Transparency = 1
												end
												v.Head.CanCollide = false
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
												v.HumanoidRootPart.CFrame = PosMon
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end
										end
									end
								end
								if AutoRengoku and StatrMagnetRengoku and Magnet then
									for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
										if v.Name ==  "Snow Lurker [Lv. 1375]" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
											if v.Name == "Snow Lurker [Lv. 1375]" then
												if HideHitBlox then
													v.HumanoidRootPart.Transparency = 0.75
												else
													v.HumanoidRootPart.Transparency = 1
												end
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
												v.HumanoidRootPart.CFrame = PosMonRengoku
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end
										end
									end
								end
								if _G.AutoBartilo and AutoBartiloBring and Magnet then
									for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
										if v.Name == "Swan Pirate [Lv. 775]" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
											if v.Name == "Swan Pirate [Lv. 775]" then
												if HideHitBlox then
													v.HumanoidRootPart.Transparency = 0.75
												else
													v.HumanoidRootPart.Transparency = 1
												end
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
												v.HumanoidRootPart.CFrame = PosMonBarto
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end
										end
									end
								end
								if AutoFramEctoplasm and StatrMagnetEctoplasm and Magnet then
									for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
										if string.find(v.Name, "Ship") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
											if (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
												if HideHitBlox then
													v.HumanoidRootPart.Transparency = 0.75
												else
													v.HumanoidRootPart.Transparency = 1
												end
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
												v.HumanoidRootPart.CFrame = PosMonEctoplasm
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end
										end
									end
								end
							end)
						end
					end)
					
					AutoFarm:h1("Auto Boss")
					
					AutoFarm:Toggle("Auto Farm Boss",function(Value)
						local args = {
							[1] = "AbandonQuest"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						FarmBoss = Value
					end)
					
					spawn(function()
						pcall(function()
							while wait() do
								if FarmBoss then
									EquipWeaponBoss()
									AutoFramBoss()
								end
							end
						end)
					end)
					function CheckQuestBoss()
						if SelectBoss == "Diamond [Lv. 750] [Boss]" then
							MsBoss = "Diamond [Lv. 750] [Boss]"
							NaemQuestBoss = "Area1Quest"
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
							CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
						elseif SelectBoss == "Jeremy [Lv. 850] [Boss]" then
							MsBoss = "Jeremy [Lv. 850] [Boss]"
							NaemQuestBoss = "Area2Quest"
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
							CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, -0.0217453763, 0, -0.999763548, 0, 1, 0, 0.999763548, 0, -0.0217453763)
						elseif SelectBoss == "Fajita [Lv. 925] [Boss]" then
							MsBoss = "Fajita [Lv. 925] [Boss]"
							NaemQuestBoss = "MarineQuest3"
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
							CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.53833, 0.961227536, -1.46645796e-09, -0.275756449, -2.3212845e-09, 1, -1.34094433e-08, 0.275756449, 1.35296352e-08, 0.961227536)
						elseif SelectBoss == "Don Swan [Lv. 1000] [Boss]" then
							MsBoss = "Don Swan [Lv. 1000] [Boss]"
							CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, -8.41247214e-08, -0.0227668174, 8.4774733e-08, 1, 2.75850098e-08, 0.0227668174, -2.95079072e-08, 0.99974072)
						elseif SelectBoss == "Smoke Admiral [Lv. 1150] [Boss]" then
							MsBoss = "Smoke Admiral [Lv. 1150] [Boss]"
							NaemQuestBoss = "IceSideQuest"
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373, -0.444992423, -3.0874483e-09, 0.895534337, -3.64098796e-08, 1, -1.4644522e-08, -0.895534337, -3.91229982e-08, -0.444992423)
							CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207, 0.251453817, 1.48345061e-08, -0.967869282, 4.02796978e-08, 1, 2.57916977e-08, 0.967869282, -4.54708946e-08, 0.251453817)
						elseif SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" then
							MsBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
							CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, -0.999505103, 9.26310495e-09, 0.0314563364, 8.42916226e-09, 1, -2.6643713e-08, -0.0314563364, -2.63653774e-08, -0.999505103)
						elseif SelectBoss == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
							MsBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
							NaemQuestBoss = "FrostQuest"
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908, 0.921275556, -1.25320829e-08, 0.388910472, 4.72230788e-08, 1, -7.96414241e-08, -0.388910472, 9.17372489e-08, 0.921275556)
							CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521, 0.49051559, -5.25310213e-08, -0.871432424, -2.76146022e-08, 1, -7.58250565e-08, 0.871432424, 6.12576301e-08, 0.49051559)
						elseif SelectBoss == "Tide Keeper [Lv. 1475] [Boss]" then
							MsBoss = "Tide Keeper [Lv. 1475] [Boss]"
							NaemQuestBoss = "ForgottenQuest"             
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324, -0.985987961, -3.58504737e-09, 0.16681771, -3.07832915e-09, 1, 3.29612559e-09, -0.16681771, 2.73641976e-09, -0.985987961)
							CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
							-- Old World
						elseif SelectBoss == "Saber Expert [Lv. 200] [Boss]" then
							MsBoss = "Saber Expert [Lv. 200] [Boss]"
							CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564, 0.858821094, 1.13848939e-08, 0.512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, 0.858821094)
						elseif SelectBoss == "The Gorilla King [Lv. 25] [Boss]" then
							MsBoss = "The Gorilla King [Lv. 25] [Boss]"
							NaemQuestBoss = "JungleQuest"
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
							CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
						elseif SelectBoss == "Bobby [Lv. 55] [Boss]" then
							MsBoss = "Bobby [Lv. 55] [Boss]"
							NaemQuestBoss = "BuggyQuest1"
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
							CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588, 0.956680477, -1.77109952e-10, -0.29113996, 5.16530874e-10, 1, 1.08897802e-09, 0.29113996, -1.19218679e-09, 0.956680477)
						elseif SelectBoss == "Yeti [Lv. 110] [Boss]" then
							MsBoss = "Yeti [Lv. 110] [Boss]"
							NaemQuestBoss = "SnowQuest"
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825, 0.280209213, 2.72035177e-08, -0.959938943, -6.75690828e-08, 1, 8.6151708e-09, 0.959938943, 6.24481444e-08, 0.280209213)
							CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082, 0.349343032, -9.49245944e-08, 0.936994851, 6.29478194e-08, 1, 7.7838429e-08, -0.936994851, 3.17894653e-08, 0.349343032)
						elseif SelectBoss == "Mob Leader [Lv. 120] [Boss]" then
							MsBoss = "Mob Leader [Lv. 120] [Boss]"
							CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.928248107)
							--The Gorilla King [Lv. 25] [Boss]
						elseif SelectBoss == "Vice Admiral [Lv. 130] [Boss]" then
							MsBoss = "Vice Admiral [Lv. 130] [Boss]"
							NaemQuestBoss = "MarineQuest2"
							LevelQuestBoss = 2
							CFrameQuestBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293, -0.0611100644, -8.08395768e-08, 0.998130739, -1.57416586e-08, 1, 8.00271849e-08, -0.998130739, -1.08217701e-08, -0.0611100644)
							CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665, -0.555574954, -9.88630566e-11, 0.831466436, -6.35508286e-08, 1, -4.23449258e-08, -0.831466436, -7.63661632e-08, -0.555574954)
						elseif SelectBoss == "Warden [Lv. 175] [Boss]" then
							MsBoss = "Warden [Lv. 175] [Boss]"
							NaemQuestBoss = "ImpelQuest"
							LevelQuestBoss = 1
							CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
							CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
						elseif SelectBoss == "Chief Warden [Lv. 200] [Boss]" then
							MsBoss = "Chief Warden [Lv. 200] [Boss]"
							NaemQuestBoss = "ImpelQuest"
							LevelQuestBoss = 2
							CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
							CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
						elseif SelectBoss == "Flamingo [Lv. 225] [Boss]" then
							MsBoss = "Flamingo [Lv. 225] [Boss]"
							NaemQuestBoss = "ImpelQuest"
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
							CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
						elseif SelectBoss == "Magma Admiral [Lv. 350] [Boss]" then
							MsBoss = "Magma Admiral [Lv. 350] [Boss]"
							NaemQuestBoss = "MagmaQuest"
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699, 0.51175487, -2.65508806e-08, -0.859131515, -3.91131572e-08, 1, -5.42026761e-08, 0.859131515, 6.13418294e-08, 0.51175487)
							CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-08, 0.513919294, 1.53689133e-08, 1, -6.91265853e-08, -0.513919294, 6.71978384e-08, 0.857838571)
						elseif SelectBoss == "Fishman Lord [Lv. 425] [Boss]" then
							MsBoss = "Fishman Lord [Lv. 425] [Boss]"
							NaemQuestBoss = "FishmanQuest"
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018, 0.927145958, 1.0624845e-07, 0.374700129, -6.98219367e-08, 1, -1.10790765e-07, -0.374700129, 7.65569368e-08, 0.927145958)
							CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, -0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
						elseif SelectBoss == "Wysper [Lv. 500] [Boss]" then
							MsBoss = "Wysper [Lv. 500] [Boss]"
							NaemQuestBoss = "SkyExp1Quest"
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954, 0.462944925, 1.45838088e-08, -0.886386991, 1.0534996e-08, 1, 2.19553424e-08, 0.886386991, -1.95022007e-08, 0.462944925)
							CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345, 0.716468513, -1.22915289e-09, 0.697619379, 3.37381434e-09, 1, -1.70304748e-09, -0.697619379, 3.57381835e-09, 0.716468513)
						elseif SelectBoss == "Thunder God [Lv. 575] [Boss]" then
							MsBoss = "Thunder God [Lv. 575] [Boss]"
							NaemQuestBoss = "SkyExp2Quest"
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(-7902.78613, 5635.99902, -1411.98706, -0.0361216255, -1.16895912e-07, 0.999347389, 1.44533963e-09, 1, 1.17024491e-07, -0.999347389, 5.6715117e-09, -0.0361216255)
							CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564, 0.965189934, 4.80563429e-08, -0.261550069, -6.73089886e-08, 1, -6.46515304e-08, 0.261550069, 8.00056768e-08, 0.965189934)
						elseif SelectBoss == "Cyborg [Lv. 675] [Boss]" then
							MsBoss = "Cyborg [Lv. 675] [Boss]"
							NaemQuestBoss = "FountainQuest"
							LevelQuestBoss = 3
							CFrameQuestBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166, -0.0112687312, -9.93677887e-08, -0.999936521, 2.55291371e-10, 1, -9.93769547e-08, 0.999936521, -1.37512213e-09, -0.0112687312)
							CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, -0.563162148, 1.73805248e-09, -0.826346457, -5.94632716e-08, 1, 4.26280238e-08, 0.826346457, 7.31437524e-08, -0.563162148)
						end
					end
					
					Boss = false
					SelectToolWeaponBoss = ""
					function EquipWeaponBoss()
						if game.Players.LocalPlayer.Backpack:FindFirstChild(SelectToolWeaponBoss) then
							local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(SelectToolWeaponBoss)
							wait(.4)
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
						end
					end
					local VirtualUser = game:GetService('VirtualUser')
					
					function AutoFramBoss()
						CheckQuestBoss()
						if SelectBoss == "Don Swan [Lv. 1000] [Boss]" or SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" or SelectBoss == "Saber Expert [Lv. 200] [Boss]" or SelectBoss == "Mob Leader [Lv. 120] [Boss]" or SelectBoss == "Darkbeard [Lv. 1000] [Raid Boss]" then
							if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
								for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
									if FarmBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
										repeat
											pcall(function() wait() 
												if HideHitBlox then
													v.HumanoidRootPart.Transparency = 0.75
												else
													v.HumanoidRootPart.Transparency = 1
												end
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
												game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 17, 5)
												game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												VirtualUser:CaptureController()
												VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
											end)
										until not FarmBoss or not v.Parent or v.Humanoid.Health <= 0
									end
								end
							else
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameBoss
							end
						elseif SelectBoss == "Order [Lv. 1250] [Raid Boss]" then
							if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
								for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
									if FarmBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
										repeat
											pcall(function() wait() 
												if HideHitBlox then
													v.HumanoidRootPart.Transparency = 0.75
												else
													v.HumanoidRootPart.Transparency = 1
												end
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
												game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 25)
												game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												VirtualUser:CaptureController()
												VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
											end)
										until not FarmBoss or not v.Parent or v.Humanoid.Health <= 0
									end
								end
							else
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameBoss
							end
						else
							if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) or game:GetService("ReplicatedStorage"):FindFirstChild(SelectBoss) then
								if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
									CheckQuestBoss()
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuestBoss
									wait(1.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuestBoss, LevelQuestBoss)
									wait(1)
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameBoss
								elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
									for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
										if FarmBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
											repeat
												pcall(function() wait() 
													if HideHitBlox then
														v.HumanoidRootPart.Transparency = 0.75
													else
														v.HumanoidRootPart.Transparency = 1
													end
													v.HumanoidRootPart.CanCollide = false
													v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
													game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 17, 5)
													VirtualUser:CaptureController()
													VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
												end)
											until not FarmBoss or not v.Parent or v.Humanoid.Health <= 0 or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
										end
									end
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameBoss
								end
							end
						end
					end
					
					local Boss = {}
					for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
						if string.find(v.Name, "Boss") then
							if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
							else
								table.insert(Boss, v.Name)
							end
						end
					end
					for i, v in pairs(game.workspace.Enemies:GetChildren()) do
						if string.find(v.Name, "Boss") then
							if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
							else
								table.insert(Boss, v.Name)
							end
						end
					end
					
					local BossName = AutoFarm:Drop("Select Boss",Boss,function(Value)
						SelectBoss = Value
						Boss = false
					end)
					
					Wapon = {}
					for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if v:IsA("Tool") then
							table.insert(Wapon, v.Name)
						end
					end
					for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v:IsA("Tool") then
							table.insert(Wapon, v.Name)
						end
					end
					local SelectWeaponBoss = AutoFarm:Drop("Select Weapon",Wapon,function(Value)
							SelectToolWeaponBoss = Value
					end)
					
					AutoFarm:h1("Auto Bartilomio")
					
					WeaponBartilo = ""
					local args = {
						[1] = "getInventoryWeapons"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					game:GetService("RunService").Heartbeat:Connect(function()
						if AutoBartilo then
							game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
						end
					end)
					
					AutoFarm:Toggle("Auto Bartilomio",function(value)
						Bool = value
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Warrior Helmet") then
							HaveWarriorHelmet = true
						elseif game.Players.LocalPlayer.Character:FindFirstChild("Warrior Helmet") then
							HaveWarriorHelmet = true
						end
						if HaveWarriorHelmet and Bool == true then
						elseif WeaponBartilo == "" and Bool == true then
						elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 and Bool == true then
						else
							AutoBartilo = value
						end
						spawn(function()
							pcall(function()
								while wait() do
									if AutoBartilo then
										if game.Players.LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
											if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
												if game.Workspace.Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
													Ms = "Swan Pirate [Lv. 775]"
													for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
														for i,k in pairs(game.Workspace.Enemies:GetChildren()) do
															if v.Name == Ms then
																pcall(function()
																	repeat wait()
																		sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
																		if HideHitBlox then
																			v.HumanoidRootPart.Transparency = 0.75
																		else
																			v.HumanoidRootPart.Transparency = 1
																		end
																		v.HumanoidRootPart.CanCollide = false
																		v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
																		v.HumanoidRootPart. CFrame = k.HumanoidRootPart.CFrame
																		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,15,0)
																		PosMonBarto =  v.HumanoidRootPart.CFrame
																		game:GetService'VirtualUser':CaptureController()
																		game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
																		AutoBartiloBring = true
																	until not v.Parent or v.Humanoid.Health <= 0 or AutoBartilo == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
																	AutoBartiloBring = false
																end)
															end
														end
													end
												else
													CFrameMon = CFrame.new(1057.92761, 137.614319, 1242.08069)
													game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
												end
											else
												game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-456.28952, 73.0200958, 299.895966)
												wait(1.1)
												local args = {
													[1] = "StartQuest",
													[2] = "BartiloQuest",
													[3] = 1
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
										elseif game.ReplicatedStorage:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
											game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-456.28952, 73.0200958, 299.895966)
											wait(1.1)
											local args = {
												[1] = "BartiloQuestProgress",
												[2] = "Bartilo"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											wait(1)
											game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2099.88159, 448.931, 648.997375)
											wait(2)
										else
											game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2099.88159, 448.931, 648.997375)
										end
									elseif game.Players.LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1850.49329, 13.1789551, 1750.89685)
										wait(1)
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.87305, 19.3777466, 1712.01807)
										wait(1)
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1803.94324, 16.5789185, 1750.89685)
										wait(1)
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.55835, 16.8604317, 1724.79541)
										wait(1)
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1869.54224, 15.987854, 1681.00659)
										wait(1)
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1800.0979, 16.4978027, 1684.52368)
										wait(1)
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1819.26343, 14.795166, 1717.90625)
										wait(1)
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1813.51843, 14.8604736, 1724.79541)
									end
								end
							end)
						end)
					end)
					
					local BartiloWeapon = AutoFarm:Drop("Select Weapon",Wapon,function(A)
						WeaponBartilo = A
					end) 
					
					AutoFarm:h1("Auto Sharkman")
					
					AutoFarm:Toggle("Auto Sharkman",function(value)
						local args = {
							[1] = "BuyFishmanKarate"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						AutoSharkman = value
						spawn(function()
							pcall(function()
								while wait() do
									if AutoSharkman then
										if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then  
											if game.Players.LocalPlayer.Character:FindFirstChild("Water Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Water Key") then
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365)
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
											elseif  game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 400 then
											else
												Ms = "Tide Keeper [Lv. 1475] [Boss]"
												if game.Workspace.Enemies:FindFirstChild(Ms) then
													for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
														if v.Name == Ms then
															repeat wait()
																EquipWeapon(SharkmanWeapon)
																game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
																if HideHitBlox then
																	v.HumanoidRootPart.Transparency = 0.75
																else
																	v.HumanoidRootPart.Transparency = 1
																end
																v.HumanoidRootPart.CanCollide = false
																v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
																game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,15,0)
																game:GetService'VirtualUser':CaptureController()
																game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
															until not v.Parent or v.Humanoid.Health <= 0 or AutoSharkman == false or game.Players.LocalPlayer.Character:FindFirstChild("Water Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Water Key")
														end
													end
												end
											end
										else
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
										end
									end
								end
							end)
						end)
					end)
					
					local Sharkman = AutoFarm:Drop("Select Weapon",Wapon,function(Value)
						SharkmanWeapon = Value
					end)
					
					AutoFarm:h1("Auto Ectoplasm")
					
					AutoFarm:Toggle("Auto Ectoplasm",function(value)
						AutoFramEctoplasm = value
						spawn(function()
							pcall(function()
								while wait() do
									if AutoFramEctoplasm then
										if game.Workspace.Enemies:FindFirstChild("Ship Deckhand [Lv. 1250]") or game.Workspace.Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") or game.Workspace.Enemies:FindFirstChild("Ship Steward [Lv. 1300]") or game.Workspace.Enemies:FindFirstChild("Ship Officer [Lv. 1325]") then
											for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
												if string.find(v.Name, "Ship") then
													repeat wait()
														if string.find(v.Name, "Ship") then
															sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
															v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
															v.HumanoidRootPart.Size = Vector3.new(60,60,60)
															EquipWeapon(EctoplasmWeaponSelect)
															game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
															VirtualUser:CaptureController()
															VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
															PosMonEctoplasm = v.HumanoidRootPart.CFrame
															game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
															StatrMagnetEctoplasm = true
														else
															StatrMagnetEctoplasm = false
															game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(920.14447, 129.581833, 33442.168, -0.999913812, 0, -0.0131403487, 0, 1, 0, 0.0131403487, 0, -0.999913812)
					
														end
													until game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or AutoFramEctoplasm == false or not v.Parent or v.Humanoid.Health <= 0
													StatrMagnetEctoplasm = false
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(920.14447, 129.581833, 33442.168, -0.999913812, 0, -0.0131403487, 0, 1, 0, 0.0131403487, 0, -0.999913812)
					
												end
											end
										end
									end
								end
							end)
						end)
					end)
					
					local EctoplasmWeapon = AutoFarm:Drop("Select Weapon",Wapon,function(Value)
							EctoplasmWeaponSelect = Value
					end)
					
					game:GetService("RunService").Heartbeat:Connect(function()
						if FruitMastery or GunMastery then
							game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
						end
					end)
					
					AutoFarm:h1("Auto Farm Mastery")
					
					WeaponMastery = ""
					AutoFarm:Toggle("Auto Farm Mastery Fruit",function(value)
						CheckQuest()
						local args = {
							[1] = "AbandonQuest"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						FruitMastery = value
						Ms = ""
						spawn(function()
							pcall(function()
								while wait() do
									if FruitMastery then
										AutoDevilFruitMastery()
									end
								end
							end)
						end)
					end)
					function AutoDevilFruitMastery()
						if FruitMastery then
							if LocalPlayer.PlayerGui.Main.Quest.Visible == false then
								StatrMagnetDevilFruitMastery = false
								CheckQuest()
								LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
								wait(1.1)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuest, LevelQuest)
							elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
								CheckQuest()
								LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
								if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
									pcall(
										function()
											for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
												CheckQuest()  
												if v.Name == Ms then
													repeat wait() CheckQuest()  
														if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
															if string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
																if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
																	local args = {
																		[1] = "Buso"
																	}
																	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
																end
																HealthMin = v.Humanoid.MaxHealth*Persen/100
																PosMon = v.HumanoidRootPart.CFrame
																if v.Humanoid.Health <= HealthMin then
																	UseDF = true
																	EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
																	v.HumanoidRootPart.CanCollide = false
																	v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
																	v.HumanoidRootPart.Transparency = 0.75
																	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,15,0)
																	if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then
																		if SkillZ and v.Humanoid.Health <= HealthMin then
																			local args = {
																				[1] = v.HumanoidRootPart.Position
																			}
																			game:GetService("Players").LocalPlayer.Character["Dragon-Dragon"].RemoteEvent:FireServer(unpack(args))
																			local args = {
																				[1] = "Z",
																				[2] = Vector3.new(0,0,0)
																			}
																			game:GetService("Players").LocalPlayer.Character["Dragon-Dragon"].RemoteFunction:InvokeServer(unpack(args))
																		end
																		if SkillX and v.Humanoid.Health <= HealthMin then
																			local args = {
																				[1] = v.HumanoidRootPart.Position
																			}
																			game:GetService("Players").LocalPlayer.Character["Dragon-Dragon"].RemoteEvent:FireServer(unpack(args))
																			local args = {
																				[1] = "X"
																			}
																			game:GetService("Players").LocalPlayer.Character["Dragon-Dragon"].RemoteFunction:InvokeServer(unpack(args))
																		end   
																	elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
																		if SkillZ and v.Humanoid.Health <= HealthMin then
																			local args = {
																				[1] = v.HumanoidRootPart.Position
																			}
																			game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
																			local args = {
																				[1] = "Z",
																				[2] = Vector3.new(0,0,0)
																			}
																			game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteFunction:InvokeServer(unpack(args))
																		end
																		if SkillX and v.Humanoid.Health <= HealthMin then
																			local args = {
																				[1] = v.HumanoidRootPart.Position
																			}
																			game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
																			local args = {
																				[1] = "X",
																				[2] = Vector3.new(0,0,0)
																			}
					
																			game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteFunction:InvokeServer(unpack(args))
																		end
																		if SkillC and v.Humanoid.Health <= HealthMin then
																			local args = {
																				[1] = v.HumanoidRootPart.Position
																			}
																			game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
																			local args = {
																				[1] = "C",
																				[2] = Vector3.new(0,0,0)
																			}
																			game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteFunction:InvokeServer(unpack(args))
																		end
																		if SkillV and v.Humanoid.Health <= HealthMin then
																			local args = {
																				[1] = v.HumanoidRootPart.Position
																			}
																			game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
																			local args = {
																				[1] = "V",
																				[2] = Vector3.new(0,0,0)
																			}
																			game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteFunction:InvokeServer(unpack(args))
																		end
																	end   
																else
																	UseDF = false
																	EquipWeapon(WeaponMastery)
																	if HideHitBlox then
																		v.HumanoidRootPart.Transparency = 0.75
																	else
																		v.HumanoidRootPart.Transparency = 1
																	end
																	v.HumanoidRootPart.CanCollide = false
																	v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
																	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,15,0)
																	game:GetService'VirtualUser':CaptureController()
																	game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))  
																end
																StatrMagnetDevilFruitMastery = true 
															else
																StatrMagnet = false
																CheckQuest()
					
																LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
																wait(1.5)
																game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuest, LevelQuest)
															end  
														else
															CheckQuest() 
															game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
														end 
													until not v.Parent or v.Humanoid.Health <= 0 or AFM == false or LocalPlayer.PlayerGui.Main.Quest.Visible == false
													StatrMagnetDevilFruitMastery = false
													CheckQuest() 
													game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
												end
											end
										end
									)
								else
									CheckQuest()
									game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
								end 
							end
						end
					end
					
					spawn(function()
						while wait() do
							if AFM then
								CheckQuest()
								for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
									if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
										if v.Name == "Factory Staff [Lv. 800]" and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
											wait()
											if HideHitBlox then
												v.HumanoidRootPart.Transparency = 1
											else
												v.HumanoidRootPart.Transparency = 0.75
											end
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											v.HumanoidRootPart.CFrame = PosMonF
										elseif v.Name == Ms and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 400 then
											wait()
											if HideHitBlox then
												v.HumanoidRootPart.Transparency = 1
											else
												v.HumanoidRootPart.Transparency = 0.75
											end
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											v.HumanoidRootPart.CFrame = PosMonF
										end
									end
								end
							end
						end
					end)
					
					AutoFarm:Toggle("Auto Fram Gun Mastery",function(v)
							CheckQuest()
							GunMastery = v
						Ms = ""
						spawn(function()
							pcall(function()
								while wait() do
									if GunMastery then
										AutoGunMastery()
									end
								end
							end)
						end)
					end)
					
					function AutoGunMastery()
						if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then  
							CheckQuest()
							LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
							wait(1.1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuest, LevelQuest)
							wait(0.5)
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
						elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then  
							for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
								CheckQuest()
								pcall(function()
									if game.Workspace.Enemies:FindFirstChild(Ms) then
										if GunMastery and v.Name == Ms then
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											repeat wait()
												pcall(function()
													if game.Workspace.Enemies:FindFirstChild(Ms) then
														if string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
															HealthMin = v.Humanoid.MaxHealth*Persen/100
															PosMon = v.HumanoidRootPart.CFrame
															if v.Humanoid.Health <= HealthMin then
																EquipWeapon(SelectToolWeaponGun)
																v.HumanoidRootPart.CanCollide = false
																v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
																v.HumanoidRootPart.Transparency = 0.75
																game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,15,0)
																local args = {
																	[1] = v.HumanoidRootPart.Position,
																	[2] = v.HumanoidRootPart
																}
																game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
															else
																EquipWeapon(WeaponMastery)
																if HideHitBlox then
																	v.HumanoidRootPart.Transparency = 0.75
																else
																	v.HumanoidRootPart.Transparency = 1
																end
																v.HumanoidRootPart.CanCollide = false
																v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
																game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,15,0)
																game:GetService'VirtualUser':CaptureController()
																game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
															end 
															StatrMagnet = true
														else
															CheckQuest()
					
															LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
															wait(1.1)
					
															wait(0.5)
															game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
														end
													else
														CheckQuest()
														game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
													end
												end)
											until game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or _G.GunMastery == false or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
										end
									else
										CheckQuest()
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
									end
								end)
							end
						end
					end
					
					Persen = 15
					AutoFarm:Slider("Health % (Default 15)", Persen, 100,15,function(v)
						Persen = v
					end)
					
					local AMS = AutoFarm:Drop("Select Weapon",Wapon,function(v)
						WeaponMastery = v
						WeaponOldMastery = v
					end)
					
					AutoFarm:h1("Raid Farm")
					
					spawn(function()
						while wait() do
							if RaidsArua then
								pcall(function()
									for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
										if v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Humanoid") then
											if (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
													repeat wait()
														if v.Humanoid.Health > 0 then
															v.Humanoid.Health = 0
														elseif v.Humanoid.Health == 0 then
															v.Humanoid.Health = v.Humanoid.MaxHealth
														end
														v.HumanoidRootPart.CanCollide = false
														v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
													until RaidsArua == false or v.Humanoid.Health == 0 or not v.Parent
											end
										end
									end
								end)
							end
						end
					end)
					
					AutoFarm:Toggle("Kill Aura",function(value)
						RaidsArua = value
					end)
					
					AutoFarm:Toggle("Auto Next Island",function(value)
						NextIsland = value
					end)
					
					AutoFarm:Button("Dungeoun Lab",function()
						if NewWorld then
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6438.73535, 250.645355, -4501.50684)
						elseif OldWorld then
					
						end
					end)
					
					spawn(function()
						while wait(.1) do
							if NextIsland then
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
								if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
									if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0,40,0)
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0,40,0)
					
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0,40,0)
					
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0,40,0)
					
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame*CFrame.new(0,40,0)
					
									end
								else
									game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6438.73535, 250.645355, -4501.50684)
								end
							end
						end
					end)
					
					AutoFarm:Toggle("Auto Raid",function(t)
						_G.AutoRaid = t
					end)
					game:GetService("RunService").RenderStepped:Connect(function()
						if _G.AutoRaid then
							game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
						end
					end)
					  
						spawn(function()
						  while wait(.1) do
							  if _G.AutoRaid then
								for i,v in pairs(game.Workspace:GetChildren()) do
								   if string.find(v.Name, "Fruit") then
								   v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
								   end
								end
								if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
								if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1")  then
									  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", selectchip)
								end
								   if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or  game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip")  then
									  fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
								   end
								end
								  for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
								   if _G.AutoRaid and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
									  pcall(function()
										 repeat wait(.1)
											if sethiddenproperty then
											   sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											end
											v.HumanoidRootPart.Transparency = 0.75
											v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
											v.HumanoidRootPart.CanCollide = false
											v.Humanoid.Health = 0
										 until not _G.AutoRaid or not v.Parent or v.Humanoid.Health <= 0
									  end)
								   end
								end
								if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
								   if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
									  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0,10,0)
								   elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
									  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0,10,0)
								   elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
									  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0,10,0)
								   elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
									  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0,10,0)
								   elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
									  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame*CFrame.new(0,10,0)
								   end
								else
								   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6438.73535, 250.645355, -4501.50684)
								end
								local args = {
								   [1] = "Awakener",
								   [2] = "Check"
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								local args = {
								   [1] = "Awakener",
								   [2] = "Awaken"
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
						  end
						end)
						AutoFarm:Drop("Select Microchip To Auto Raid",{"Flame","Ice","Quake","Light","Dark","String","Rumble"},function(t)
							  selectchip = t
						  end)
					
					AutoFarm:h1("Config")
					
					LockLevelValue = 1525
					OldLevel = game.Players.localPlayer.Data.Level.Value
					local sldr = AutoFarm:Slider("Select Level", 0, 1525, 1, function(value)
						LockLevelValue = value
					end)
					
					AutoFarm:Toggle("Lock Level",function(value)
						LockLevel = value
					end)
					
					spawn(function()
						while wait(.1) do
							if LockLevel then
								if game.Players.localPlayer.Data.Level.Value >= LockLevelValue then
									game.Players.localPlayer:Kick("\n Auto Fram Completed Level : "..game.Players.localPlayer.Data.Level.Value.."\n Old Level : "..OldLevel.."\nUsername : "..game.Players.LocalPlayer.Name)
								end
							end
						end
					end)
					
					AutoFarm:Toggle("Show Hitbox",function(value)
						HideHitBlox = value
					end)
					
					_G.AUTOHAKI = true
					AutoFarm:Toggle("Auto Haki",function(value)
						_G.AUTOHAKI = value
					end)
					
					spawn(function()
						while wait(2.5) do
							if _G.AUTOHAKI then
								if game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
					
								else
									local args = {
										[1] = "Buso"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
							end
						end
					end)
					
					AutoFarm:Toggle("Anti - AFK",function(value)
						local value = game:GetService("VirtualUser")
						game:GetService("Players").LocalPlayer.Idled:connect(function()
							value:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
							wait(1)
							value:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
						end)
					end)
					
					AutoFarm:h1("Auto Skill Devil Fruit")
					
					AutoFarm:Toggle("Skill Z",function(value)
						SkillZ = value
					end)
					
					AutoFarm:Toggle("Skill X",function(value)
						SkillX = value
					end)
					
					AutoFarm:Toggle("Skill C",function(value)
						SkillC = value
					end)
					
					AutoFarm:Toggle("Skill V",function(value)
						SkillV = value
					end)
					
					AutoFarm:h1("Auto Stats")
					
					melee = false
					AutoFarm:Toggle("Melee",function(value)
						melee = value
					end)
					defense = false
					AutoFarm:Toggle("Defense",function(value)
						defense = value
					end)
					sword = false
					AutoFarm:Toggle("Sword",function(value)
						sword = value
					end)
					gun = false
					AutoFarm:Toggle("Gun",function(value)
						gun = value
					end)
					demonfruit = false
					AutoFarm:Toggle("Devil Fruit",function(value)
						demonfruit = value
					end)
					PointStats = 1
					AutoFarm:Slider("Point", 0, 10, PointStats, function(value)
						PointStats = value
					end)
					
					spawn(function()
						while wait() do
							pcall(function()
								if game.Players.localPlayer.Data.Points.Value >= PointStats then
									if melee then
										local args = {
											[1] = "AddPoint",
											[2] = "Melee",
											[3] = PointStats
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									if defense then
										local args = {
											[1] = "AddPoint",
											[2] = "Defense",
											[3] = PointStats
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									if sword then
										local args = {
											[1] = "AddPoint",
											[2] = "Sword",
											[3] = PointStats
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									if gun then
										local args = {
											[1] = "AddPoint",
											[2] = "Gun",
											[3] = PointStats
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
									if demonfruit then
										local args = {
											[1] = "AddPoint",
											[2] = "Demon Fruit",
											[3] = PointStats
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
								end
							end)
					
						end
					end)
					
					Stat:h1("Combat")
					
					Stat:Toggle("ESP - Player",function(value)
						ESPPlayer = value
						while ESPPlayer do wait()
							UpdatePlayerChams()
						end
					end)
					
					PlayerName = {}
					for i,v in pairs(game.Players:GetChildren()) do
						table.insert(PlayerName ,v.Name)
					end
					
					local Player = Stat:Drop("Select Player",PlayerName, function(plr)
						SelectedKillPlayer = plr
					end)
					
					Stat:Toggle("Kill Player",function(value)
						KillPlayer = value
						if KillPlayer == false then
							game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
						end
						spawn(function()
							while wait() do
								pcall(function()
									if KillPlayer then
										EquipWeapon(SelectToolWeapon)
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.CFrame * CFrame.new(0,15,0)
										game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Size = Vector3.new(60,60,60)
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									end
								end)
							end
						end)
					end)
					
					spawn(function()
						while wait() do
							pcall(function()
								if KillPlayer then
									if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
										local args = {
											[1] = "Buso"
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
								end
							end)
						end
					end)
					
					game:GetService("RunService").Heartbeat:Connect(function()
						if KillPlayer or NextIsland then
							game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
						end
					end)
					
					spawn(function()
						pcall(function()
							while wait() do
								for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
									if v:IsA("Tool") then
										if v:FindFirstChild("RemoteFunctionShoot") then 
											SelectToolWeaponGun = v.Name
										end
									end
								end
							end
						end)
					end)
					
					Stat:Toggle("Spectate Player",function(value)
						Sp = value
						local plr1 = game.Players.LocalPlayer.Character.Humanoid
						local plr2 = game.Players:FindFirstChild(SelectedKillPlayer)
						repeat wait(.1)
							game.Workspace.Camera.CameraSubject = plr2.Character.Humanoid
						until Sp == false
						game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
					end)
					
					Stat:Button("Teleport Player",function()
						local plr1 = game.Players.LocalPlayer.Character
						local plr2 = game.Players:FindFirstChild(SelectedKillPlayer)
						plr1.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame
					end)
					
					Stat:Toggle("Aimbot Gun",function(bool)
						Aimbot = bool
					end)
					local lp = game:GetService('Players').LocalPlayer
					local mouse = lp:GetMouse()
					mouse.Button1Down:Connect(function()
						if Aimbot and game.Players.LocalPlayer.Character:FindFirstChild(SelectToolWeaponGun) then
							local args = {
								[1] = game:GetService("Players"):FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Position,
								[2] = game:GetService("Players"):FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart
							}
							game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
						end 
					end)
					Stat:Toggle("Aimbot Skill",function(bool)
						AimbotSkill = bool
						while AimbotSkill do wait()
							pcall(function()
								if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
									local args = {
										[1] = game:GetService("Players"):FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Position
									}
									game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
								end
							end)
						end
					end)
					
					
					BountyLock = 25000000
					BountyValue = game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value
					Stat:Slider("Select Bounty", 0, 25000000, 1, function(value)
						BountyLock = value
					end)
					
					Stat:Toggle("Lock Bounty",false,function(value)
						Bounty = value
					end)
					
					spawn(function()
						while wait(.1) do
							if Bounty then
								if game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value >= BountyLock then
									game.Players.localPlayer:Kick("\n Auto Farm Bounty Completed : "..game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value)
								end
							end
						end
					end)
					
					Teleport:h1("Teleports")
					
					Teleport:Toggle("Ctrl + Click = TP",function(value)
						CTRL = value
					end)
					
					local Plr = game:GetService("Players").LocalPlayer
					local Mouse = Plr:GetMouse()
					Mouse.Button1Down:connect(function()
						if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
							return
						end
						if not Mouse.Target then
							return
						end
						if CTRL then
							Plr.Character:MoveTo(Mouse.Hit.p)
						end
					end)
					
					if OldWorld then
						Teleport:Button("Teleport to New World",function()
							local args = {
								[1] = "TravelDressrosa" -- OLD WORLD to NEW WORLD
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						end)
					end
					if NewWorld then
						Teleport:Button("Teleport to Old World",function()
							local args = {
								[1] = "TravelMain" -- new to old
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						end)
					end
					
					if NewWorld then
						Teleport:Button("Teleport to SeaBeasts",function()
							for i,v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
								if v:FindFirstChild("HumanoidRootPart") then
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,100,0)
								end
							end
						end)
					end
					
					Teleport:Button("Current Quest",function()
						CheckQuest()
						wait(0.25)
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
					end)
					
					if OldWorld then
					
						Teleport:Button("Start Island",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1071.2832, 16.3085976, 1426.86792)
						end)
					
						Teleport:Button("Marine Start",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2573.3374, 6.88881969, 2046.99817)
						end)
					
						Teleport:Button("Middle Town",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-655.824158, 7.88708115, 1436.67908)
						end)
					
						Teleport:Button("Jungle",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1249.77222, 11.8870859, 341.356476)
						end)
					
						Teleport:Button("Pirate Village",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1122.34998, 4.78708982, 3855.91992)
						end)
					
						Teleport:Button("Desert",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1094.14587, 6.47350502, 4192.88721)
						end)
					
						Teleport:Button("Frozen Village",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1198.00928, 27.0074959, -1211.73376)
						end)
					
						Teleport:Button("MarineFord",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4505.375, 20.687294, 4260.55908)
						end)
					
						Teleport:Button("Colosseum",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1428.35474, 7.38933945, -3014.37305)
						end)
					
						Teleport:Button("Sky 1st Floor",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4970.21875, 717.707275, -2622.35449)
						end)
					
						Teleport:Button("Sky 2st Floor",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4813.0249, 903.708557, -1912.69055)
						end)
					
						Teleport:Button("Sky 3st Floor",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7952.31006, 5545.52832, -320.704956)
						end)
					
						Teleport:Button("Prison",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4854.16455, 5.68742752, 740.194641)
						end)
					
						Teleport:Button("Magma Village",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5231.75879, 8.61593437, 8467.87695)
						end)
					
						Teleport:Button("UnderWater City",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(61163.8516, 11.7796879, 1819.78418)
						end)
					
						Teleport:Button("Fountain City",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5132.7124, 4.53632832, 4037.8562)
						end)
					
						Teleport:Button("House Cyborg's",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6262.72559, 71.3003616, 3998.23047)
						end)
					
						Teleport:Button("Shank's Room",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1442.16553, 29.8788261, -28.3547478)
						end)
					
						Teleport:Button("Mob Island",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2850.20068, 7.39224768, 5354.99268)
						end)
					elseif NewWorld then
						Teleport:Button("First Spot",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(82.9490662, 18.0710983, 2834.98779)
						end)
					
						Teleport:Button("Kingdom of Rose",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["_WorldOrigin"].Locations["Kingdom of Rose"].CFrame
						end)
					
						Teleport:Button("Dark Areas",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["_WorldOrigin"].Locations["Dark Arena"].CFrame
						end)
					
						Teleport:Button("Flamingo Mansion",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-390.096313, 331.886475, 673.464966)
						end)
					
						Teleport:Button("Flamingo Room",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2302.19019, 15.1778421, 663.811035)
						end)
					
						Teleport:Button("Green bit",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2372.14697, 72.9919434, -3166.51416)
						end)
					
						Teleport:Button("Cafe",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-385.250916, 73.0458984, 297.388397)
						end)
					
						Teleport:Button("Factory",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(430.42569, 210.019623, -432.504791)
						end)
					
						Teleport:Button("Colosseum",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1836.58191, 44.5890656, 1360.30652)
						end)
					
						Teleport:Button("Ghost Island",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5571.84424, 195.182297, -795.432922)
						end)
					
						Teleport:Button("Ghost Island 2nd",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5931.77979, 5.19706631, -1189.6908)
						end)
					
						Teleport:Button("Snow Mountain",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1384.68298, 453.569031, -4990.09766)
						end)
					
						Teleport:Button("Hot and Cold",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6026.96484, 14.7461271, -5071.96338)
						end)
					
						Teleport:Button("Magma Side",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5478.39209, 15.9775667, -5246.9126)
						end)
					
						Teleport:Button("Cursed Ship",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(902.059143, 124.752518, 33071.8125)
						end)
					
						Teleport:Button("Frosted Island",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5400.40381, 28.21698, -6236.99219)
						end)
					
						Teleport:Button("Forgotten Island",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3043.31543, 238.881271, -10191.5791)
						end)
					
						Teleport:Button("Usoopp Island",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4748.78857, 8.35370827, 2849.57959)
						end)
					
						Teleport:Button("Raids Low",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5554.95313, 329.075623, -5930.31396)
						end)
					
						Teleport:Button("Minisky Island",function()
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-260.358917, 49325.7031, -35259.3008)
						end)
					end
					
					Misc:h1("Visuals")
					
					function isnil(thing)
						return (thing == nil)
					end
					local function round(n)
						return math.floor(tonumber(n) + 0.5)
					end
					Number = math.random(1, 1000000)
					
					function UpdatePlayerChams()
						for i,v in pairs(game:GetService'Players':GetChildren()) do
							pcall(function()
								if not isnil(v.Character) then
									if ESPPlayer then
										if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
											local bill = Instance.new('BillboardGui',v.Character.Head)
											bill.Name = 'NameEsp'..Number
											bill.ExtentsOffset = Vector3.new(0, 1, 0)
											bill.Size = UDim2.new(1,200,1,30)
											bill.Adornee = v.Character.Head
											bill.AlwaysOnTop = true
											local name = Instance.new('TextLabel',bill)
											name.Font = "GothamBold"
											name.FontSize = "Size14"
											name.TextWrapped = true
											name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
											name.Size = UDim2.new(1,0,1,0)
											name.TextYAlignment = 'Top'
											name.BackgroundTransparency = 1
											name.TextStrokeTransparency = 0.5
											if v.Team == game.Players.LocalPlayer.Team then
												name.TextColor3 = Color3.new(0.360784, 0.0666667, 1)
											else
												name.TextColor3 = Color3.new(0.0392157, 0.294118, 1)
											end
										else
											v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
										end
									else
										if v.Character.Head:FindFirstChild('NameEsp'..Number) then
											v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
										end
									end
								end
							end)
						end
					end
					
					function UpdateChestChams()
						for i,v in pairs(game.Workspace:GetChildren()) do
							pcall(function()
								if string.find(v.Name,"Chest") then
									if ChestESP then
										if string.find(v.Name,"Chest") then
											if not v:FindFirstChild('NameEsp'..Number) then
												local bill = Instance.new('BillboardGui',v)
												bill.Name = 'NameEsp'..Number
												bill.ExtentsOffset = Vector3.new(0, 1, 0)
												bill.Size = UDim2.new(1,200,1,30)
												bill.Adornee = v
												bill.AlwaysOnTop = true
												local name = Instance.new('TextLabel',bill)
												name.Font = "GothamBold"
												name.FontSize = "Size14"
												name.TextWrapped = true
												name.Size = UDim2.new(1,0,1,0)
												name.TextYAlignment = 'Top'
												name.BackgroundTransparency = 1
												name.TextStrokeTransparency = 0.5
												if v.Name == "Chest1" then
													name.TextColor3 = Color3.fromRGB(255, 255, 255)
													name.Text = ("Bronze Chest " ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
												end
												if v.Name == "Chest2" then
													name.TextColor3 = Color3.fromRGB(255, 255, 127)
													name.Text = ("Gold Chest" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
												end
												if v.Name == "Chest3" then
													name.TextColor3 = Color3.fromRGB(5, 243, 255)
													name.Text = ("Diamond Chest" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
												end
											else
												v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
											end
										end
									else
										if v:FindFirstChild('NameEsp'..Number) then
											v:FindFirstChild('NameEsp'..Number):Destroy()
										end
									end
								end
							end)
						end
					end
					
					function UpdateDevilChams()
						for i,v in pairs(game.Workspace:GetChildren()) do
							pcall(function()
								if DevilFruitESP then
									if string.find(v.Name, "Fruit") then
										if not v.Handle:FindFirstChild('NameEsp'..Number) then
											local bill = Instance.new('BillboardGui',v.Handle)
											bill.Name = 'NameEsp'..Number
											bill.ExtentsOffset = Vector3.new(0, 1, 0)
											bill.Size = UDim2.new(1,200,1,30)
											bill.Adornee = v.Handle
											bill.AlwaysOnTop = true
											local name = Instance.new('TextLabel',bill)
											name.Font = "GothamBold"
											name.FontSize = "Size14"
											name.TextWrapped = true
											name.Size = UDim2.new(1,0,1,0)
											name.TextYAlignment = 'Top'
											name.BackgroundTransparency = 1
											name.TextStrokeTransparency = 0.5
											name.TextColor3 = Color3.fromRGB(0, 255, 0)
											name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
										else
											v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
										end
									end
								else
									if v.Handle:FindFirstChild('NameEsp'..Number) then
										v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
									end
								end
							end)
						end
					end
					
					function UpdateFlowerChams()
						for i,v in pairs(game.Workspace:GetChildren()) do
							pcall(function()
								if v.Name == "Flower2" or v.Name == "Flower1" then
									if FlowerESP then
										if not v:FindFirstChild('NameEsp'..Number) then
											local bill = Instance.new('BillboardGui',v)
											bill.Name = 'NameEsp'..Number
											bill.ExtentsOffset = Vector3.new(0, 1, 0)
											bill.Size = UDim2.new(1,200,1,30)
											bill.Adornee = v
											bill.AlwaysOnTop = true
											local name = Instance.new('TextLabel',bill)
											name.Font = "GothamBold"
											name.FontSize = "Size14"
											name.TextWrapped = true
											name.Size = UDim2.new(1,0,1,0)
											name.TextYAlignment = 'Top'
											name.BackgroundTransparency = 1
											name.TextStrokeTransparency = 0.5
											name.TextColor3 = Color3.fromRGB(248, 41, 41)
											if v.Name == "Flower1" then
												name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
												name.TextColor3 = Color3.fromRGB(28, 126, 255)
											end
											if v.Name == "Flower2" then
												name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
												name.TextColor3 = Color3.fromRGB(248, 41, 41)
											end
										else
											v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
										end
									else
										if v:FindFirstChild('NameEsp'..Number) then
											v:FindFirstChild('NameEsp'..Number):Destroy()
										end
									end
								end
							end)
						end
					end
					
					Misc:Toggle("ESP - Chest",function(value)
						ChestESP = value
						while ChestESP do wait()
							UpdateChestChams()
						end
					end)
					
					Misc:Toggle("ESP - Devil Fruits",function(value)
						DevilFruitESP = value
						while DevilFruitESP do wait()
							UpdateDevilChams()
						end
					end)
					
					if NewWorld then
						Misc:Toggle("ESP - Flowers",function(value)
							FlowerESP = value
							while FlowerESP do wait()
								UpdateFlowerChams()
							end
						end)
					end
					
					Misc:h1("Fighting Style Shop")
					
					
					Misc:Button("Buy Blackleg $150,000",function()
						local args = {
							[1] = "BuyBlackLeg"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end)
					
					Misc:Button("Buy Electro $500,000",function()
						local args = {
							[1] = "BuyElectro"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end)
					
					Misc:Button("Buy Fishman Karate $750,000",function()
						local args = {
							[1] = "BuyFishmanKarate"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end)
					
					Misc:Button("Buy Dragon Breath $F 1,500",function()
						local args = {
							[1] = "BlackbeardReward",
							[2] = "DragonClaw",
							[3] = "1"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						local args = {
							[1] = "BlackbeardReward",
							[2] = "DragonClaw",
							[3] = "2"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end)
					
					Misc:Button("Buy Superhuman $3M",function()
						local args = {
							[1] = "BuySuperhuman"
						}
					
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end)
					
					Misc:Button("Buy DeathStep $2.5M",function()
						local args = {
							[1] = "BuyDeathStep"
						}
					
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end)
					
					Misc:Button("Buy Sharkman Karate $2.5M",function()
						local args = {
							[1] = "BuySharkmanKarate",
							[2] = true
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						local args = {
							[1] = "BuySharkmanKarate"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end)
					
					Misc:h1("Auto Buy")
					
					Misc:Toggle("Auto Buy Legendary Sword",function(value)
						LegebdarySword = value
						while LegebdarySword do wait()
							if LegebdarySword then
								local args = {
									[1] = "LegendarySwordDealer",
									[2] = "2"
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							end
						end
					end)
					
					Misc:Toggle("Auto Buy Haki Color",function(value)
						HakiColor = value
					end)
					
					---- [Auto Buy Haki Color]
					spawn(function()
						while wait(.3) do
							if HakiColor then
								pcall(function()
									local args = {
										[1] = "ColorsDealer",
										[2] = "2"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end)
							end
						end
					end)
					
					SelectDevil = ""
					Misc:Drop("Select DevilFruits",{"Smoke-Smoke","Flame-Flame","Ice-Ice","Sand-Sand","Dark-Dark","Light-Light","Rubber-Rubber","Barrier-Barrier","Magma-Magma","Quake-Quake","Human-Human: Buddha","String-String","Bird-Bird: Phoenix","Rumble-Rumble","Paw-Paw","Gravity-Gravity","Dough-Dough","Control-Control","Dragon-Dragon"},function(plr)
						SelectDevil = plr
					end)
					
					Misc:Toggle("DevilFruits Sniper",function(value)
						BuyFruitSinper = value
					end)
					
					---- [DevilFruits Sniper]
					
					spawn(function()
						while wait(.1) do
							if BuyFruitSinper then
								local args = {
									[1] = "GetFruits"
								}
					
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								local args = {
									[1] = "PurchaseRawFruit",
									[2] = SelectDevil
								}
					
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							end
						end
					end)
					
					Misc:h1("Abilities Shop")
					
					
					Misc:Button("Buy Buso Haki $25,000 ",function()
						local args = {
							[1] = "BuyHaki",
							[2] = "Buso"
						}
					
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end)
					
					Misc:Button("Buy Geppo $10,000 ",function()
						local args = {
							[1] = "BuyHaki",
							[2] = "Geppo"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end)
					
					Misc:Button("Buy Soru $100,000 ",function()
						local args = {
							[1] = "BuyHaki",
							[2] = "Soru"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end)
					
					Buy:h1("Misc")
					
					Buy:Toggle("Tp Chest",function(value)
						TpChest = value
					end)
					
					game:GetService("RunService").Heartbeat:Connect(function()
						if TpChest then
							game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
						end
					end)
					
					spawn(function()
						pcall(function()
							while wait() do
								if TpChest then
									for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
										if v.Name == "Chest1" or v.Name == "Chest2" or v.Name == "Chest3" then
											tweenServicez, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1.5, Enum.EasingStyle.Quad)
											tweene = tweenServicez:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = v.CFrame})
											tweene:Play()
										end
									end
								end
							wait(4)
							end
						end)
					end)
					
					Buy:Toggle("Infinity Energy",function(value)
						InfinitsEnergy = value
					end)
					
					local LocalPlayer = game:GetService'Players'.LocalPlayer
					local originalstam = LocalPlayer.Character.Energy.Value
					function infinitestam()
						LocalPlayer.Character.Energy.Changed:connect(function()
							if InfinitsEnergy then
								LocalPlayer.Character.Energy.Value = originalstam
							end
						end)
					end
					spawn(function()
						while wait(.1) do
							pcall(function()
								if InfinitsEnergy then
									wait(0.3)
									originalstam = LocalPlayer.Character.Energy.Value
									infinitestam()
								end
							end)
						end
					end)
					
					Buy:Toggle("Dodge No Cooldown",function(value)
						nododgecool = value
						NoDodgeCool()
					end)
					
					nododgecool = false
					function NoDodgeCool()
						if nododgecool then
							for i,v in next, getgc() do
								if game.Players.LocalPlayer.Character.Dodge then
									if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Dodge then
										for i2,v2 in next, getupvalues(v) do
											if tostring(v2) == "0.4" then
												repeat wait(.1)
													setupvalue(v,i2,0)
												until not nododgecool
											end
										end
									end
								end
							end
						end
					end
					
					Buy:Toggle("Clone[LagServer]", function(vu)
						Clone = vu
						game:GetService("RunService").RenderStepped:Connect(function()
							if Clone == true then
								local args = {
									[1] = "SetTeam",
									[2] = "Pirates"
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							end
						end)
					end)
					
					Buy:Toggle("Bring Fruit",function(value)
						_G.BringFruit = value
						pcall(function()
							while _G.BringFruit do wait()
								for i,v in pairs(game.Workspace:GetChildren()) do
									if v:IsA "Tool" then
										v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
									end
								end
							end
						end)
					end)
					
					Buy:h1("Local Player")
					
					Buy:Toggle("Fly",function(value)
						Fly = value
						activatefly()
					end)
					
					Fly = false
					function activatefly()
						local mouse=game.Players.LocalPlayer:GetMouse''
						localplayer=game.Players.LocalPlayer
						game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
						local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
						local speedSET= 25
						local keys={a=false,d=false,w=false,s=false}
						local e1
						local e2
						local function start()
							local pos = Instance.new("BodyPosition",torso)
							local gyro = Instance.new("BodyGyro",torso)
							pos.Name="WEEE"
							gyro.Name = "WEEE"
							pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
							pos.position = torso.Position
							gyro.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
							gyro.cframe = torso.CFrame
							repeat
								wait()
								localplayer.Character.Humanoid.PlatformStand=true
								local new=gyro.cframe - gyro.cframe.p + pos.position
								if not keys.w and not keys.s and not keys.a and not keys.d then
									speed= 1
								end
								if keys.w then
									new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
									speed=speed+speedSET
								end
								if keys.s then
									new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
									speed=speed+speedSET
								end
								if keys.d then
									new = new * CFrame.new(speed,0,0)
									speed=speed+speedSET
								end
								if keys.a then
									new = new * CFrame.new(-speed,0,0)
									speed=speed+speedSET
								end
								if speed>speedSET then
									speed=speedSET
								end
								pos.position=new.p
								if keys.w then
									gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
								elseif keys.s then
									gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
								else
									gyro.cframe = workspace.CurrentCamera.CoordinateFrame
								end
							until not Fly
							if gyro then
								gyro:Destroy()
							end
							if pos then
								pos:Destroy()
							end
							flying = false
							localplayer.Character.Humanoid.PlatformStand=false
							speed= 0
						end
						e1=mouse.KeyDown:connect(function(key)
							if not torso or not torso.Parent then
								flying=false e1:disconnect() e2:disconnect() return
							end
							if key=="w" then
								keys.w=true
							elseif key=="s" then
								keys.s=true
							elseif key=="a" then
								keys.a=true
							elseif key=="d" then
								keys.d=true
							end
						end)
						e2=mouse.KeyUp:connect(function(key)
							if key=="w" then
								keys.w=false
							elseif key=="s" then
								keys.s=false
							elseif key=="a" then
								keys.a=false
							elseif key=="d" then
								keys.d=false
							end
						end)
						start()
					end
					
					Buy:Toggle("No-Clip",function(value)
						NoClip = value
					end)
					
					game:GetService("RunService").Heartbeat:Connect(function()
						if NoClip then
							game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
						end
					end)
					
					function infAb()
						if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
							game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
						end
						if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
							game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
						end
						if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
							game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
						end
						if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
							game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
						end
						wait(.1)
						local inf = Instance.new("ParticleEmitter")
						inf.Acceleration = Vector3.new(0,0,0)
						inf.Archivable = true
						inf.Drag = 20
						inf.EmissionDirection = Enum.NormalId.Top
						inf.Enabled = true
						inf.Lifetime = NumberRange.new(0.2,0.2)
						inf.LightInfluence = 0
						inf.LockedToPart = true
						inf.Name = "Agility"
						inf.Rate = 500
						local numberKeypoints2 = {
							NumberSequenceKeypoint.new(0, 0);  -- At t=0, size of 0
							NumberSequenceKeypoint.new(1, 4); -- At t=1, size of 10
						}
						
						inf.Size = NumberSequence.new(numberKeypoints2)
						inf.RotSpeed = NumberRange.new(999, 9999)
						inf.Rotation = NumberRange.new(0, 0)
						inf.Speed = NumberRange.new(30, 30)
						inf.SpreadAngle = Vector2.new(360,360)
						inf.Texture = "rbxassetid://243098098"
						inf.VelocityInheritance = 0
						inf.ZOffset = 2
						inf.Transparency = NumberSequence.new(0)
						inf.Color = ColorSequence.new(Color3.fromRGB(0, 255, 255),Color3.fromRGB(0, 255, 255))
						inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
						
						local inf2 = Instance.new("ParticleEmitter")
						inf2.Acceleration = Vector3.new(0,0,0)
						inf2.Archivable = true
						inf2.Drag = 20
						inf2.EmissionDirection = Enum.NormalId.Top
						inf2.Enabled = true
						inf2.Lifetime = NumberRange.new(0.2,0.2)
						inf2.LightInfluence = 0
						inf2.LockedToPart = true
						inf2.Name = "Agility"
						local numberKeypoints3 = {
							NumberSequenceKeypoint.new(0, 0);  -- At t=0, size of 0
							NumberSequenceKeypoint.new(1, 4); -- At t=1, size of 10
						}
					
						inf2.Size = NumberSequence.new(numberKeypoints3)
						inf2.Rate = 500
						inf2.RotSpeed = NumberRange.new(999, 9999)
						inf2.Rotation = NumberRange.new(0, 0)
						inf2.Speed = NumberRange.new(30, 30)
						inf2.SpreadAngle = Vector2.new(360,360)
						inf2.Texture = "rbxassetid://243098098"
						inf2.VelocityInheritance = 0
						inf2.Transparency = NumberSequence.new(0)
						inf2.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0),Color3.fromRGB(255, 0, 0))
						inf2.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
						
						local inf3 = Instance.new("ParticleEmitter")
						inf3.Acceleration = Vector3.new(0,0,0)
						inf3.Archivable = true
						inf3.Drag = 20
						inf3.EmissionDirection = Enum.NormalId.Top
						inf3.Enabled = true
						inf3.Lifetime = NumberRange.new(0.2,0.2)
						inf3.LightInfluence = 0
						inf3.LockedToPart = true
						inf3.Name = "Agility"
						local numberKeypoints4 = {
							NumberSequenceKeypoint.new(0, 0);  -- At t=0, size of 0
							NumberSequenceKeypoint.new(1, 4); -- At t=1, size of 10
						}
					
						inf3.Size = NumberSequence.new(numberKeypoints4)
						inf3.Rate = 500
						inf3.RotSpeed = NumberRange.new(999, 9999)
						inf3.Rotation = NumberRange.new(0, 0)
						inf3.Speed = NumberRange.new(30, 30)
						inf3.SpreadAngle = Vector2.new(360,360)
						inf3.Texture = "rbxassetid://243098098"
						inf3.VelocityInheritance = 0
						inf3.Transparency = NumberSequence.new(0)
						inf3.Color = ColorSequence.new(Color3.fromRGB(255, 255, 0),Color3.fromRGB(255, 255, 0))
						inf3.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
						
						local inf4 = Instance.new("ParticleEmitter")
						inf4.Acceleration = Vector3.new(0,0,0)
						inf4.Archivable = true
						inf4.Drag = 20
						inf4.EmissionDirection = Enum.NormalId.Top
						inf4.Enabled = true
						inf4.Lifetime = NumberRange.new(0.2,0.2)
						inf4.LightInfluence = 0
						inf4.LockedToPart = true
						inf4.Name = "Agility"
						local numberKeypoints5 = {
							NumberSequenceKeypoint.new(0, 0);  -- At t=0, size of 0
							NumberSequenceKeypoint.new(1, 4); -- At t=1, size of 10
						}
					
						inf4.Size = NumberSequence.new(numberKeypoints5)
						inf4.Rate = 500
						inf4.RotSpeed = NumberRange.new(999, 9999)
						inf4.Rotation = NumberRange.new(0, 0)
						inf4.Speed = NumberRange.new(30, 30)
						inf4.SpreadAngle = Vector2.new(360,360)
						inf4.Texture = "rbxassetid://243098098"
						inf4.VelocityInheritance = 0
						inf4.Transparency = NumberSequence.new(0)
						inf4.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255),Color3.fromRGB(255, 6, 60))
						inf4.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
					end
					
					Buy:Toggle("Inf Ability",function(inf)
						if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
							game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
						end
						if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
							game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
						end
						if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
							game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
						end
						if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
							game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
						end
						wait()
						InfAbility = inf
					end)
					
					spawn(function()
						while wait(1) do
							pcall(function()
								if InfAbility then
									if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
										if InfAbility == true then
											infAb()
										elseif InfAbility == false then
											if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
												game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
											end
											if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
												game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
											end
											if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
												game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
											end
											if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
												game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
											end
										else
											if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
												game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
											end
											if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
												game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
											end
											if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
												game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
											end
											if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
												game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
											end
										end
									end
								end
							end)
						end
					end)
					
					Buy:h1("Tab UI")
					
					Buy:Button("Devil Fruit Shop",function()
						local args = {
							[1] = "GetFruits"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
					end)
					
					Buy:Button("Inventory",function()
						local args = {
							[1] = "getInventoryWeapons"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
					end)
					
					Buy:Button("Color Haki",function()
						game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
					end)
					
					Buy:Button("Title Name",function()
						local args = {
							[1] = "getTitles"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
					end)
					
					Settings:h1("Demon Hub")
					
					Settings:h1("Paid Script")
					
					Settings:Button("Rejoin",function()
						local ts = game:GetService("TeleportService")
						local p = game:GetService("Players").LocalPlayer
						ts:Teleport(game.PlaceId, p)
					end)
					
					Settings:Button("Server Hop",function()
						local PlaceID = game.PlaceId
						local AllIDs = {}
						local foundAnything = ""
						local actualHour = os.date("!*t").hour
						local Deleted = false
						function TPReturner()
							local Site;
							if foundAnything == "" then
								Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
							else
								Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
							end
							local ID = ""
							if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
								foundAnything = Site.nextPageCursor
							end
							local num = 0;
							for i,v in pairs(Site.data) do
								local Possible = true
								ID = tostring(v.id)
								if tonumber(v.maxPlayers) > tonumber(v.playing) then
									for _,Existing in pairs(AllIDs) do
										if num ~= 0 then
											if ID == tostring(Existing) then
												Possible = false
											end
										else
											if tonumber(actualHour) ~= tonumber(Existing) then
												local delFile = pcall(function()
													-- delfile("NotSameServers.json")
													AllIDs = {}
													table.insert(AllIDs, actualHour)
												end)
											end
										end
										num = num + 1
									end
									if Possible == true then
										table.insert(AllIDs, ID)
										wait()
										pcall(function()
											-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
											wait()
											game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
										end)
										wait(4)
									end
								end
							end
						end
						function Teleport()
							while wait() do
								pcall(function()
									TPReturner()
									if foundAnything ~= "" then
										TPReturner()
									end
								end)
							end
						end
						Teleport()
					end)
                    else
                        print("Invalid Hwid")
                        game.Players.LocalPlayer:Kick("Invalid Hwid")
                                             local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(4888224079, p)
                end
           
            else
                print("Blacklist Reason : "..data.Reason)
                game.Players.LocalPlayer:Kick("Blacklist Reason : "..data.Reason)
                                     local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(4888224079, p)
                end
        else
            warn("Invalid Key")
            game.Players.LocalPlayer:Kick("Invalid Key")
                                 local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(4888224079, p)
end
end
if game:GetService("CoreGui"):FindFirstChild("_fhspy") then
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(4888224079, p)
end
if data.Key ~= key then
            local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(4888224079, p)
elseif data.Hwid ~= hwid then
                local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(4888224079, p)
end
    local old;old=hookfunction(string.len, newcclosure(function(t, ...)
   if (not t) then return old(t, ...) end;
  
   if (rawequal(old(t), 16)) then
       return false
   end;
   return old(t, ...)
end))
