if(IsAddOnLoaded("DMA"))then
	message("Аддоны DMA и DMinstrel не могут работать вместе. DMinstrel будет отключён.");
	DisableAddOn("DMinstrel");
end

DMinstrel = LibStub("AceAddon-3.0"):NewAddon(CreateFrame("Frame"), "DMinstrel", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0", "AceTimer-3.0");
DMinstrel.DataProvider = {}
DMinstrel.DataProvider.Icons = {}
DMinstrel.DataProvider.Icons.StylizingFrameTex = nil
DMinstrel.DataProvider.Icons.Browser = LibStub("LibAdvancedIconSelector-1.0");
DMinstrel.Version = GetAddOnMetadata("DMinstrel", "version");
DMinstrel.Models = {}
DMinstrel.Models.ToShow = {}

DMinstrel.NPCSayChannels = {
	{"Речь", "say"},
	{"Крик", "yell"},
	{"Эмоция", "textemote"},
};

local options = {
	enableResize = false;
	enableMove = true;
	noHeader = false;
  }

DMinstrel.DataProvider.Icons.Frame = DMinstrel.DataProvider.Icons.Browser:CreateIconSelectorWindow("IconBrowserFrame",UIParent,options);
DMinstrel.DataProvider.Icons.IconSelector = IconBrowserFrame_IconsFrame;
DMinstrel.DataProvider.Icons.Frame:SetPoint("CENTER")
DMinstrel.DataProvider.Icons.Frame:SetScript("OnOkayClicked", function(self)
	--Num, Name, TexID
	local _, _, iconTex = DMinstrel.DataProvider.Icons.IconSelector:GetIconInfo(DMinstrel.DataProvider.Icons.IconSelector:GetSelectedIcon());
	--SetPortraitToTexture(DMinstrel.DataProvider.Icons.StylizingFrameTex, iconTex);
	DMinstrel.DataProvider.Icons.StylizingFrameTex.IconID = iconTex;
	DMinstrel.DataProvider.Icons.StylizingFrameTex:SetNormalTexture(DMinstrel.DataProvider.Icons.StylizingFrameTex.IconID);
	DMinstrel.DataProvider.Icons.StylizingFrameTex:SetHighlightTexture(DMinstrel.DataProvider.Icons.StylizingFrameTex.IconID);
	self:Hide();
end)

function DMinstrel:CreateNPCSayDropDown(dropDown)
	UIDropDownMenu_SetWidth(dropDown, 100);
	UIDropDownMenu_SetSelectedID(dropDown, 1);
	DMinstrel_NPCSayPlanel.selectedChannel = 1;
	UIDropDownMenu_SetText(dropDown, "Канал: Речь");
	UIDropDownMenu_Initialize(dropDown, function (self)
		local info = UIDropDownMenu_CreateInfo();
		for i, v in ipairs(DMinstrel.NPCSayChannels) do
			info.text = v[1];
			info.checked = UIDropDownMenu_GetSelectedID(dropDown) == i;
			info.func = function ()
				UIDropDownMenu_RefreshAll(dropDown, false);
				UIDropDownMenu_SetSelectedName(dropDown, v[1], false);
				UIDropDownMenu_SetText(dropDown, "Канал: "..v[1]);
				DMinstrel_NPCSayPlanel.selectedChannel = UIDropDownMenu_GetSelectedID(dropDown);
				CloseDropDownMenus();
			end
			UIDropDownMenu_AddButton(info);
		end
	end);
end