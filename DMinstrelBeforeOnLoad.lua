DMinstrel = LibStub("AceAddon-3.0"):NewAddon(CreateFrame("Frame"), "DMinstrel", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0", "AceTimer-3.0");
DMinstrel.Version = GetAddOnMetadata("DMinstrel", "version");

DMinstrel.NPCSayChannels = {
	{"Речь", "say"},
	{"Крик", "yell"},
	{"Эмоция", "textemote"},
};

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