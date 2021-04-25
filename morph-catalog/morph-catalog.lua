-- settings
local MaxNumberOfColumn = 12
local MinNumberOfColumn = 3
local NumberOfColumn = 12
local MaxModelID = 95474
local WindowWidth = 1000
local WindowHeight = 760
-- vars
local Cells = {}
local OffsetModelID = 0
local ModelID = OffsetModelID
local LastMaxModelID = 0
local GoBackStack = {}
local GoBackDepth = 0
local DisplayFavorites = false
--
DMinstrelFavMorphs = {
	FavoriteList = {}
}

-- DMinstrelMorphFrame (main)
local DMinstrelMorphFrame = CreateFrame("Frame", nil, UIParent)
DMinstrelMorphFrame:Hide()
DMinstrelMorphFrame:SetFrameStrata("DIALOG")
DMinstrelMorphFrame:SetWidth(WindowWidth) 
DMinstrelMorphFrame:SetHeight(WindowHeight)
DMinstrelMorphFrame:SetPoint("CENTER",0,0)
DMinstrelMorphFrame:SetMovable(true)
DMinstrelMorphFrame:SetMinResize(400, 400)
DMinstrelMorphFrame:SetClampedToScreen(true)
DMinstrelMorphFrame:SetBackdrop( { 
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark", 
  edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", tile = true, tileSize = 32, edgeSize = 32, 
  insets = { left = 11, right = 12, top = 12, bottom = 11 }
})
-- end DMinstrelMorphFrame

if DMinstrel.Debug then
	print("DMinstrelMorphFrame OK")
end

-- Collection
DMinstrelMorphFrame.Collection = CreateFrame("Button",nil,DMinstrelMorphFrame, "UIPanelButtonTemplate")
DMinstrelMorphFrame.Collection:SetSize(120,30)
DMinstrelMorphFrame.Collection:SetPoint("TOPLEFT",10,-10)
DMinstrelMorphFrame.Collection:SetText("Collection")
DMinstrelMorphFrame.Collection:SetScript("OnClick", function(self, Button, Down)
	OffsetModelID = 0
	ModelID = 0
	DisplayFavorites = false
	--
	NumberOfColumn = MaxNumberOfColumn
	DMinstrelMorphFrame.Gallery:Load(true)
end)
-- end Collection

-- Favorites
DMinstrelMorphFrame.Favorites = CreateFrame("Button",nil,DMinstrelMorphFrame, "UIPanelButtonTemplate")
DMinstrelMorphFrame.Favorites:SetSize(120,30)
DMinstrelMorphFrame.Favorites:SetPoint("TOPLEFT",130,-10)
DMinstrelMorphFrame.Favorites:SetText("Favorites")
DMinstrelMorphFrame.Favorites:SetScript("OnClick", function(self, Button, Down)
	OffsetModelID = 0
	ModelID = 0
	DisplayFavorites = true
	GoBackDepth = 0
	DMinstrelMorphFrame.Gallery:Load(true)
end)
-- end Favorites

