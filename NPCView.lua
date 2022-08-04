local ModelStep = 12;
DMinstrel.Models.CurrentID = 1;
DMinstrel.Models.ToShow = DMinstrel.Models.Creatures

function DMinstrel:SearchFor(key)
    DMinstrel.Models.ToShow = {};
    if (key == "") then
        DMinstrel.Models.ToShow = DMinstrel.Models.Creatures;
        return;
    end
    for i=1, #DMinstrel.Models.Creatures do
        if string.find(strlower(DMinstrel.Models.Creatures[i][2]),strlower(key)) ~= nil or string.find(strlower(DMinstrel.Models.Creatures[i][1]),strlower(key)) ~= nil then
            table.insert(DMinstrel.Models.ToShow, DMinstrel.Models.Creatures[i]);
        end
    end
end

function DMinstrel:SwitchWindow()
    if (NPCViewUI:IsVisible())then
        NPCViewUI:Hide();
    else
        NPCViewUI:Show();
    end
end

function DMinstrel:InitializeModelBoxes()
    local mainframe = _G["NPCViewUIChild"];
    local flag = false;
    for i=1, ModelStep do
        local frame = CreateFrame("Frame", "NPCViewUIF"..i, mainframe, "ModelBounds")
        frame.textString = DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][2]
        frame:SetSize(200,200);
        if(i <= 1) then
            frame:SetPoint("TOPLEFT", mainframe, 5, -45);
        elseif(flag)then
            frame:SetPoint("TOPLEFT", "NPCViewUIF"..i-4, "BOTTOMLEFT", 0, -4);
        else
            frame:SetPoint("TOPLEFT", "NPCViewUIF"..i-1, "TOPRIGHT", 4, 0);
        end
        local model = _G[frame:GetName().."SectorModel"];
        model:SetCamDistanceScale(1.5);
        model:SetRotation(0.5);
        model:SetCreature(DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][1]);
        model:SetAllPoints();
        frame.spawnID = DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][1]
        frame.displayID = DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][4]
        frame.Title:SetText(frame.textString.."|n[|cFFFD8A00"..frame.spawnID.."|r]");
        frame.id:SetText(frame.displayID);
        frame:Show();

        flag = (i % 4 == 0)
    end
    _G["NPCViewUIBottomText"]:SetText(DMinstrel.Models.CurrentID + ModelStep.."/"..#DMinstrel.Models.ToShow);
end

function DMinstrel:UpdateModelBoxes()
    local mainframe = _G["NPCViewUIChild"];
    -- mainframe.SwitchLeft:SetEnabled(GOBView.ID ~= 0);
    -- mainframe.SwitchRight:SetEnabled((GOBView.ID + ModelStep) < #GOBView.ListToShown);
    if(DMinstrel.Models.CurrentID < 0) then 
        DMinstrel.Models.CurrentID = 0;
    elseif(DMinstrel.Models.CurrentID ~= 1 and DMinstrel.Models.CurrentID >= #DMinstrel.Models.ToShow) then 
        DMinstrel.Models.CurrentID = #DMinstrel.Models.ToShow - ModelStep;
    end

    --if (DMinstrel.Models.CurrentID+ModelStep <= #DMinstrel.Models.ToShow) then
        for i=1, ModelStep do
            if(DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i]) then
                local frame = _G["NPCViewUIF"..i];
                frame:Show();
                local model = _G[frame:GetName().."SectorModel"];

                frame.textString = DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][2]
                frame.spawnID = DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][1]
                frame.displayID = DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][4]
                
                frame.Title:SetText(frame.textString.."|n[|cFFFD8A00"..frame.spawnID.."|r]");
                frame.id:SetText(frame.displayID);
                model:SetCreature(DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][1]);
            else
                local frame = _G["NPCViewUIF"..i];
                frame:Hide();
            end
        end
        _G["NPCViewUIBottomText"]:SetText(DMinstrel.Models.CurrentID+ModelStep.."/"..#DMinstrel.Models.ToShow);
    --end
end

function DMinstrel:TryToLookUp(spawn, id)
    local msg;
    if(spawn)then
        msg = ".minstrel npc add "..id;
    else
        msg = ".minstrel morph "..id;
    end
    SendChatMessage(msg, "WHISPER", nil, GetUnitName("PLAYER"));
end

function DMinstrel:OnMouseScrollUp(frame, delta)
    frame.Zoom = frame.Zoom + delta * 0.2;
    if(frame.Zoom <= 0.2) then frame.Zoom = 0.2; end;
    frame:SetCamDistanceScale(frame.Zoom);
end

function DMinstrel:ModelScreenUpdate()
    DMinstrel:UpdateModelBoxes();
    DMinstrel:ScheduleTimer("UpdateModelBoxes", 0.2);
end

function DMinstrel:SwitchLeft()
    DMinstrel.Models.CurrentID = DMinstrel.Models.CurrentID - ModelStep;
    DMinstrel:ModelScreenUpdate();
end

function DMinstrel:SwitchRight()
    DMinstrel.Models.CurrentID = DMinstrel.Models.CurrentID + ModelStep;
    DMinstrel:ModelScreenUpdate();
end

DMinstrel:InitializeModelBoxes();