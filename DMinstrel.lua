--[[
───────────▒▒▒▒▒▒▒▒
─────────▒▒▒──────▒▒▒
────────▒▒───▒▒▒▒──▒░▒
───────▒▒───▒▒──▒▒──▒░▒
──────▒▒░▒──────▒▒──▒░▒
───────▒▒░▒────▒▒──▒░▒
─────────▒▒▒▒▒▒▒───▒▒
─────────────────▒▒▒
─────▒▒▒▒────────▒▒
───▒▒▒░░▒▒▒─────▒▒──▓▓▓▓▓▓▓▓
──▒▒─────▒▒▒────▒▒▓▓▓▓▓░░░░░▓▓──▓▓▓▓
─▒───▒▒────▒▒─▓▓▒░░░░░░░░░█▓▒▓▓▓▓░░▓▓▓
▒▒──▒─▒▒───▓▒▒░░▒░░░░░████▓▓▒▒▓░░░░░░▓▓
░▒▒───▒──▓▓▓░▒░░░░░░█████▓▓▒▒▒▒▓▓▓▓▓░░▓▓
──▒▒▒▒──▓▓░░░░░░███████▓▓▓▒▒▒▒▒▓───▓▓░▓▓
──────▓▓░░░░░░███████▓▓▓▒▒▒▒▒▒▒▓───▓░░▓▓
─────▓▓░░░░░███████▓▓▓▒▒▒▒▒▒▒▒▒▓▓▓▓░░▓▓
────▓▓░░░░██████▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▓░░░░▓▓
────▓▓▓░████▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓
─────▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓
─────▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓
──────▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓
───────▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓
─────────▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓
───────────▓▓▓▓▓▓▒▒▒▒▒▓▓▓▓
───────────────▓▓▓▓▓▓▓▓
-- Made by TestUnit
--]]
DMinstrel = LibStub("AceAddon-3.0"):NewAddon(CreateFrame("Frame"), "DMinstrel", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0");
DMinstrel.Prefix = "DRPS";
DMinstrel.Linkifier = DMinstrel;
C_ChatInfo.RegisterAddonMessagePrefix(DMinstrel.Prefix)
DMinstrel.Commands = {};
DMinstrel.Commands[1] = {"Невидимость", ".m m 11686"};
DMinstrel.Commands[2] = {"ДеМорф", ".min demorph"};
DMinstrel.Commands[3] = {"Вселиться", ".min posses"};
DMinstrel.Commands[4] = {"Выселиться", ".min unposses"};
DMinstrel.Commands[5] = {"Что-то ещё 1", ""};
DMinstrel.Commands[6] = {"Что-то ещё 2", ""};
DMinstrel.Commands[7] = {"Что-то ещё 3", ""};
DMinstrel.Commands[8] = {"Что-то ещё 4", ""};
DMinstrel.Commands[9] = {"Что-то ещё 5", ""};
DMinstrel.Commands[10] = {"Что-то ещё 6", ""};
DMinstrel.Commands[11] = {"Что-то ещё 7", ""};
DMinstrel.Commands[12] = {"Что-то ещё 8", ""};
DMinstrel.Commands[13] = {"Что-то ещё 9", ""};
DMinstrel.Commands[14] = {"Что-то ещё 10", ""};
DMinstrel.Commands[15] = {"Что-то ещё 11", ""};
DMinstrel.Commands[16] = {"Что-то ещё 12", ""};
DMinstrel.Commands[17] = {"Что-то ещё 13", ""};
DMinstrel.Commands[18] = {"Что-то ещё 14", ""};
DMinstrel.Commands[19] = {"Что-то ещё 15", ""};
DMinstrel.Commands[20] = {"Что-то ещё 16", ""};
DMinstrel.Commands[21] = {"Что-то ещё 17", ""};
DMinstrel.Commands[22] = {"Что-то ещё 18", ""};
DMinstrel.Commands[23] = {"Что-то ещё 19", ""};
DMinstrel.Commands[24] = {"Убрать всё", ".min reset all"};

DMinstrel.NPC = {};
DMinstrel.NPC[1] = {"К ноге", ".min npc come"};
DMinstrel.NPC[2] = {"Остановить", ".min npc set emote 0"};
DMinstrel.NPC[3] = {"Бить", ".min npc set emote 36"};
DMinstrel.NPC[4] = {"Умереть", ".min npc set emote 592"};
DMinstrel.NPC[5] = {"Оглушение", ".min npc set emote 64"};
DMinstrel.NPC[6] = {"Красться", ".min npc set emote 433"};
DMinstrel.NPC[7] = {"К бою", ".min npc set emote 45"};
DMinstrel.NPC[8] = {"Сдаться", ".min npc set emote 431"};
DMinstrel.NPC[9] = {"Сидеть", ".min npc set emote 882"};
DMinstrel.NPC[10] = {"Связать", ".min npc set emote 730"};
DMinstrel.NPC[11] = {"Кастовать", ".min npc set emote 474"};
DMinstrel.NPC[12] = {"Прицелиться", ".min npc set emote 754"};
DMinstrel.NPC[13] = {"Убрать всё", ".min reset creature"};
DMinstrel.NPC[14] = {"Что-то ещё 2", ""};
DMinstrel.NPC[15] = {"Что-то ещё 3", ""};
DMinstrel.NPC[16] = {"Что-то ещё 4", ""};
DMinstrel.NPC[17] = {"Что-то ещё 5", ""};
DMinstrel.NPC[18] = {"Что-то ещё 6", ""};
DMinstrel.NPC[19] = {"Что-то ещё 7", ""};
DMinstrel.NPC[20] = {"Что-то ещё 8", ""};
DMinstrel.NPC[21] = {"Что-то ещё 9", ""};
DMinstrel.NPC[22] = {"Что-то ещё 10", ""};
DMinstrel.NPC[23] = {"Информацуия о...", ".min npc info"};
DMinstrel.NPC[24] = {"Убрать", ".min npc del"};

DMinstrel.GObject = {};
DMinstrel.GObject[1] = {"Огонь", ".min gob add 723227"};
DMinstrel.GObject[2] = {"Кровь", ".min gob add 735194"};
DMinstrel.GObject[3] = {"Убрать всё", ".min reset object"};
DMinstrel.GObject[4] = {"Что-то ещё 0", ""};
DMinstrel.GObject[5] = {"Таргет", ".min gob tar"};
DMinstrel.GObject[6] = {"Что-то ещё 2", ""};
DMinstrel.GObject[7] = {"Что-то ещё 3", ""};
DMinstrel.GObject[8] = {"Что-то ещё 4", ""};
DMinstrel.GObject[9] = {"Что-то ещё 5", ""};
DMinstrel.GObject[10] = {"Что-то ещё 6", ""};
DMinstrel.GObject[11] = {"Что-то ещё 7", ""};
DMinstrel.GObject[12] = {"Что-то ещё 8", ""};
DMinstrel.GObject[13] = {"Что-то ещё 9", ""};
DMinstrel.GObject[14] = {"Что-то ещё 10", ""};
DMinstrel.GObject[15] = {"Что-то ещё 11", ""};
DMinstrel.GObject[16] = {"Что-то ещё 12", ""};
DMinstrel.GObject[17] = {"Что-то ещё 13", ""};
DMinstrel.GObject[18] = {"Что-то ещё 14", ""};
DMinstrel.GObject[19] = {"Что-то ещё 15", ""};
DMinstrel.GObject[20] = {"Что-то ещё 16", ""};
DMinstrel.GObject[21] = {"Что-то ещё 17", ""};
DMinstrel.GObject[22] = {"Что-то ещё 18", ""};
DMinstrel.GObject[23] = {"Что-то ещё 19", ""};
DMinstrel.GObject[24] = {"Что-то ещё 20", ""};

DMinstrel.Macros = {};
DMinstrel.Macros[1] = "1";
DMinstrel.Macros[2] = "2";
DMinstrel.Macros[3] = "3";
DMinstrel.Macros[4] = "4";
DMinstrel.Macros[5] = "5";
DMinstrel.Macros[6] = "6";
DMinstrel.Macros[7] = "7";
DMinstrel.Macros[8] = "8";

--- TRP3 Code
local resizeFrame = DMinstrelResizeFrame;

function DMinstrel:InitResize(resizeButton)
	resizeButton.resizableFrame = resizeButton.resizableFrame or resizeButton:GetParent();
	assert(resizeButton.minWidth, "minWidth key is not set.");
	assert(resizeButton.minHeight, "minHeight key is not set.");
	local parentFrame = resizeButton.resizableFrame;
	resizeButton:RegisterForDrag("LeftButton");
	resizeButton:SetScript("OnDragStart", function(self)
		if not self.onResizeStart or not self.onResizeStart() then
			resizeFrame.minWidth = self.minWidth;
			resizeFrame.minHeight = self.minHeight;
			resizeFrame:ClearAllPoints();
			resizeFrame:SetPoint("CENTER", self.resizableFrame, "CENTER", 0, 0);
			resizeFrame:SetWidth(parentFrame:GetWidth());
			resizeFrame:SetHeight(parentFrame:GetHeight());
			resizeFrame:Show();
			resizeFrame:StartSizing();
			parentFrame.isSizing = true;
		end
	end);
	resizeButton:SetScript("OnDragStop", function(self)
		if parentFrame.isSizing then
			resizeFrame:StopMovingOrSizing();
			parentFrame.isSizing = false;
			local height, width = resizeFrame:GetHeight(), resizeFrame:GetWidth()
			resizeFrame:Hide();
			if height < self.minHeight then
				height = self.minHeight;
			end
			if width < self.minWidth then
				width = self.minWidth;
			end
			parentFrame:SetSize(width, height);
			_G["DMinstrelUIContentCommandsSlider1Child"]:SetSize(width-40, height);
			_G["DMinstrelUIContentNPCSlider1Child"]:SetSize(width-40, height);
			_G["DMinstrelUIContentGObjectSlider1Child"]:SetSize(width-40, height);
			if self.onResizeStop then
				C_Timer.After(0.1, function()
					self.onResizeStop(width, height);
				end);
			end
		end
	end);
end

function DMinstrel:ChangeContent(window)
	DMinstrelUIContentCommands:Hide();
	DMinstrelUIContentNPC:Hide();
	DMinstrelUIContentGObject:Hide();

	DMinstrelUIBottom.Commands:UnlockHighlight();
	DMinstrelUIBottom.GObject:UnlockHighlight();
	DMinstrelUIBottom.NPC:UnlockHighlight();
	if window == "Models" then
		print(window);
	elseif window == "Commands" then
		DMinstrelUIBottom.Commands:LockHighlight();
		DMinstrelUIContentCommands:Show();
	elseif window == "NPC" then
		DMinstrelUIBottom.NPC:LockHighlight();
		DMinstrelUIContentNPC:Show();
	elseif window == "GObject" then
		DMinstrelUIBottom.GObject:LockHighlight();
		DMinstrelUIContentGObject:Show();
	end
end

function DMinstrel:SendMinstrelMessage(msg)
	C_ChatInfo.SendAddonMessage(DMinstrel.Prefix, msg, "WHISPER", UnitName("player"));
end

print("DMinstrel loaded!");