-- ModelPreview
DMinstrelMorphFrame.ModelPreview = CreateFrame("Frame",nil,DMinstrelMorphFrame)
DMinstrelMorphFrame.ModelPreview:SetScript("OnMouseDown", function(self, Button, Down)
	DMinstrelMorphFrame.ModelPreview:Hide()
end)
DMinstrelMorphFrame.ModelPreview:SetFrameStrata("DIALOG")
DMinstrelMorphFrame.ModelPreview:SetFrameLevel(5)
DMinstrelMorphFrame.ModelPreview:SetBackdrop( { 
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
  insets = { left = 11, right = 12, top = 12, bottom = 11 }
})
DMinstrelMorphFrame.ModelPreview:SetAllPoints()
--
DMinstrelMorphFrame.ModelPreview.ModelFrame = CreateFrame("PlayerModel", nil, DMinstrelMorphFrame.ModelPreview)
DMinstrelMorphFrame.ModelPreview:Hide()
--
DMinstrelMorphFrame.ModelPreview.FontString = DMinstrelMorphFrame.ModelPreview.ModelFrame:CreateFontString(nil,nil,"GameFontNormal")
DMinstrelMorphFrame.ModelPreview.FontString:SetPoint("TOP",0, 22)
--
DMinstrelMorphFrame.ModelPreview.ModelFrame.DisplayInfo = 0
DMinstrelMorphFrame.ModelPreview.ModelFrame:SetWidth(WindowWidth / 3) 
DMinstrelMorphFrame.ModelPreview.ModelFrame:SetHeight(WindowHeight / 2)
DMinstrelMorphFrame.ModelPreview.ModelFrame:SetPoint("CENTER",0,0)
DMinstrelMorphFrame.ModelPreview.ModelFrame:SetBackdrop( { 
  bgFile = "Interface\\FrameGeneral\\UI-Background-Marble.PNG",
  insets={bottom=-50, top=-40, left=-20, right=-20}
})
--
DMinstrelMorphFrame.ModelPreview.Favorite=DMinstrelMorphFrame.ModelPreview.ModelFrame:CreateTexture(nil,"ARTWORK")
DMinstrelMorphFrame.ModelPreview.Favorite:SetPoint("TOPLEFT",-20,30)
DMinstrelMorphFrame.ModelPreview.Favorite:SetSize(40,40)
DMinstrelMorphFrame.ModelPreview.Favorite:SetTexture("Interface\\Collections\\Collections")
DMinstrelMorphFrame.ModelPreview.Favorite:SetTexCoord(0.18, 0.02, 0.18, 0.07, 0.23, 0.02, 0.23, 0.07)
--
DMinstrelMorphFrame.ModelPreview.AddToFavorite = CreateFrame("Button",nil,DMinstrelMorphFrame.ModelPreview.ModelFrame, "UIPanelButtonTemplate")
DMinstrelMorphFrame.ModelPreview.AddToFavorite:SetSize(120,30)
DMinstrelMorphFrame.ModelPreview.AddToFavorite:SetPoint("BOTTOMLEFT",-10,-40)
DMinstrelMorphFrame.ModelPreview.AddToFavorite:SetText("Добавить в избранное")
DMinstrelMorphFrame.ModelPreview.AddToFavorite:SetScript("OnClick", function(self, Button, Down)
	DMinstrelFavMorphs.FavoriteList[DMinstrelMorphFrame.ModelPreview.ModelFrame.DisplayInfo] = 1
	DMinstrelMorphFrame.ModelPreview.AddToFavorite:Hide()
	DMinstrelMorphFrame.ModelPreview.RemoveFavorite:Show()
	DMinstrelMorphFrame.ModelPreview.Favorite:Show()
	ModelID = OffsetModelID
	DMinstrelMorphFrame.Gallery:Load()
end)
--
DMinstrelMorphFrame.ModelPreview.RemoveFavorite = CreateFrame("Button",nil,DMinstrelMorphFrame.ModelPreview.ModelFrame, "UIPanelButtonTemplate")
DMinstrelMorphFrame.ModelPreview.RemoveFavorite:SetSize(120,30)
DMinstrelMorphFrame.ModelPreview.RemoveFavorite:SetPoint("BOTTOMLEFT",-10,-40)
DMinstrelMorphFrame.ModelPreview.RemoveFavorite:SetText("Убрать")
DMinstrelMorphFrame.ModelPreview.RemoveFavorite:SetScript("OnClick", function(self, Button, Down)
	DMinstrelFavMorphs.FavoriteList[DMinstrelMorphFrame.ModelPreview.ModelFrame.DisplayInfo] = nil
	DMinstrelMorphFrame.ModelPreview.AddToFavorite:Show()
	DMinstrelMorphFrame.ModelPreview.RemoveFavorite:Hide()
	DMinstrelMorphFrame.ModelPreview.Favorite:Hide()
	ModelID = OffsetModelID
	DMinstrelMorphFrame.Gallery:Load()
end)
--
DMinstrelMorphFrame.ModelPreview.CopyID = CreateFrame("Button",nil,DMinstrelMorphFrame.ModelPreview.ModelFrame, "UIPanelButtonTemplate")
DMinstrelMorphFrame.ModelPreview.CopyID:SetSize(70,30)
DMinstrelMorphFrame.ModelPreview.CopyID:SetPoint("BOTTOMLEFT",120,-40)
DMinstrelMorphFrame.ModelPreview.CopyID:SetText("Скопировать ID")
DMinstrelMorphFrame.ModelPreview.CopyID:SetScript("OnClick", function(self, Button, Down)
	ChatFrame1EditBox:Show()
	ChatFrame1EditBox:SetFocus()
	ChatFrame1EditBox:SetText(".morph "..DMinstrelMorphFrame.ModelPreview.ModelFrame.DisplayInfo)
	ChatFrame1EditBox:HighlightText()
end)
-- end ModelPreview

