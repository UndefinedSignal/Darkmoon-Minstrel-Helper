--[[
 _________________________
< TestUnit Minstrel Addon >
 -------------------------
       \
        \
                  =/;;/-
                 +:    //
                /;      /;
               -X        H.
 .//;;;:;;-,   X=        :+   .-;:=;:;%;.
 M-       ,=;;;#:,      ,:#;;:=,       ,@
 :%           :%.=/++++/=.$=           %=
  ,%;         %/:+/;,,/++:+/         ;+.
    ,+/.    ,;@+,        ,%H;,    ,/+,
       ;+;;/= @.  .H##X   -X :///+;
       ;+=;;;.@,  .XM@$.  =X.//;=%/.
    ,;:      :@%=        =$H:     .+%-
  ,%=         %;-///==///-//         =%,
 ;+           :%-;;;:;;;;-X-           +:
 @-      .-;;;;M-        =M/;;;-.      -X
  :;;::;;-.    %-        :+    ,-;;-;:==
               ,X        H.
                ;/      %=
                 //    +;
                  ,////,
--]]
DMinstrel.Prefix = "DRPS";
DMinstrel.Linkifier = DMinstrel;
DMinstrel.User = {};
DMinstrel.Debug = false;
DMinstrel.ChatMaxLetters = 255;
DMinstrel.MyLevel = 0;
DMinstrel.MinstrelText = "";
DMinstrel.Timers = {};
DMinstrel.ReEnableFrame = nil;
DMinstrel.dataProvider = {}
DMinstrel.dataProvider.selectedIconID = 0;

DMinstrel.GOBInfo = { ["LastGuid"] = "",
						["Orientation"] = "",
						["LastX"] = "",
						["LastY"] = "",
						["LastZ"] = "",
						["StartX"] = "",
						["StartY"] = "",
						["StartZ"] = ""}

C_ChatInfo.RegisterAddonMessagePrefix(DMinstrel.Prefix)
DMinstrel.Commands = {};
DMinstrel.Commands[1] = {"Подойди", ".min npc come"};
DMinstrel.Commands[2] = {"Снять морф", ".min demorph"};
DMinstrel.Commands[3] = {"Вселиться", ".min posses"};
DMinstrel.Commands[4] = {"Выселиться", ".min unposses"};
DMinstrel.Commands[5] = {"Проиграть звук", "В открывшимся окне можно будет задать ID звука для проигрывания."};
DMinstrel.Commands[6] = {"Убрать все объекты", ".min reset object"};
DMinstrel.Commands[7] = {"Длинная фраза НИП", "Открывается новое окно, предназначенное для удобного взаимодействия с репликами НИП."};
DMinstrel.Commands[8] = {"Убрать всё", ".min reset all"};
DMinstrel.Commands[9] = {"Применить ауру", "Открывается новое окно, предназначенное для применение ауры на НИП"};
DMinstrel.Commands[10] = {"Убрать всех НИП", ".min reset creature"};
DMinstrel.Commands[11] = {"Отменить эмоцию НИП", ".min npc set emote 0"};
DMinstrel.Commands[12] = {"Полёт", ".minstrel fly"};
DMinstrel.Commands[13] = {"Инфо объект", ".min gob tar"};
DMinstrel.Commands[14] = {"Инфо НИП", ".min npc info"};
DMinstrel.Commands[15] = {"Выделить и удалить", "Выделяет объект и удаляет его"};
DMinstrel.Commands[16] = {"Управление Объектом", "Открывает окно для передвижения и вращения объекта"};

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
DMinstrel.NPC[10] = {"Связать (люди)", ".min npc set emote 730"};
DMinstrel.NPC[11] = {"Кастовать", ".min npc set emote 474"};
DMinstrel.NPC[12] = {"Прицелиться", ".min npc set emote 754"};
DMinstrel.NPC[13] = {"Информация о НИП", ".min npc info"};
DMinstrel.NPC[14] = {"Атака без оружия", ".min npc set emote 551"};
DMinstrel.NPC[15] = {"Целиться из лука", ".min npc set emote 384"};
DMinstrel.NPC[16] = {"Целиться из арбалета", ".min npc set emote 754"};
DMinstrel.NPC[17] = {"Стойка с ружьём", ".min npc set emote 214"};
DMinstrel.NPC[18] = {"Атака монаха", ".min npc set emote 507"};
DMinstrel.NPC[19] = {"Говорить", ".min npc set emote 1"};
DMinstrel.NPC[20] = {"Читать свиток", ".min npc set emote 483"};
DMinstrel.NPC[21] = {"Использовать", ".min npc set emote 69"};
DMinstrel.NPC[22] = {"Рубить", ".min npc set emote 173"};
DMinstrel.NPC[23] = {"Убрать всех НИП", ".min reset creature"};
DMinstrel.NPC[24] = {"Убрать НИП'а", ".min npc del"};

