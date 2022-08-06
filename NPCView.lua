local ModelStep = 12;
DMinstrel.Models.Array = {}
DMinstrel.Models.CurrentID = 1;
DMinstrel.Models.IsFavourites = false;
DMinstrel.Models.ToShow = DMinstrel.Models.Creatures
DMinstrelNPC = {{1, 7392,"Степная курица",12,304,0,0,0},
{2, 7394,"Анконская курица",12,5369,0,0,0}}

function DMinstrel:SearchFor(key)
    DMinstrel.Models.ToShow = {};
    if (key == "") then
        DMinstrel:NPCCheckMode();
        return;
    end
    if(not DMinstrel.Models.IsFavourites) then
        for i=1, #DMinstrel.Models.Creatures do
            if string.find(strlower(DMinstrel.Models.Creatures[i][3]),strlower(key)) ~= nil or string.find(strlower(DMinstrel.Models.Creatures[i][2]),strlower(key)) ~= nil then
                table.insert(DMinstrel.Models.ToShow, DMinstrel.Models.Creatures[i]);
            end
        end
    else
        for i=1, #DMinstrelNPC do
            if string.find(strlower(DMinstrelNPC[i][3]),strlower(key)) ~= nil or string.find(strlower(DMinstrelNPC[i][2]),strlower(key)) ~= nil then
                table.insert(DMinstrel.Models.ToShow, DMinstrelNPC[i]);
            end
        end
    end
end

function DMinstrel:FavouritesSearch(number)
    for i=1, #DMinstrelNPC do
        if(DMinstrelNPC[i][2] == number)then
            return i;
        end
    end
    return false;
end

function DMinstrel:AddRemoveFromFavourites(id, position)
    if(not DMinstrel:FavouritesSearch(id))then
        table.insert(DMinstrelNPC, DMinstrel.Models.Creatures[position])
    else
        table.remove(DMinstrelNPC, tonumber(DMinstrel:FavouritesSearch(id)));
    end
    DMinstrel:ModelScreenUpdate();
end

function DMinstrel:SwitchWindow()
    if (NPCViewUI:IsVisible())then
        NPCViewUI:Hide();
    else
        NPCViewUI:Show();
    end
end

function DMinstrel:SwitchFavourites(button)
    DMinstrel.Models.IsFavourites = not DMinstrel.Models.IsFavourites;
    if(DMinstrel.Models.IsFavourites)then
        button:LockHighlight();
    else
        button:UnlockHighlight();
    end
    DMinstrel.Models.CurrentID = 0;
    DMinstrel:NPCCheckMode();
    DMinstrel:ModelScreenUpdate()
end

function DMinstrel:InitializeModelBoxes()
    local mainframe = _G["NPCViewUIChild"];
    local flag = false;
    for i=1, ModelStep do
        DMinstrel.Models.Array[i] = CreateFrame("Frame", "NPCViewUIF"..i, mainframe, "MinNPCModelBounds")
        DMinstrel.Models.Array[i].textString = DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][3]
        DMinstrel.Models.Array[i]:SetSize(200,200);
        if(i <= 1) then
            DMinstrel.Models.Array[i]:SetPoint("TOPLEFT", mainframe, 5, -45);
        elseif(flag)then
            DMinstrel.Models.Array[i]:SetPoint("TOPLEFT", "NPCViewUIF"..i-4, "BOTTOMLEFT", 0, 0);
        else
            DMinstrel.Models.Array[i]:SetPoint("TOPLEFT", "NPCViewUIF"..i-1, "TOPRIGHT", 0, 0);
        end
        local model = _G[DMinstrel.Models.Array[i]:GetName().."SectorModel"];
        model:SetCamDistanceScale(1.5);
        model:SetRotation(0.5);
        model:SetCreature(DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][2]);
        model:SetAllPoints();
        DMinstrel.Models.Array[i].position = DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][1];
        DMinstrel.Models.Array[i].spawnID = DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][2];
        if(DMinstrel:FavouritesSearch(DMinstrel.Models.Array[i].spawnID))then
            DMinstrel.Models.Array[i].Favourite:LockHighlight();
        else
            DMinstrel.Models.Array[i].Favourite:UnlockHighlight();
        end
        DMinstrel.Models.Array[i].displayID = DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][5];
        DMinstrel.Models.Array[i].Title:SetText(DMinstrel.Models.Array[i].textString.."|n[|cFFFD8A00"..DMinstrel.Models.Array[i].spawnID.."|r]");
        DMinstrel.Models.Array[i].id:SetText(DMinstrel.Models.Array[i].displayID);
        DMinstrel.Models.Array[i]:Show();

        flag = (i % 4 == 0)
    end
    _G["NPCViewUIBottomText"]:SetText(DMinstrel.Models.CurrentID + ModelStep.."/"..#DMinstrel.Models.ToShow);
end

function DMinstrel:UpdateModelBoxes()

    -- local mainframe = _G["NPCViewUIChild"];
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
                DMinstrel.Models.Array[i] = _G["NPCViewUIF"..i];
                DMinstrel.Models.Array[i]:Show();
                local model = _G[DMinstrel.Models.Array[i]:GetName().."SectorModel"];

                DMinstrel.Models.Array[i].textString = DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][3];
                DMinstrel.Models.Array[i].spawnID = DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][2];
                DMinstrel.Models.Array[i].displayID = DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][5];
                if(DMinstrel:FavouritesSearch(DMinstrel.Models.Array[i].spawnID))then
                    DMinstrel.Models.Array[i].Favourite:LockHighlight();
                else
                    DMinstrel.Models.Array[i].Favourite:UnlockHighlight();
                end
                DMinstrel.Models.Array[i].position = DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][1]
                DMinstrel.Models.Array[i].Title:SetText(DMinstrel.Models.Array[i].textString.."|n[|cFFFD8A00"..DMinstrel.Models.Array[i].spawnID.."|r]");
                DMinstrel.Models.Array[i].id:SetText(DMinstrel.Models.Array[i].displayID);
                model:SetCreature(DMinstrel.Models.ToShow[DMinstrel.Models.CurrentID+i][2]);
            else
                DMinstrel.Models.Array[i] = _G["NPCViewUIF"..i];
                DMinstrel.Models.Array[i]:Hide();
            end
        end
        _G["NPCViewUIBottomText"]:SetText(DMinstrel.Models.CurrentID+ModelStep.."/"..#DMinstrel.Models.ToShow);
    --end
end

function DMinstrel:NPCCheckMode()
    if(DMinstrel.Models.IsFavourites)then
        DMinstrel.Models.ToShow = DMinstrelNPC;
    else
        DMinstrel.Models.ToShow = DMinstrel.Models.Creatures;
    end
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