-- TitleFrame
DMinstrelMorphFrame.TitleFrame = CreateFrame("Frame", nil, DMinstrelMorphFrame)
DMinstrelMorphFrame.TitleFrame:SetSize(DMinstrelMorphFrame:GetWidth(), 40)
DMinstrelMorphFrame.TitleFrame:SetPoint("TOP")
DMinstrelMorphFrame.TitleFrame.Background = DMinstrelMorphFrame.TitleFrame:CreateTexture(nil,"BACKGROUND")
DMinstrelMorphFrame.TitleFrame.Background:SetColorTexture(1,0,0,0)
DMinstrelMorphFrame.TitleFrame.Background:SetAllPoints(DMinstrelMorphFrame.TitleFrame)
DMinstrelMorphFrame.TitleFrame.FontString = DMinstrelMorphFrame.TitleFrame:CreateFontString(nil,nil,"GameFontNormal")
DMinstrelMorphFrame.TitleFrame.FontString:SetText("Taku Morph Catalog")
DMinstrelMorphFrame.TitleFrame.FontString:SetAllPoints(DMinstrelMorphFrame.TitleFrame)
DMinstrelMorphFrame.TitleFrame.CloseButton = CreateFrame("Button", nil, DMinstrelMorphFrame.TitleFrame, "UIPanelCloseButton")
DMinstrelMorphFrame.TitleFrame.CloseButton:SetPoint("RIGHT", -3, 0)
DMinstrelMorphFrame.TitleFrame.CloseButton:SetScript("OnClick", function(self, Button, Down)
	DMinstrelMorphFrame:Hide()
end)
DMinstrelMorphFrame.TitleFrame:SetScript("OnMouseDown", function(self, Button)
	DMinstrelMorphFrame:StartMoving()
end)
DMinstrelMorphFrame.TitleFrame:SetScript("OnMouseUp", function(self, Button)
	DMinstrelMorphFrame:StopMovingOrSizing()
end)
-- end TitleFrame

--[[local ResizeFrame = CreateFrame("Button", nil, DMinstrelMorphFrame)
ResizeFrame:SetSize(20,20)
ResizeFrame.Texture = ResizeFrame:CreateTexture(nil,"ARTWORK")
ResizeFrame.Texture:SetTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
ResizeFrame.Texture:SetAllPoints(ResizeFrame)
ResizeFrame:SetPoint("BOTTOMRIGHT", -10, 10)
ResizeFrame:SetScript("OnMouseDown", function(self, Button)
	DMinstrelMorphFrame:StartSizing("BOTTOMRIGHT")
end)
ResizeFrame:SetScript("OnMouseUp", function(self, Button)
	DMinstrelMorphFrame:StopMovingOrSizing()
end)--]]

--[[DMinstrelMorphFrame:SetScript("OnSizeChanged", function(self, Width, Height)
	WindowWidth = Width
	WindowHeight = Height
	DMinstrelMorphFrame.Gallery:Load()
	TitleFrame:SetSize(DMinstrelMorphFrame:GetWidth(), 40)
	TitleFrame:SetPoint("TOP")
	DMinstrelMorphFrame.PageController:SetSize(DMinstrelMorphFrame:GetWidth(), 75)
	DMinstrelMorphFrame.PageController:SetPoint("BOTTOM")
end)--]]

