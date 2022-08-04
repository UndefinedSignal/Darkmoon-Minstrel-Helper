-------------------------------------------------------------------------------------------------------------
--
-- TrinityAdmin Version 3.x
-- TrinityAdmin is a derivative of DMinstrel.Linkifier.
--
-- Copyright (C) 2007 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Official Forums: http://groups.google.com/group/trinityadmin
-- GoogleCode Website: http://code.google.com/p/trinityadmin/
-- Subversion Repository: http://trinityadmin.googlecode.com/svn/
-- Dev Blog: http://trinityadmin.blogspot.com/
-------------------------------------------------------------------------------------------------------------


local function RGBPercToHex(r, g, b)
	r = r <= 1 and r >= 0 and r or 0
	g = g <= 1 and g >= 0 and g or 0
	b = b <= 1 and b >= 0 and b or 0
	return string.format("%02x%02x%02x", r*255, g*255, b*255)
end
function MangLinkifier_Decompose(chatstring)
  if chatstring ~= nil then
    -- ----------====~~ NPC Info Command Match Text ~~====----------
    -- for guid in string.gmatch(chatstring, Strings["lfer_NPCInfoname1"]) do --NPCINFO Name
    --   chatstring = string.gsub (chatstring, Strings["lfer_NPCInfoname2"], MangLinkifier_Link(Strings["lfer_NPCInfoname3"], "%1", "npcname"))
    -- end
    for guid in string.gmatch(chatstring, Strings["lfer_NPCInfoguid1"]) do --NPCINFO GUID
      chatstring = string.gsub (chatstring, Strings["lfer_NPCInfoguid2"], MangLinkifier_Link(Strings["lfer_NPCInfoguid3"], "%1", "npcguid"))
    end
    for guid in string.gmatch(chatstring, Strings["lfer_NPCInfoentry1"]) do --NPCINFO Entry
      chatstring = string.gsub (chatstring, Strings["lfer_NPCInfoentry2"], MangLinkifier_Link(Strings["lfer_NPCInfoentry3"], "%1", "npcentry"))
    end
    for guid in string.gmatch(chatstring, Strings["lfer_NPCInfodisplay1"]) do --NPCINFO Display
      chatstring = string.gsub (chatstring, Strings["lfer_NPCInfodisplay2"], MangLinkifier_Link(Strings["lfer_NPCInfodisplay3"], "%1", "npcdisplay"))
    end
    for guid in string.gmatch(chatstring, Strings["lfer_GOBTarOrientation1"]) do --MINGOBTarOrientation GUID
      DMinstrel.GOBInfo["Orientation"] = string.match(chatstring, Strings["lfer_GOBTarOrientation1"]);
      chatstring = string.gsub (chatstring, Strings["lfer_GOBTarOrientation1"], MangLinkifier_Link(Strings["lfer_GOBTarOrientation2"], "%1", "minoritent"));
    end
    for guid in string.gmatch(chatstring, Strings["lfer_GOBTarGuid1"]) do --MINGOBTar GUID
      DMinstrel.GOBInfo["LastGuid"] = string.match(chatstring, Strings["lfer_GOBTarGuid2"]);
      chatstring = string.gsub (chatstring, Strings["lfer_GOBTarGuid1"], MangLinkifier_Link(Strings["lfer_GOBTarGuid3"], "%1 %2", "mingobtar"));
    end
  --   ----------====~~ ADD GO Command Match Text ~~====----------
    for guid in string.gmatch(chatstring, Strings["lfer_AddGoguid1"]) do --ADDGO GUID
      DMinstrel.GOBInfo["LastGuid"] = string.match(chatstring, Strings["lfer_AddGoguid2"]);
      chatstring = string.gsub (chatstring, Strings["lfer_AddGoguid2"], MangLinkifier_Link(Strings["lfer_AddGoguid3"], "%1", "addgoguid"));
    end
    for guid in string.gmatch(chatstring, Strings["lfer_GOtargxyz1"]) do
      DMinstrel.GOBInfo["LastX"], DMinstrel.GOBInfo["LastY"], DMinstrel.GOBInfo["LastZ"] = string.match(chatstring, Strings["lfer_GOtargxyz2"]);
      DMinstrel.GOBInfo["StartX"] = DMinstrel.GOBInfo["LastX"];
      DMinstrel.GOBInfo["StartY"] = DMinstrel.GOBInfo["LastY"];
      DMinstrel.GOBInfo["StartZ"] = DMinstrel.GOBInfo["LastZ"];
      DMinstrel:UpdateGOBInterface();
    end
    for guid in string.gmatch(chatstring, Strings["lfer_AddGoxyz1"]) do
      DMinstrel.GOBInfo["LastX"], DMinstrel.GOBInfo["LastY"], DMinstrel.GOBInfo["LastZ"] = string.match(chatstring, Strings["lfer_AddGoxyz2"]);
      DMinstrel.GOBInfo["StartX"] = DMinstrel.GOBInfo["LastX"];
      DMinstrel.GOBInfo["StartY"] = DMinstrel.GOBInfo["LastY"];
      DMinstrel.GOBInfo["StartZ"] = DMinstrel.GOBInfo["LastZ"];
      DMinstrel:UpdateGOBInterface();
      --chatstring = string.gsub (chatstring, Strings["lfer_AddGoxyz2"], MangLinkifier_Link(Strings["lfer_AddGoxyz3"], "%1", "addgoguid"));
    end
    for guid in string.gmatch(chatstring, Strings["lfer_ActGoguid1"]) do --Activate GUID
      chatstring = string.gsub (chatstring, Strings["lfer_ActGoguid2"], MangLinkifier_Link(Strings["lfer_ActGoguid3"], "%1", "actgoguid"));
    end
    for guid in string.gmatch(chatstring, Strings["lfer_AddGoid1"]) do --ADDGO ID
      chatstring = string.gsub (chatstring, Strings["lfer_AddGoid2"], MangLinkifier_Link(Strings["lfer_AddGoid3"], "%1", "addgoid"))
    end

    for guid in string.gmatch(chatstring, "%|cffffffff%|Hgameobject_entry:(.*)%|h%[(.*)%]%|h%|r") do --LOOKUP OBJECT
      chatstring = string.gsub(chatstring, "%|cffffffff%|Hgameobject_entry:(.*)%|h%[(.*)%]%|h%|r", MangLinkifier_Link("%2", "%1", "lookupgo"))
    end
    for guid in string.gmatch(chatstring, "%|cffffffff%|Hcreature_entry:(.*)%|h%[(.*)%]%|h%|r") do --LOOKUP CREATURE
      chatstring = string.gsub (chatstring, "%|cffffffff%|Hcreature_entry:(.*)%|h%[(.*)%]%|h%|r", MangLinkifier_Link("%2", "%1", "lookupcreature"))
    end

    -- for guid in string.gmatch(chatstring, Strings["lfer_LookUpObj1"]) do
    --   chatstring = string.gsub (chatstring, Strings["lfer_LookUpObj1"], MangLinkifier_Link(Strings["lfer_LookUpObj1"], "%1 %3", "lookup"))
    -- end
  end
  return chatstring
