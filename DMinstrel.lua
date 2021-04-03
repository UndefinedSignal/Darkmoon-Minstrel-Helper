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
DMinstrel = LibStub("AceAddon-3.0"):NewAddon(CreateFrame("Frame"), "DMinstrel");
DMinstrel.Prefix = "DRPS";
C_ChatInfo.RegisterAddonMessagePrefix(DMinstrel.Prefix)
DMinstrel.Commands = {};
DMinstrel.Commands[1] = ".min gob add 723227";
DMinstrel.Commands[2] = ".min gob add 735194";
DMinstrel.Commands[3] = ".min posses";
DMinstrel.Commands[4] = ".min unposses";
DMinstrel.Commands[5] = ".min npc come";
DMinstrel.Commands[6] = ".min npc set emote 0";
DMinstrel.Commands[7] = ".min npc set emote 36";
DMinstrel.Commands[8] = ".min npc set emote 592";
DMinstrel.Commands[9] = ".min npc set emote 64";
DMinstrel.Commands[10] = ".min npc set emote 433";
DMinstrel.Commands[11] = ".min npc set emote 45";
DMinstrel.Commands[12] = ".min npc set emote 431";
DMinstrel.Commands[13] = ".min npc set emote 882";
DMinstrel.Commands[14] = ".min npc set emote 730";
DMinstrel.Commands[15] = ".min npc set emote 474";
DMinstrel.Commands[16] = ".min npc set emote 754";
DMinstrel.Commands[17] = "";
DMinstrel.Commands[18] = "";
DMinstrel.Commands[19] = "";
DMinstrel.Commands[20] = "";
DMinstrel.Commands[21] = "";
DMinstrel.Commands[22] = "";
DMinstrel.Commands[23] = "";
DMinstrel.Commands[24] = "";

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
			_G["DMinstrelUIContentConSlider1Child"]:SetSize(width-40, height);
			if self.onResizeStop then
				C_Timer.After(0.1, function()
					self.onResizeStop(width, height);
				end);
			end
		end
	end);
end

function DMinstrel:SendMinstrelMessage(msg)
	C_ChatInfo.SendAddonMessage(DMinstrel.Prefix, msg, "WHISPER", UnitName("player"));
end

print("DMinstrel loaded!");