-- PageController
DMinstrelMorphFrame.PageController = CreateFrame("Frame", nil, DMinstrelMorphFrame)
DMinstrelMorphFrame.PageController:SetSize(DMinstrelMorphFrame:GetWidth(), 75)
DMinstrelMorphFrame.PageController:SetPoint("BOTTOM")
DMinstrelMorphFrame.PageController.FontString = DMinstrelMorphFrame.PageController:CreateFontString(nil,nil,"GameFontWhite")
DMinstrelMorphFrame.PageController.FontString:SetAllPoints(DMinstrelMorphFrame.PageController)

function DMinstrelMorphFrame.PageController:UpdateButtons()
	if (ModelID >= MaxModelID) then
		DMinstrelMorphFrame.NextPageButton:SetBackdrop( { 
		  bgFile = "Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled", 
		  insets = { left = 4, right = 4, top = 4, bottom = 4 }
		})
	else
		DMinstrelMorphFrame.NextPageButton:SetBackdrop( { 
		  bgFile = "Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up", 
		  insets = { left = 4, right = 4, top = 4, bottom = 4 }
		})
	end
	if (GoBackDepth == 0) then
		DMinstrelMorphFrame.PreviousPageButton:SetBackdrop( { 
		  bgFile = "Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled", 
		  insets = { left = 4, right = 4, top = 4, bottom = 4 }
		})
	else
		DMinstrelMorphFrame.PreviousPageButton:SetBackdrop( { 
		  bgFile = "Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up", 
		  insets = { left = 4, right = 4, top = 4, bottom = 4 }
		})
	end	
end

-- end PageController

