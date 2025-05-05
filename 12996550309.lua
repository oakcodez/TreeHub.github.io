if game.PlaceId == 12996550309 then
	local CurrentVersion = "RunStar Simulator V1"

	local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

	local GUI = Mercury:Create{
		Name = CurrentVersion,
		Size = UDim2.fromOffset(600, 400),
		Theme = Mercury.Themes.Dark,
	}

	local IsFarmingWins = false
	local selectedTreadmillValue = nil
	local IsFarmingTreadmill = false

	local TreadList = {
		-- world 1
		["+1/s Treadmill"] = "1",
		["+5/s Treadmill"] = "2",
		["+10/s Treadmill"] = "3",
		["+20/s Treadmill"] = "4",
		["+25/s Treadmill"] = "5",
		["+30/s Treadmill"] = "6",
		-- world 2
		["+40/s Treadmill"] = "8",
		["+60/s Treadmill"] = "9",
		["+80/s Treadmill"] = "10",
		["+100/s Treadmill"] = "11",
		["+150/s Treadmill"] = "12",
		["+200/s Treadmill"] = "13",
		-- world 3
		["+1000/s Treadmill"] = "15",
		["+1400/s Treadmill"] = "16",
		["+1800/s Treadmill"] = "17",
		["+2200/s Treadmill"] = "18",
		["+2600/s Treadmill"] = "19",
		["+3000/s Treadmill"] = "20",
		-- vip
		["+30s Treadmill"] = "7",
		["+120/s Treadmill"] = "14",
		["+2000/s Treadmill"] = "21",		
	}

	local FarmTab = GUI:Tab{
		Name = "Auto Farm",
	}

	local infWinsLabel = FarmTab:Label{
		Text = "",
		Description = "You must have that treadmill unlocked\nIf the farm doesn't work, enter the treadmill manually then leave the treadmill and try again." -- fixed comma
	}

	local FarmDropdown = FarmTab:Dropdown{
		Name = "Select Treadmill",
		StartingText = "Select...",
		Description = "It has to be an unlocked Treadmill!",
		Items = {
			"World 1 (placeholder don't select)",
			"+1/s Treadmill",
			"+5/s Treadmill",
			"+10/s Treadmill",
			"+20/s Treadmill",
			"+25/s Treadmill",
			"+30/s Treadmill",
			"World 2 (placeholder don't select)",
			"+40/s Treadmill",
			"+60/s Treadmill",
			"+80/s Treadmill",
			"+100/s Treadmill",
			"+150/s Treadmill",
			"+200/s Treadmill",
			"World 3 (placeholder don't select)",
			"+1000/s Treadmill",
			"+1400/s Treadmill",
			"+1800/s Treadmill",
			"+2200/s Treadmill",
			"+2600/s Treadmill",
			"+3000/s Treadmill",
			"V.I.P (placeholder don't select)",
			"+30s Treadmill",
			"+120/s Treadmill",
			"+2000/s Treadmill",
		},
		Callback = function(item) 
			selectedTreadmillValue = TreadList[item]
			print("Selected " .. tostring(selectedTreadmillValue))
		end
	}

	local Eggs = {
		["Common Egg"] = 1,
		["Uncommon Egg"] = 2,
		["Rare Egg"] = 3,
		["Epic Egg"] = 4,
		["Legendary Egg"] = 5,
		["Mythic Egg"] = 6,

	}

	FarmTab:Toggle{
		Name = "Start Farming",
		StartingState = false,
		Description = "Farms the selected Treadmill!",
		Callback = function(state) 
			IsFarmingTreadmill = state
			while IsFarmingTreadmill do
				if selectedTreadmillValue then
					local args = {
						[1] = selectedTreadmillValue,
					}
					game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Train"):WaitForChild("AddSpeed"):FireServer(unpack(args))
				end
				wait()
			end
		end
	}

	-- Infinite Wins World 1
	FarmTab:Toggle{
		Name = "Infinite Wins (World 1)",
		StartingState = false,
		Description = "World 1",
		Callback = function(state) 
			IsFarmingWins = state
			while IsFarmingWins do
				game:GetService("ReplicatedStorage").Remotes.Race.RacePrepare:InvokeServer()
				wait()
				game:GetService("ReplicatedStorage").Remotes.Race.RaceStart:FireServer()
				wait()
				game:GetService("ReplicatedStorage").Remotes.Race.RaceEnd:InvokeServer(1)
				wait()
				game:GetService("ReplicatedStorage").Remotes.Race.RaceReward:FireServer(true, 1, 1)
				wait()
			end
		end
	}

	-- Infinite Wins World 2
	FarmTab:Toggle{
		Name = "Infinite Wins (World 2)",
		StartingState = false,
		Description = "World 2",
		Callback = function(state) 
			IsFarmingWins = state
			while IsFarmingWins do
				game:GetService("ReplicatedStorage").Remotes.Race.RacePrepare:InvokeServer()
				wait()
				game:GetService("ReplicatedStorage").Remotes.Race.RaceStart:FireServer()
				wait()
				game:GetService("ReplicatedStorage").Remotes.Race.RaceEnd:InvokeServer(1)
				wait()
				game:GetService("ReplicatedStorage").Remotes.Race.RaceReward:FireServer(true, 2, 1)
				wait()
			end
		end
	}

	-- Infinite Wins World 3
	FarmTab:Toggle{
		Name = "Infinite Wins (World 3)",
		StartingState = false,
		Description = "World 3",
		Callback = function(state) 
			IsFarmingWins = state
			while IsFarmingWins do
				game:GetService("ReplicatedStorage").Remotes.Race.RacePrepare:InvokeServer()
				wait()
				game:GetService("ReplicatedStorage").Remotes.Race.RaceStart:FireServer()
				wait()
				game:GetService("ReplicatedStorage").Remotes.Race.RaceEnd:InvokeServer(1)
				wait()
				game:GetService("ReplicatedStorage").Remotes.Race.RaceReward:FireServer(true, 3, 1)
				wait()
			end
		end
	}

	local PetTab = GUI:Tab{
		Name = "Pets",
		Icon = nil
	}




end