end

function MangLinkifier_Link(orgtxt, id, type)
  local color = DMinstrel.Linkifier.db.profile.style.color.linkifier
  local urlcolor = RGBPercToHex(color.r,color.g,color.b)
  ----------====~~GO Target Command Replace Text ~~====----------
  if(type == "targid") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Htargidadd:" .. id .. "|h["..Locale["lfer_Spawn"].."]|h|r "
  elseif (type == "mingobtar") then
    local chunks = {};
    for s in id:gmatch("%S+") do
      table.insert(chunks, s);
    end
    link = orgtxt.. " - |cff" .. urlcolor .. "|Hmingobtarmmove:" .. chunks[1] .. "|h["..Locale["lfer_MMove"].."]|h|r "
    link = link.. " - |cff" .. urlcolor .. "|Hmingobtarmspawn:" .. chunks[2] .. "|h["..Locale["lfer_MSpawn"].."]|h|r "
    link = link.. " - |cff" .. urlcolor .. "|Hmingobtarmdel:" .. chunks[1] .. "|h["..Locale["lfer_MDel"].."]|h|r "
  elseif (type == "minoritent") then
    link = orgtxt.. " - |cff" .. urlcolor .. "|Hmingobtarorient:" .. id .. "|h["..Locale["lfer_MOrient"].."]|h|r "
  elseif(type == "npcname")then
    link = orgtxt.. " - |cff" .. urlcolor .. "|Hminnpcnamelookup:" .. id .. "|h["..Locale["lfer_NLook"].."]|h|r "
  ----------====~~ NPC Info Command Replace Text ~~====----------
  elseif(type == "npcguid") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Hnpcguidmove:" .. id .. "|h["..Locale["lfer_Move"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Hnpcguiddel:" .. id .. "|h["..Locale["lfer_MDel"].."]|h|r "
  elseif(type == "npcentry") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Hnpcentryadd:" .. id .. "|h["..Locale["lfer_Spawn"].."]|h|r "
  elseif(type == "npcdisplay") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Hnpcdisplay:" .. id .. "|h["..Locale["lfer_Morph"].."]|h|r "
  elseif(type == "lookupgo") then
    link = orgtxt .. "|cffffffff|Hgameobject_entry:" .. id .. "|h[" .. orgtxt .. "]|h|r"
    link = link .." - |cff" .. urlcolor .. "|Hlookupgoadd:" .. id .. "|h["..Locale["lfer_Spawn"].."]|h|r "
  elseif(type == "lookupcreature") then
    link = "|cffffffff|Hcreature_entry:" .. id .. "|h[" .. orgtxt .. "]|h|r"
    link = link .." - |cff" .. urlcolor .. "|Hlookupcreatureadd:" .. id .. "|h["..Locale["lfer_Spawn"].."]|h|r "
  ----------====~~ ADD GO Command Replace Text ~~====----------
  elseif(type == "addgoguid") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Haddgoguidmove:" .. id .. "|h["..Locale["lfer_Move"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Haddgoguidturn:" .. id .. "|h["..Locale["lfer_Turn"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Haddgoguiddel:" .. id .. "|h["..Locale["lfer_Delete"].."]|h|r \n"
  elseif(type == "addgoid") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Haddgoid:" .. id .. "|h["..Locale["lfer_Spawn"].."]|h|r \n"
  elseif(type == "actgoguid") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Hactgoguid:" .. id .. "|h["..Locale["lfer_Activate"].."]|h|r "
  else
    link = orgtxt .." - |cffc20000"..Locale["lfer_Error"].." |r |cff008873" .. type .. "|r"
  end
  return link
end

function MangLinkifier_SetItemRef(link, text, button)
  ----------====~~ NPC Info Command Functions ~~====----------
  if ( strsub(link, 1, 11) == "npcentryadd" ) then
    DMinstrel:SendMinstrelMessage(".minstrel npc add "..strsub(link, 13))
    return;
  elseif ( strsub(link, 1, 10) == "npcdisplay" ) then
    DMinstrel:SendMinstrelMessage(".minstrel morph "..strsub(link, 12))
    return;
  elseif ( strsub(link, 1, 11) == "npcdisplay2" ) then
    DMinstrel:SendMinstrelMessage(".minstrel morph "..strsub(link, 13))
    return;
  elseif ( strsub(link, 1, 11) == "npcguidmove" ) then
    DMinstrel:SendMinstrelMessage(".min npc come "..strsub(link, 13), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 10) == "npcguiddel" ) then
    DMinstrel:SendMinstrelMessage(".m n d "..strsub(link, 12), say, nil, nil)
    return;
  elseif( strsub(link, 1, 13) == "npcnamelookup" ) then
    DMinstrel:SendMinstrelMessage(".minstrel lookup creature "..strsub(link, 15), say, nil, nil)
    return;
  ----------====~~ ADD GO Command Functions ~~====----------
  elseif ( strsub(link, 1, 13) == "addgoguidmove" ) then
    DMinstrel:SendMinstrelMessage(".minstrel gobject move "..strsub(link, 15))
    return;
  elseif ( strsub(link, 1, 13) == "addgoguidturn" ) then
    DMinstrel:SendMinstrelMessage(".minstrel gobject turn "..strsub(link, 15))
    return;
  elseif ( strsub(link, 1, 12) == "addgoguiddel" ) then
    DMinstrel:SendMinstrelMessage(".minstrel gobject delete "..strsub(link, 14))
    return;
  elseif ( strsub(link, 1, 7) == "addgoid" ) then
    DMinstrel:SendMinstrelMessage(".minstrel gobject add "..strsub(link, 9))
    return;
  elseif ( strsub(link, 1, 9) == "actgoguid" ) then
    DMinstrel:SendMinstrelMessage(".minstrel gobject activate "..strsub(link, 11))
    return;
  elseif ( strsub(link, 1, 11) == "lookupgoadd" ) then
    DMinstrel:SendMinstrelMessage(".minstrel gobject add "..strsub(link, 13), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 14) == "creature_entry" ) then
    DMinstrel:SendMinstrelMessage(".minstrel npc add "..strsub(link, 16), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 17) == "lookupcreatureadd" ) then
    DMinstrel:SendMinstrelMessage(".minstrel npc add "..strsub(link, 19), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 15) == "mingobtarmspawn" ) then
    DMinstrel:SendMinstrelMessage(".minstrel gobject add "..strsub(link, 17));
    return;
  elseif ( strsub(link, 1, 14) == "mingobtarmmove" ) then
    DMinstrel:SendMinstrelMessage(".minstrel gobject move "..strsub(link, 16));
    return;
  elseif ( strsub(link, 1, 13) == "mingobtarmdel" ) then
    DMinstrel:SendMinstrelMessage(".minstrel gobject delete "..strsub(link, 15));
    return;
  elseif (strsub(link, 1, 15) == "mingobtarorient") then
    DMinstrel:SendMinstrelMessage(".minstrel gobject turn "..DMinstrel.GOBInfo["LastGuid"]);
    return;
  end
  MangLinkifier_SetItemRef_Original(link, text, button);
end