-- NextPageButton
DMinstrelMorphFrame.NextPageButton = CreateFrame("Button", nil, DMinstrelMorphFrame.PageController)
--
DMinstrelMorphFrame.NextPageButton:SetSize(45, 45)
DMinstrelMorphFrame.NextPageButton:SetPoint("Center",100,0)
DMinstrelMorphFrame.NextPageButton:SetBackdrop( { 
  bgFile = "Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up", 
  insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
--
DMinstrelMorphFrame.NextPageButton.HoverGlow = DMinstrelMorphFrame.NextPageButton:CreateTexture(nil,"BACKGROUND")
DMinstrelMorphFrame.NextPageButton.HoverGlow:SetTexture("Interface\\Buttons\\CheckButtonGlow")
DMinstrelMorphFrame.NextPageButton.HoverGlow:SetAllPoints(DMinstrelMorphFrame.NextPageButton)
DMinstrelMorphFrame.NextPageButton.HoverGlow:SetAlpha(0)
--
DMinstrelMorphFrame.NextPageButton:SetScript("OnEnter", function()
	if (ModelID < MaxModelID) then
		DMinstrelMorphFrame.NextPageButton.HoverGlow:SetAlpha(1)
	end
end);
--
DMinstrelMorphFrame.NextPageButton:SetScript("OnLeave", function()
	DMinstrelMorphFrame.NextPageButton.HoverGlow:SetAlpha(0)
end);
--
DMinstrelMorphFrame.NextPageButton:SetScript("OnClick", function(self, Button, Down)
	if (ModelID >= MaxModelID) then
		return
	end
	OffsetModelID = ModelID
	--
	GoBackStack[GoBackDepth] = {LastMaxModelID=LastMaxModelID, Zoom=NumberOfColumn}
	GoBackDepth = GoBackDepth + 1
	--
	DMinstrelMorphFrame.Gallery:Load()
	--
end)
-- end NextPageButton

-- GoToEditBox
DMinstrelMorphFrame.GoToEditBox = CreateFrame('EditBox', nil, DMinstrelMorphFrame.PageController, "InputBoxTemplate")
--
DMinstrelMorphFrame.GoToEditBox.FontString = DMinstrelMorphFrame.GoToEditBox:CreateFontString(nil,nil,"GameFontWhite")
DMinstrelMorphFrame.GoToEditBox.FontString:SetPoint("LEFT", -50, 0)
DMinstrelMorphFrame.GoToEditBox.FontString:SetText("Go to :")
--
DMinstrelMorphFrame.GoToEditBox:SetPoint("LEFT", 150, 0)
DMinstrelMorphFrame.GoToEditBox:SetMultiLine(false)
DMinstrelMorphFrame.GoToEditBox:SetAutoFocus(false)
DMinstrelMorphFrame.GoToEditBox:EnableMouse(true)
DMinstrelMorphFrame.GoToEditBox:SetMaxLetters(5)
--[[DMinstrelMorphFrame.GoToEditBox:SetTextColor(0,0,0,1)--]]
DMinstrelMorphFrame.GoToEditBox:SetTextInsets(0,0,0,0)
DMinstrelMorphFrame.GoToEditBox:SetFont('Fonts\\ARIALN.ttf', 12, '')	
DMinstrelMorphFrame.GoToEditBox:SetWidth(70)
DMinstrelMorphFrame.GoToEditBox:SetHeight(20)
DMinstrelMorphFrame.GoToEditBox:SetScript('OnEscapePressed', function() DMinstrelMorphFrame.GoToEditBox:ClearFocus() end)
DMinstrelMorphFrame.GoToEditBox:SetScript('OnEnterPressed', function()
	DMinstrelMorphFrame.GoToEditBox:ClearFocus()
	--
	OffsetModelID = tonumber(DMinstrelMorphFrame.GoToEditBox:GetText())
	if OffsetModelID >= MaxModelID then
		OffsetModelID = MaxModelID
	end
	NumberOfColumn = MaxNumberOfColumn
	ModelID = OffsetModelID
	DMinstrelMorphFrame.Gallery:Load(true)
end)
-- end GoToEditBox

-- PreviousPageButton
DMinstrelMorphFrame.PreviousPageButton = CreateFrame("Button", nil, DMinstrelMorphFrame.PageController)
DMinstrelMorphFrame.PreviousPageButton:SetSize(45, 45)
DMinstrelMorphFrame.PreviousPageButton:SetPoint("Center",-100,0)
DMinstrelMorphFrame.PreviousPageButton:SetBackdrop( { 
  bgFile = "Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled", 
  insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
DMinstrelMorphFrame.PreviousPageButton.HoverGlow = DMinstrelMorphFrame.PreviousPageButton:CreateTexture(nil,"BACKGROUND")
DMinstrelMorphFrame.PreviousPageButton.HoverGlow:SetTexture("Interface\\Buttons\\CheckButtonGlow")
DMinstrelMorphFrame.PreviousPageButton.HoverGlow:SetAllPoints(DMinstrelMorphFrame.PreviousPageButton)
DMinstrelMorphFrame.PreviousPageButton.HoverGlow:SetAlpha(0)
DMinstrelMorphFrame.PreviousPageButton:SetScript("OnEnter", function()
	if (GoBackDepth > 0) then
		DMinstrelMorphFrame.PreviousPageButton.HoverGlow:SetAlpha(1)
	end
end);
DMinstrelMorphFrame.PreviousPageButton:SetScript("OnLeave", function()
	DMinstrelMorphFrame.PreviousPageButton.HoverGlow:SetAlpha(0)
end);
DMinstrelMorphFrame.PreviousPageButton:SetScript("OnClick", function(self, Button, Down)
	OffsetModelID = GoBackStack[GoBackDepth - 1].LastMaxModelID
	--
	ModelID = OffsetModelID
	NumberOfColumn = MaxNumberOfColumn
	DMinstrelMorphFrame.Gallery:Load(true)
	--
	ModelID = OffsetModelID
	NumberOfColumn = GoBackStack[GoBackDepth - 1].Zoom
	GoBackStack[GoBackDepth - 1] = nil
	GoBackDepth = GoBackDepth - 1
	DMinstrelMorphFrame.Gallery:Load()
	--
end)
-- end PreviousPageButton

-- Gallery
DMinstrelMorphFrame.Gallery = CreateFrame("Frame", nil, DMinstrelMorphFrame)
DMinstrelMorphFrame.Gallery:SetPoint("TOP", 0, -50)
DMinstrelMorphFrame.Gallery:SetScript("OnMouseWheel", function(self, delta)
	NewNumberOfColumn = NumberOfColumn
	if (delta < 0) then
		if (NumberOfColumn == MaxNumberOfColumn) then
			return
		end
		NewNumberOfColumn = NumberOfColumn * 2
		-- pop all inferior zoom from gobackstack
		Depth = GoBackDepth - 1
		while Depth > 0 and GoBackStack[Depth].Zoom < NumberOfColumn do
			GoBackStack[Depth] = nil
			Depth = Depth - 1
			GoBackDepth = GoBackDepth - 1
		end
	else
		if (NumberOfColumn == MinNumberOfColumn) then
			return 
		end
		NewNumberOfColumn = NumberOfColumn / 2
	end
	ModelID = OffsetModelID
	NumberOfColumn = NewNumberOfColumn
	DMinstrelMorphFrame.Gallery:Load()
end)

function DMinstrelMorphFrame.Gallery:Load(Reset)
	if DMinstrel.Debug then
		print("--- TakuMorphFrame.Gallery:Load ---")
		print("ModelID .. " .. ModelID)
		print("LastMaxModelID .. " .. LastMaxModelID)
		print("OffsetModelID .. " .. OffsetModelID)
	end
	DMinstrelMorphFrame.Gallery:SetSize(DMinstrelMorphFrame:GetWidth() - 50, DMinstrelMorphFrame:GetHeight() - 125)
	local ColumnWidth = DMinstrelMorphFrame.Gallery:GetWidth() / NumberOfColumn
	local MaxNumberOfRowsOnSinglePage = floor(DMinstrelMorphFrame.Gallery:GetHeight() / ColumnWidth)
	LastMaxModelID = ModelID
	ModelID = OffsetModelID
	local CellIndex = 0
	while CellIndex < NumberOfColumn * MaxNumberOfRowsOnSinglePage do
		OffsetX = CellIndex % NumberOfColumn 
		OffsetY = floor(CellIndex / NumberOfColumn)
		if (OffsetY == MaxNumberOfRowsOnSinglePage) then
			break
		end
		local bNewWidget = (Cells[CellIndex] == nil)
		if bNewWidget then
			Cells[CellIndex] = CreateFrame("Button", nil, DMinstrelMorphFrame.Gallery)
			Cells[CellIndex].Favorite=Cells[CellIndex]:CreateTexture(nil,"ARTWORK")
			Cells[CellIndex].Favorite:SetPoint("TOPLEFT",-5,0)
			Cells[CellIndex].Favorite:SetSize(20,20)
			Cells[CellIndex].Favorite:SetTexture("Interface\\Collections\\Collections")
			Cells[CellIndex].Favorite:SetTexCoord(0.18, 0.02, 0.18, 0.07, 0.23, 0.02, 0.23, 0.07)
			Cells[CellIndex]:SetFrameStrata("DIALOG")
			Cells[CellIndex].HighlightBackground = Cells[CellIndex]:CreateTexture(nil,"BACKGROUND")
			Cells[CellIndex].HighlightBackground:SetColorTexture(1,1,1,0.5)
			Cells[CellIndex].HighlightBackground:SetAllPoints(Cells[CellIndex])
			Cells[CellIndex]:SetHighlightTexture(Cells[CellIndex].HighlightBackground)
			Cells[CellIndex]:RegisterForClicks("AnyUp")
			Cells[CellIndex].ModelFrame = CreateFrame("PlayerModel", nil, Cells[CellIndex])
			Cells[CellIndex]:SetScript("OnClick", function(self, Button, Down)
				DMinstrelMorphFrame.ModelPreview.ModelFrame:SetDisplayInfo(self.ModelFrame.DisplayInfo)
				DMinstrelMorphFrame.ModelPreview.ModelFrame.DisplayInfo = self.ModelFrame.DisplayInfo
				DMinstrelMorphFrame.ModelPreview.FontString:SetText(DMinstrelMorphFrame.ModelPreview.ModelFrame.DisplayInfo)
				if DMinstrelFavMorphs.FavoriteList[DMinstrelMorphFrame.ModelPreview.ModelFrame.DisplayInfo] then
					DMinstrelMorphFrame.ModelPreview.Favorite:Show()
					DMinstrelMorphFrame.ModelPreview.AddToFavorite:Hide()
					DMinstrelMorphFrame.ModelPreview.RemoveFavorite:Show()
				else
					DMinstrelMorphFrame.ModelPreview.Favorite:Hide()
					DMinstrelMorphFrame.ModelPreview.AddToFavorite:Show()
					DMinstrelMorphFrame.ModelPreview.RemoveFavorite:Hide()
				end
				DMinstrelMorphFrame.ModelPreview:Show()
			end)
		end
		-- always do
		Cells[CellIndex]:Show()
		if bNewWidget or Cells[CellIndex].ModelFrame.DisplayInfo < ModelID or Reset then
			Cells[CellIndex].ModelFrame:SetDisplayInfo(2418)
			BlankModelFileID = Cells[CellIndex].ModelFrame:GetModelFileID()
			if (DisplayFavorites) then
				while ModelID <= MaxModelID do
					if (DMinstrelFavMorphs.FavoriteList[ModelID]) then
						Cells[CellIndex].ModelFrame:SetDisplayInfo(ModelID)
						ModelID = ModelID + 1
						break
					end
					ModelID = ModelID + 1
				end
			else
				while ModelID <= MaxModelID do
					Cells[CellIndex].ModelFrame:SetDisplayInfo(ModelID)
					ModelID = ModelID + 1
					if Cells[CellIndex].ModelFrame:GetModelFileID() ~= nil and Cells[CellIndex].ModelFrame:GetModelFileID() ~= BlankModelFileID then
						break
					end
				end
			end
			Cells[CellIndex].ModelFrame.DisplayInfo = ModelID - 1
		else
			ModelID = Cells[CellIndex].ModelFrame.DisplayInfo + 1
		end
		if (Cells[CellIndex].ModelFrame.DisplayInfo == MaxModelID) then
			Cells[CellIndex]:Hide()
		end
		Cells[CellIndex]:SetWidth(ColumnWidth)
		Cells[CellIndex]:SetHeight(ColumnWidth)
		Cells[CellIndex]:SetPoint("TOPLEFT",OffsetX * ColumnWidth,OffsetY * -ColumnWidth)
		if (DMinstrelFavMorphs.FavoriteList[Cells[CellIndex].ModelFrame.DisplayInfo]) then
			Cells[CellIndex].Favorite:Show()
		else
			Cells[CellIndex].Favorite:Hide()
		end
		Cells[CellIndex].ModelFrame:SetAllPoints()
		CellIndex = CellIndex + 1
	end --while
	while Cells[CellIndex] ~= nil do
		Cells[CellIndex]:Hide()
		CellIndex = CellIndex + 1
	end
	--
	DMinstrelMorphFrame.PageController.FontString:SetText(LastMaxModelID .. " - " .. ModelID - 1)
	DMinstrelMorphFrame.PageController:UpdateButtons()
end
-- end Gallery

if DMinstrel.Debug then
	print("ModelFrames OK")
end

function DMinstrel:ProcessDMinstrelMorph()
	if DMinstrelMorphFrame:IsShown() then
		DMinstrelMorphFrame:Hide()
	else
		DMinstrelMorphFrame:Show()
	end
end

-- slash commands
SLASH_DMinstrelMORPHCATALOG1 = '/darkmoonmorph'
function SlashCmdList.DMinstrelMORPHCATALOG()
	DMinstrelMorphFrame:Show()
	ModelID=LastMaxModelID
	DMinstrelMorphFrame.Gallery:Load()
end