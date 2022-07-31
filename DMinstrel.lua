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
DMinstrel.User.GOBJECT = "";
DMinstrel.Debug = false;
DMinstrel.ChatMaxLetters = 255;
DMinstrel.MyLevel = 0;
DMinstrel.MinstrelText = "";
DMinstrel.Timers = {};
DMinstrel.ReEnableFrame = nil;
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
-- DMinstrel.Commands[16] = {"Поворот объекта", "Открывает окно для вращения объектов"};

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
	DMinstrelGOBSave[1] = {"Огонь", ".min gob add 726147"};
	DMinstrelGOBSave[2] = {"Кровь", ".min gob add 739410"};
	DMinstrelGOBSave[3] = {"Красная руна", ".min gob add 724851"};
	DMinstrelGOBSave[4] = {"Синяя руна", ".min gob add 713694"};
	DMinstrelGOBSave[5] = {"Таргет", ".min gob tar"};
	DMinstrelGOBSave[6] = {"Ящик", ".min gob add 741496"};
	DMinstrelGOBSave[7] = {"Красный кристалл", ".min gob add 709940"};
	DMinstrelGOBSave[8] = {"Деревяная ограда", ".min gob add 718467"};
	DMinstrelGOBSave[9] = {"Капкан", ".min gob add 714992"};
	DMinstrelGOBSave[10] = {"Мусор", ".min gob add 718634"};
	DMinstrelGOBSave[11] = {"Обычный стол", ".min gob add 728267"};
	DMinstrelGOBSave[12] = {"Стог сена", ".min gob add 726959"};
	DMinstrelGOBSave[13] = {"Кусты", ".min gob add 708487"};
	DMinstrelGOBSave[14] = {"Удобное кресло", ".min gob add 738477"};
	DMinstrelGOBSave[15] = {"Простой табурет", ".min gob add 728933"};
	DMinstrelGOBSave[16] = {"Горшок зелени", ".min gob add 730574"};
	DMinstrelGOBSave[17] = {"Сеть", ".min gob add 739159"};
	DMinstrelGOBSave[18] = {"Бревно-скамья", ".min gob add 712354"};
	DMinstrelGOBSave[19] = {"Костёр", ".min gob add 739396"};
	DMinstrelGOBSave[20] = {"Палатка", ".min gob add 711377"};
	DMinstrelGOBSave[21] = {"Спальный мешок", ".min gob add 723887"};
	DMinstrelGOBSave[22] = {"Удобный диван", ".min gob add 738311"};
	DMinstrelGOBSave[23] = {"Туман", ".min gob add 720522"};
	DMinstrelGOBSave[24] = {"Удалить все свои объекты", ".min reset object"};
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
		DMinstrel:ProcessDMinstrelMorph();
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

-- function DMinstrel:OpenGObjectTurnFrame()

-- end

function DMinstrel:ReEnabledFrame()
	if DMinstrel.ReEnableFrame:IsEnabled() then
		DMinstrel.ReEnableFrame:Disable();
	else
		DMinstrel:SendMinstrelMessage(".minstrel gobject delete "..DMinstrel.User.GOBJECT);
		DMinstrel.ReEnableFrame:Enable();
	end
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