if (DMinstrelGOBSave == nil or #DMinstrelGOBSave <= 0) then
	DMinstrelGOBSave = {};
	DMinstrelGOBSave[1] = {"Огонь", ".min gob add 726147", "132839"};
	DMinstrelGOBSave[2] = {"Кровь", ".min gob add 739410", "136168"};
	DMinstrelGOBSave[3] = {"Красная руна", ".min gob add 724851", "252270"};
	DMinstrelGOBSave[4] = {"Синяя руна", ".min gob add 713694", "4005152"};
	DMinstrelGOBSave[5] = {"Таргет", ".min gob tar", "236188"};
	DMinstrelGOBSave[6] = {"Ящик", ".min gob add 741496", "132764"};
	DMinstrelGOBSave[7] = {"Красный кристалл", ".min gob add 709940", "132787"};
	DMinstrelGOBSave[8] = {"Деревяная ограда", ".min gob add 718467", "3192685"};
	DMinstrelGOBSave[9] = {"Капкан", ".min gob add 714992", "3192685"};
	DMinstrelGOBSave[10] = {"Мусор", ".min gob add 718634", "3192685"};
	DMinstrelGOBSave[11] = {"Обычный стол", ".min gob add 728267", "3192685"};
	DMinstrelGOBSave[12] = {"Стог сена", ".min gob add 726959", "3192685"};
	DMinstrelGOBSave[13] = {"Кусты", ".min gob add 708487", "3192685"};
	DMinstrelGOBSave[14] = {"Удобное кресло", ".min gob add 738477", "3192685"};
	DMinstrelGOBSave[15] = {"Простой табурет", ".min gob add 728933", "3192685"};
	DMinstrelGOBSave[16] = {"Горшок зелени", ".min gob add 730574", "3192685"};
	DMinstrelGOBSave[17] = {"Сеть", ".min gob add 739159", "3192685"};
	DMinstrelGOBSave[18] = {"Бревно-скамья", ".min gob add 712354", "3192685"};
	DMinstrelGOBSave[19] = {"Костёр", ".min gob add 739396", "3192685"};
	DMinstrelGOBSave[20] = {"Палатка", ".min gob add 711377", "3192685"};
	DMinstrelGOBSave[21] = {"Спальный мешок", ".min gob add 723887", "3192685"};
	DMinstrelGOBSave[22] = {"Удобный диван", ".min gob add 738311", "3192685"};
	DMinstrelGOBSave[23] = {"Туман", ".min gob add 720522", "132331"};
	DMinstrelGOBSave[24] = {"Удалить все свои объекты", ".min reset object", "3565717"};
	DMinstrelGOBSave[25] = {"Пустой макрос", "Измени меня", "1029723"};
	DMinstrelGOBSave[26] = {"Пустой макрос", "Измени меня", "1029723"};
	DMinstrelGOBSave[27] = {"Пустой макрос", "Измени меня", "1029723"};
	DMinstrelGOBSave[28] = {"Пустой макрос", "Измени меня", "1029723"};
	DMinstrelGOBSave[29] = {"Пустой макрос", "Измени меня", "1029723"};
	DMinstrelGOBSave[30] = {"Пустой макрос", "Измени меня", "1029723"};
	DMinstrelGOBSave[31] = {"Пустой макрос", "Измени меня", "1029723"};
	DMinstrelGOBSave[32] = {"Пустой макрос", "Измени меня", "1029723"};
	DMinstrelGOBSave[33] = {"Пустой макрос", "Измени меня", "1029723"};
	DMinstrelGOBSave[34] = {"Пустой макрос", "Измени меня", "1029723"};
end

function DMinstrel:DMinstrelGOBFix()
	local fixnum = { "132839", "136168", "252270", "4005152", "236188", "132764", "132787", "3192685", "3192685", "3192685", "3192685", "3192685", "3192685", "3192685", "3192685", "3192685", "3192685", "3192685", "3192685", "3192685", "3192685", "3192685", "132331", "3565717"}
	if(#DMinstrelGOBSave[1] == 2) then
		for i = 1, #DMinstrelGOBSave do
			DMinstrelGOBSave[i][3] = fixnum[i] or "1778229";
		end
	end
	if(#DMinstrelGOBSave < 34)then
		for i = 25, 34 do
			DMinstrelGOBSave[i] = {"Пустой макрос", "Измени меня", "1029723"};
		end
	end
end

if (DMinstrelSave == nil or #DMinstrelSave <= 0) then
	DMinstrelSave = {}
	DMinstrelSave[1] = {".minstrel npc say — Я слежу за тобой!", ""};
	DMinstrelSave[2] = {".minstrel morph 5369", ""};
	DMinstrelSave[3] = {".minstrel demorph", ""};
	DMinstrelSave[4] = {".minstre gobject target", ""};
	DMinstrelSave[5] = {".minstrel unpossess", ""};
	DMinstrelSave[6] = {".minstrel possess", ""};
	DMinstrelSave[7] = {".minstrel set emote 592", ""};
	DMinstrelSave[8] = {".minstrel npc come", ""};
end

DMinstrel.ActiveMacros = 0;
DMinstrel.ActiveObjectButton = 0;

--- TRP3 Code
local _DMinstrelResizeFrame = DMinstrelResizeFrame;

function DMinstrel:OnInitialize()
	DMinstrel:SendMinstrelMessage(".minstrel status");
end

function DMinstrel:InitializeHooks()
	if (RPSEmoteFramework) then
		DMinstrel:SecureHook(RPSEmoteFramework, "RPSEmoteOnClick", "HookRPSEmotesOnClick");
	end
end

function DMinstrel:ProcessIconBrowser(icon)
	DMA_MacrosEditorFrame.dataProvider.selectedIconID = tonumber(DMA_MacrosEditorFrame.currentMacros.iconID) or 0;
	RPSCoreFramework:ShowIconBrowser(icon, DMA.MacrosChangeIconCallback, {RPSCoreFramework.IconsMode.ICON_MODE, RPSCoreFramework.IconsMode.INSTANCE_MODE}, DMA_MacrosEditorFrame.dataProvider);
end

function DMinstrel:ShowIconSelector(frame)
	DMinstrel.DataProvider.Icons.StylizingFrameTex = frame;
	DMinstrel.DataProvider.Icons.Frame:Show();
end

function DMinstrel:BigButtonGameTooltipTextUpdate()
	if (DMinstrel.MyLevel > 1) then
		DMinstrel.MinstrelText = "Привет! Тебе доступен полный функционал менестреля.|nЕсли у тебя есть какие-то проблемы или вопросы то|nсмело заходи на дискорд-сервер проекта Darkmoon и пиши о них.";
	elseif(DMinstrel.MyLevel > 0) then
		DMinstrel.MinstrelText = "Привет! Тебе доступен функционал менестреля.|nК сожалению твой уровень менестреля не позволяет пользоваться|nвсем функционалом и поэтому некоторые кнопки будут отключены.|nЕсли у тебя есть какие-то проблемы или вопросы то смело заходи|nна дискорд-сервер проекта Darkmoon и пиши о них.";
	else
		DMinstrel.MinstrelText = "У тебя отсутствует функционал менестреля.|nНажми сюда чтобы обновить свой статус и если ничего не |nизменится то обратись в Discord проекта Darkmoon за помощью.";
	end
	DMinstrelUIInfo.txt:SetText("Менестрель "..DMinstrel.MyLevel.."-го уровня");
end

function DMinstrel:ClickAtBIGButton()
	DMinstrel:SendMinstrelMessage(".minstrel status");
end

DMinstrel.HOOK = CreateFrame("FRAME");
DMinstrel.HOOK:RegisterEvent("CHAT_MSG_ADDON");
DMinstrel.HOOK:RegisterEvent("ADDON_LOADED");
DMinstrel.HOOK:SetScript("OnEvent", function(self, event, prefix, msg, channel, sender)
	if(event == "ADDON_LOADED") then
		if(prefix == "RPSEmotes") then
			DMinstrel:InitializeHooks();
		elseif(prefix == "DMinstrel") then
			DMinstrel:AddMinimapIcon();
			DMinstrel:DMinstrelGOBFix();
		elseif(prefix == "DMA") then
			message("Аддоны DMA и DMinstrel не могут работать вместе. DMinstrel будет отключён.");
			DisableAddOn("DMinstrel");
		end
	elseif(event == "CHAT_MSG_ADDON") then
		if (sender == (GetUnitName("player").."-"..string.gsub(GetRealmName(), " ", ""))) then
			if (prefix == "RPS.Minstrel") then
				DMinstrel.MyLevel = tonumber(msg);
				DMinstrel:BigButtonGameTooltipTextUpdate();
			end
		end
	end
end)

function DMinstrel:HookRPSEmotesOnClick(frame, emote)
	if(IsModifierKeyDown()) then
		DMinstrel:SendMinstrelMessage(".minstrel npc playemote "..frame.DB[emote][2]);
	end
end

function DMinstrel:switchMainFrame()
	if DMinstrelUI:IsVisible() then
		DMinstrelUI:Hide();
	else
		DMinstrelUI:Show();
	end
end

function DMinstrel:switchGOBMoveFrame()
	if DMinstrelGOB:IsVisible() then
		DMinstrelGOB:Hide();
	else
		DMinstrelGOB:Show();
	end
end

function DMinstrel:switchNPCSayFrame()
	if DMinstrel_NPCSayPlanel:IsVisible() then
		DMinstrel_NPCSayPlanel:Hide();
	else
		DMinstrel_NPCSayPlanel:Show();
	end
end

function DMinstrel:switchApplyAuraFrame()
	if DMinstrel_AuraPlanel:IsVisible() then
		DMinstrel_AuraPlanel:Hide();
	else
		DMinstrel_AuraPlanel:Show();
	end
end

function DMinstrel:MacrosWindow()
	if DMinstrelMacrosEdit:IsShown() then
		DMinstrelMacrosEdit:Hide();
		return false
	end
	DMinstrelMacrosEdit:Show();
	return true;
end

function DMinstrel:ObjectWindow()
	if DMinstrelObjectEdit:IsShown() then
		DMinstrelObjectEdit:Hide();
		return false
	end
	DMinstrelObjectEdit:Show();
	return true;
end

function DMinstrel:InitResize(resizeButton)
	resizeButton.resizableFrame = resizeButton.resizableFrame or resizeButton:GetParent();
	assert(resizeButton.minWidth, "minWidth key is not set.");
	assert(resizeButton.minHeight, "minHeight key is not set.");
	local parentFrame = resizeButton.resizableFrame;
	resizeButton:RegisterForDrag("LeftButton");
	resizeButton:SetScript("OnDragStart", function(self)
		if not self.onResizeStart or not self.onResizeStart() then
			_DMinstrelResizeFrame.minWidth = self.minWidth;
			_DMinstrelResizeFrame.minHeight = self.minHeight;
			_DMinstrelResizeFrame:ClearAllPoints();
			_DMinstrelResizeFrame:SetPoint("CENTER", self.resizableFrame, "CENTER", 0, 0);
			_DMinstrelResizeFrame:SetWidth(parentFrame:GetWidth());
			_DMinstrelResizeFrame:SetHeight(parentFrame:GetHeight());
			_DMinstrelResizeFrame:Show();
			_DMinstrelResizeFrame:StartSizing();
			parentFrame.isSizing = true;
		end
	end);
	resizeButton:SetScript("OnDragStop", function(self)
		if parentFrame.isSizing then
			_DMinstrelResizeFrame:StopMovingOrSizing();
			parentFrame.isSizing = false;
			local height, width = _DMinstrelResizeFrame:GetHeight(), _DMinstrelResizeFrame:GetWidth()
			_DMinstrelResizeFrame:Hide();
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

_DMinstrelResizeFrame:SetScript("OnUpdate", function(self)
	local height, width = self:GetHeight(), self:GetWidth();
	local xheight, xwidth;
	if height < self.minHeight then
		xheight = "|cffFF0000"..math.ceil(height).."|r";
	else
		xheight = "|cff85FF85"..math.ceil(height).."|r";
	end
	if width < self.minWidth then
		xwidth = "|cffFF0000"..math.ceil(width).."|r";
	else
		xwidth = "|cff85FF85"..math.ceil(width).."|r";
	end
	_DMinstrelResizeFrame.text:SetText(xwidth .. " x " .. xheight);
end);

function DMinstrel:ChangeContent(window)
	if window == "Models" then
		--DMinstrelUI:Hide();
		DMinstrelMacrosEdit:Hide();
		DMinstrelObjectEdit:Hide();
		DMinstrel:SwitchWindow();
		return
	end
	DMinstrelUIContentCommands:Hide();
	DMinstrelUIContentNPC:Hide();
	DMinstrelUIContentGObject:Hide();

	DMinstrelUIBottom.Commands:UnlockHighlight();
	DMinstrelUIBottom.GObject:UnlockHighlight();
	DMinstrelUIBottom.NPC:UnlockHighlight();
	if window == "Commands" then
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
	--SendChatMessage(msg, "WHISPER", nil, GetUnitName("PLAYER"));
	C_ChatInfo.SendAddonMessage(DMinstrel.Prefix, msg, "WHISPER", GetUnitName("PLAYER"));
end

local function chsize(char)
    if not char then
        return 0
    elseif char > 240 then
        return 4
    elseif char > 225 then
        return 3
    elseif char > 192 then
        return 2
    else
        return 1
    end
end

local function utf8sub(str, startByte, numBytes)
	local currentIndex = startByte
	local returnedBytes = 0;

	while numBytes > 0 and currentIndex <= #str do
	  local char = string.byte(str, currentIndex)
	  currentIndex = currentIndex + chsize(char)
	  numBytes = numBytes - chsize(char)
	  returnedBytes = returnedBytes + chsize(char)
	end
	return str:sub(startByte, currentIndex - 1), returnedBytes
end

local function GetShorterString(longMsg, size)
	local shortText, sizeBytes = utf8sub(longMsg, 1, size - 1)
	local remainingPart = longMsg:sub(sizeBytes + 1, longMsg:len())
	return shortText, remainingPart;
end

function DMinstrel:SayLongMessage(frame, delay)
	if (not UnitExists("target")) then
		return;
	end

	if (UnitIsPlayer("target")) then
		return;
	end

	local delay = tonumber(delay) or 1;

	if (delay < 0) then
		delay = 1;
	end

	local channel = DMinstrel.NPCSayChannels[frame.selectedChannel][2] or "say";
	local msg = _G[frame:GetName().."TextAreaScrollText"]:GetText();
	local command = (frame.chatCommand.." "..channel.." ") or "";
	local size = DMinstrel.ChatMaxLetters - #command;
	local text_len = #msg;
	local chunks = {};
	local words = {};
	for m in msg:gmatch("[^ ]+") do
		if (text_len > size) then
			local shortPart, remainingPart = nil, m;
			local i = 1;
			while remainingPart and #remainingPart > 0 do
				shortPart, remainingPart = GetShorterString(remainingPart, size);
				if (shortPart and shortPart ~= "") then
					table.insert(words, shortPart);
				end

				if (i > 10) then
					break;
				end
				i = i + 1;
			end
		else
			table.insert(words, m);
		end
	end

	local temp = "";
	for i = 1, #words do
		if (#temp + #words[i] <= size - 6) then
			if (#temp > 0) then
				temp = temp.." "..words[i];
			else
				temp = words[i];
			end
		else
			if (temp:find("$tab")) then
				while temp:find("$tab") do
					temp = temp:gsub("$tab", "    ");
				end
			end
			if (#temp > 0) then
				table.insert(chunks, temp);				
			end
			temp = words[i];
		end
	end

	if (#temp > 0) then
		if (temp:find("$tab")) then
			while temp:find("$tab") do
				temp = temp:gsub("$tab", "    ");
			end
		end
		table.insert(chunks, temp);
	end

	SendChatMessage(command..chunks[1], "WHISPER", nil, GetUnitName("PLAYER"));
	if (#chunks == 1) then
		return;
	end
	if frame.sendMessageBtn then
		frame.sendMessageBtn:Disable();
	end

	local idx = 2;
	local timer;
	timer = C_Timer.NewTicker(delay, function ()
		local m = chunks[idx];
		if (m == " ") then
			idx = idx + 1;
			return;
		end
		SendChatMessage(command..m, "WHISPER", nil, GetUnitName("PLAYER"));
		if (idx == #chunks and frame.sendMessageBtn) then
			frame.sendMessageBtn:Enable();
		end
		idx = idx + 1;
	end, #chunks - 1);
end

function DMinstrel:WantToPlaySound()
	if (DMinstrel_SoundPlanel:IsShown()) then
		DMinstrel_SoundPlanel:Hide();
	else
		DMinstrel_SoundPlanel:Show();
	end
end

function DMinstrel:TimedSwitchFrameState(frame)
	DMinstrel.ReEnableFrame = frame;
	DMinstrel:ReEnabledFrame();
	DMinstrel:ScheduleTimer("ReEnabledFrame", 0.5);
end

function DMinstrel:ReEnabledFrame()
	if DMinstrel.ReEnableFrame:IsEnabled() then
		DMinstrel.ReEnableFrame:Disable();
	else
		DMinstrel:SendMinstrelMessage(".minstrel gobject delete "..DMinstrel.GOBInfo["LastGuid"]);
		DMinstrel.ReEnableFrame:Enable();
	end
end

function DMinstrel:UpdateGOBInterface()
	DMinstrelGOBGUIDText:SetText(DMinstrel.GOBInfo["LastGuid"]);
	DMinstrelGOBCoordXText:SetText(DMinstrel.GOBInfo["StartX"]);
	DMinstrelGOBCoordYText:SetText(DMinstrel.GOBInfo["StartY"]);
	DMinstrelGOBCoordZText:SetText(DMinstrel.GOBInfo["StartZ"]);
end

function DMinstrel:HandleGOBMoveClear()
	DMinstrelGOBGUIDText:SetText("");
	DMinstrelGOBSizeText:SetText("1.0");
	DMinstrelGOBCoordXText:SetText("");
	DMinstrelGOBCoordYText:SetText("");
	DMinstrelGOBCoordZText:SetText("");
	DMinstrelGOBValueYawText:SetText("0");
	DMinstrelGOBValuePitchText:SetText("0");
	DMinstrelGOBValueRollText:SetText("0");
end

function DMinstrel:HandleGOBMoveDelete()
	local GUID = DMinstrelGOBGUIDText:GetText();
	local msg = ".min gob del "..GUID;
	DMinstrel:SendMinstrelMessage(msg);
	DMinstrel:HandleGOBMoveClear();
end

function DMinstrel:HandleGOBMoveEditFocusLost(frame)
	local msg = "";
	local GUID = DMinstrelGOBGUIDText:GetText();
	local VALUE = DMinstrelGOBValueSizeText:GetText();
	local SIZE = DMinstrelGOBSizeText:GetText();
	local COORDX = DMinstrelGOBCoordXText:GetText();
	local COORDY = DMinstrelGOBCoordYText:GetText();
	local COORDZ = DMinstrelGOBCoordZText:GetText();
	local YAW = DMinstrelGOBValueYawText:GetText();
	local PITCH = DMinstrelGOBValuePitchText:GetText();
	local ROLL = DMinstrelGOBValueRollText:GetText();

	if(frame.set == "SIZE")then
		msg = ".min gob set scale "..GUID.." "..SIZE;
	elseif(frame.set == "COORDX" or frame.set == "COORDY" or frame.set == "COORDZ")then
		msg = ".min gob move "..GUID.." "..COORDX.." "..COORDY.." "..COORDZ;
	elseif(frame.set == "YAW" or frame.set == "PITCH" or frame.set == "ROLL")then
		msg = ".min gob turn "..GUID.." "..math.rad(YAW).." "..math.rad(PITCH).." "..math.rad(ROLL);
	end

	DMinstrel:SendMinstrelMessage(msg);
end

function DMinstrel:HandleGOBMove(button)
	local msg = ""
	local isMove = false;
	local isSpin = false;
	local GUID = DMinstrelGOBGUIDText:GetText();
	local VALUE = DMinstrelGOBValueSizeText:GetText();
	local SIZE = DMinstrelGOBSizeText:GetText();
	local COORDX = DMinstrelGOBCoordXText:GetText();
	local COORDY = DMinstrelGOBCoordYText:GetText();
	local COORDZ = DMinstrelGOBCoordZText:GetText();
	local YAW = DMinstrelGOBValueYawText:GetText();
	local PITCH = DMinstrelGOBValuePitchText:GetText();
	local ROLL = DMinstrelGOBValueRollText:GetText();

	if(button.operation == "Decr") then
		VALUE = -VALUE;
	end
	if(button.set == "X")then
		DMinstrelGOBCoordXText:SetText(tonumber(COORDX) + tonumber(VALUE));
		isMove = true;
	elseif(button.set == "Y")then
		DMinstrelGOBCoordYText:SetText(tonumber(COORDY) + tonumber(VALUE));
		isMove = true;
	elseif(button.set == "Z")then
		DMinstrelGOBCoordZText:SetText(tonumber(COORDZ) + tonumber(VALUE));
		isMove = true;
	elseif(button.set == "S")then
		DMinstrelGOBSizeText:SetText(tonumber(SIZE) + tonumber(VALUE));
		isMove = false;
		isSpin = false;
	elseif(button.set == "Yaw")then
		DMinstrelGOBValueYawText:SetText(tonumber(YAW) + tonumber(VALUE));
		isSpin = true;
	elseif(button.set == "Pitch")then
		DMinstrelGOBValuePitchText:SetText(tonumber(PITCH) + tonumber(VALUE));
		isSpin = true;
	elseif(button.set == "Roll")then
		DMinstrelGOBValueRollText:SetText(tonumber(ROLL) + tonumber(VALUE));
		isSpin = true;
	end
	if(button.set == "Pitch")then
		isSpin = true;
	elseif(button.set == "Yaw")then
		isSpin = true;
	elseif(button.set == "Roll")then
		isSpin = true;
	end

	GUID = DMinstrelGOBGUIDText:GetText();
	VALUE = DMinstrelGOBValueSizeText:GetText();
	SIZE = DMinstrelGOBSizeText:GetText();
	COORDX = DMinstrelGOBCoordXText:GetText();
	COORDY = DMinstrelGOBCoordYText:GetText();
	COORDZ = DMinstrelGOBCoordZText:GetText();

	YAW = DMinstrelGOBValueYawText:GetText();
	PITCH = DMinstrelGOBValuePitchText:GetText();
	ROLL = DMinstrelGOBValueRollText:GetText();

	if(isMove)then
		msg = ".min gob move "..GUID.." "..COORDX.." "..COORDY.." "..COORDZ;
	end
	if(isSpin)then
		msg = ".min gob turn "..GUID.." "..math.rad(YAW).." "..math.rad(PITCH).." "..math.rad(ROLL);
	end
	if(not isSpin and not isMove)then
		msg = ".min gob set scale "..GUID.." "..SIZE;
	end
	DMinstrel:SendMinstrelMessage(msg)
end

function DMinstrel:AddMinimapIcon()
	LDBObject = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("DMinstrel", {
		type = "data source",
		icon = "Interface\\ICONS\\TRADE_ARCHAEOLOGY_CARVED HARP OF EXOTIC WOOD.BLP",
		tocname = "dminstrel",
		OnClick = function(_, button)
			DMinstrel:switchMainFrame();
		end,
		OnTooltipShow = function(tooltip)
			tooltip:AddLine("|cFFFF9C00Darkmoon Minstrel Helper|r");
			tooltip:AddLine("|cFFFF8040ЛКМ\\ПКМ|r: Открыть\\закрыть окно аддона.");
		end,
	})

	if (DMinstrelIconData == nil) then
		DMinstrelIconData = { hide = false, minimapPos = 140.35 }	
	end

	icon = LibStub("LibDBIcon-1.0");
	icon:Register("DMinstrelIcon", LDBObject, DMinstrelIconData);
	icon:Show("DMinstrelIcon");
end

StaticPopupDialogs["DMinstrelMacrosEdit"] = {
	text = "Вы действительно хотите изменить макрос?",
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function (self, data)
		DMinstrelSave[DMinstrel.ActiveMacros][2] = data[1];
		DMinstrelMacrosEdit:Hide();
	end,
	OnCancel = function (_,reason)

	end,
	hasEditBox = false,
	timeout = 30,
	whileDead = true,
	hideOnEscape = true,
}

StaticPopupDialogs["DMinstrelObjectEdit"] = {
	text = "Вы действительно хотите изменить команду объекта?",
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function (self, data)
		DMinstrelGOBSave[DMinstrel.ActiveObjectButton][2] = data[1];
		DMinstrelGOBSave[DMinstrel.ActiveObjectButton][1] = data[2];
		DMinstrelGOBSave[DMinstrel.ActiveObjectButton][3] = tostring(DMinstrel.DataProvider.Icons.StylizingFrameTex.IconID);
		DMinstrelUI:Hide(); -- Нужно чтобы обновить текст
		DMinstrelUI:Show();
		DMinstrelObjectEdit:Hide();
	end,
	OnCancel = function (_,reason)

	end,
	hasEditBox = false,
	timeout = 30,
	whileDead = true,
	hideOnEscape = true,
}

print("Аддон |cff008C80DMinstrel|r загружен!|nПриятного пользования.");

SlashCmdList["DMIN"] = function (arg)
    if(arg == "npcsay")then
		DMinstrel:switchNPCSayFrame();
	elseif(arg == "say")then
		DMinstrel:switchNPCSayFrame();
	elseif(arg == "npcview")then
		DMinstrel:SwitchWindow();
	elseif(arg == "npc")then
		DMinstrel:SwitchWindow();
	elseif(arg == "view")then
		DMinstrel:SwitchWindow();
	elseif(arg == "obj")then
		DMinstrel:switchGOBMoveFrame();
	elseif(arg == "object")then
		DMinstrel:switchGOBMoveFrame();
	else
		DMinstrel:switchMainFrame();
	end
end
SLASH_DMIN1 = '/dmin'