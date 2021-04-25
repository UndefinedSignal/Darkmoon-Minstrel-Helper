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
    ----------====~~GO Target Command Match Text ~~====----------
    for guid in string.gmatch(chatstring, Strings["lfer_GOtargid1"]) do --TARGET ID
      chatstring = string.gsub (chatstring, Strings["lfer_GOtargid2"], MangLinkifier_Link(Strings["lfer_GOtargid3"], "%2", "targid"))
    end
    for guid in string.gmatch(chatstring, Strings["lfer_GOtargguid1"]) do --TARGET GUID
      chatstring = string.gsub (chatstring, Strings["lfer_GOtargguid2"], MangLinkifier_Link(Strings["lfer_GOtargguid3"], "%1", "targguid"))
    end
    for guid in string.gmatch(chatstring, Strings["lfer_GOtargxyz1"]) do --TARGET XYZ
      chatstring = string.gsub(chatstring, Strings["lfer_GOtargxyz2"], MangLinkifier_Link(Strings["lfer_GOtargxyz3"], "%1 %2 %3 %4", "targxyz"))
    end
  end
  return chatstring
end
--[[
local function Rainbowify(text)
  local finalText = ""
  local i = 1

  local characterCount = 0;
  for character in string.gmatch(text, "([%z\1-\127\194-\244][\128-\191]*)") do
    characterCount = characterCount + 1
  end

  for character in string.gmatch(text, "([%z\1-\127\194-\244][\128-\191]*)") do
    ---@type Color
    local color = Rainbow(i, characterCount)
    finalText = finalText .. color:WrapTextInColorCode(character)
    i = i + 1
  end
  return finalText
end]]

function MangLinkifier_Link(orgtxt, id, type)
  local color = DMinstrel.Linkifier.db.profile.style.color.linkifier
  local urlcolor = RGBPercToHex(color.r,color.g,color.b)
  --local urlcolor = (string.rep("0",6-string.len((string.upper(string.format("%x", dec)))))..(string.upper(string.format("%x", dec))))
  ----------====~~GO Target Command Replace Text ~~====----------
  if(type == "targid") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Htargidadd:" .. id .. "|h["..Locale["lfer_Spawn"].."]|h|r "
  elseif(type == "targguid") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Htargguidgo:" .. id .. "|h["..Locale["lfer_Goto"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Htargguidmove:" .. id .. "|h["..Locale["lfer_Move"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Htargguidturn:" .. id .. "|h["..Locale["lfer_Turn"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Htargguiddel:" .. id .. "|h["..Locale["lfer_Delete"].."]|h|r " 
    link = link .." - |cff" .. urlcolor .. "|Htargguidact:" .. id .. "|h["..Locale["lfer_Activate"].."]|h|r \n" 
  elseif(type == "targxyz") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Htargxyz:" .. id .. "|h["..Locale["lfer_Teleport"].."]|h|r "
  else 
    link = orgtxt .." - |cffc20000"..Locale["lfer_Error"].." |r |cff008873" .. type .. "|r"
  end
  return link
end

function MangLinkifier_SetItemRef(link, text, button)
  ----------====~~Target Command Functions ~~====----------
  if ( strsub(link, 1, 9) == "targidadd" ) then
    SendChatMessage(".gobject add "..strsub(link, 11), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 10) == "targguidgo" ) then
    SendChatMessage(".go object "..strsub(link, 12), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 12) == "targguidmove" ) then
    SendChatMessage(".gobject move "..strsub(link, 14), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 12) == "targguidturn" ) then
    SendChatMessage(".gobject turn "..strsub(link, 14), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 11) == "targguidact" ) then
      SendChatMessage(".gobject activate "..strsub(link, 13), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 11) == "targguiddel" ) then
    SendChatMessage(".gobject delete "..strsub(link, 13), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 7) == "targxyz" ) then
    SendChatMessage(".go "..strsub(link, 9), say, nil, nil)
    return;
  end
  MangLinkifier_SetItemRef_Original(link, text, button);
end
