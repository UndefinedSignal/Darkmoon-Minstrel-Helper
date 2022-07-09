--[[
          \.   \.      __,-"-.__      ./   ./
       \.   \`.  \`.-'"" _,="=._ ""`-.'/  .'/   ./
       \`.  \_`-''      _,="=._      ``-'_/  .'/
        \ `-',-._   _.  _,="=._  ,_   _.-,`-' /
      \. /`,-',-._"""  \ _,="=._ /  """_.-,`-,'\ ./
       \`-'  /   `-._  "       "  _.-'   \  `-'/
       /)   (        \   ,-.   /        )   (\
   ,-'"    `-.       \  /   \  /       .-'    "`-,
  ,'_._        `-.____/ /  _  \ \____.-'        _._`,
 /,'   `.              \_/ \_/              .'   `,\
/'       )                _        TestUnit (       `\
       /   _,-'"`-.  ,++|T|||T|++.  .-'"`-,_   \
       / ,-'       \/|`|`|`|'|'|'|\/       `-, \
      /,'            | | | | | | |            `,\
    /'              ` | | | | | '              `\
                     ` | | | '
                        ` | '
]]--

-------------------------------------------------------------------------------------------------------------
--
-- TrinityAdmin Version 3.x
-- DMinstrel.Linkifier is a derivative of TrinityAdmin.
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
local defaults = {
  char = {
   functionQueue = {},
   msgDeltaTime = time(),  
  },
  profile = {
      style = {
       showtooltips = false,
       showchat = false,
       color = {
         buffer = {},
         buttons = {
          r = 0.99, 
          g = 0.99, 
          b = 0.99
         },
         frames = {
          r = 0.102,
          g = 0.102,
          b = 0.102
         },
         backgrounds = {
          r = 0.10,
          g = 0.10,
          b = 0.10
         },
         linkifier = {
          r = 0.00,
          g = 0.55,
          b = 0.50
         }
       }
      }
   }
}

Locale       = LibStub("AceLocale-3.0"):NewLocale("DMinstrel.Linkifier", "ruRU");
Locale       = Return_ruRU();

Strings      = LibStub("AceLocale-3.0"):NewLocale("TEST", "ruRU");


function DMinstrel.Linkifier:OnInitialize()
  self.db = LibStub("AceDB-3.0"):New("DMinstrel.LinkifierDB", defaults)
  if (IsAddOnLoaded("Prat-3.0")) then
    Strings    = ReturnPratStrings_ruRU();
  else
    Strings    = ReturnStrings_ruRU();
  end

   for i=1,NUM_CHAT_WINDOWS do
      local cf = getglobal("ChatFrame"..i)
      self:RawHook(cf, "AddMessage", true)
   end

   --clear color buffer
   self.db.profile.style.color.buffer = {}
   --altering the function setitemref, to make it possible to click links
   MangLinkifier_SetItemRef_Original = SetItemRef
   SetItemRef = MangLinkifier_SetItemRef
end

function DMinstrel.Linkifier:AddMessage(frame, text, r, g, b, id)
   -- message is not from server
   --Linkifier should be used on non server messages as well to catch links suc as items in chat
   text = MangLinkifier_Decompose(text)
   -- Returns the message to the client, or else the chat frame never shows it
   self.hooks[frame].AddMessage(frame, text, r, g, b, id)
end

function DMinstrel.Linkifier:ChatMsg(msg, msgt, recipient)
  if not msgt then local msgt = "say" end
  if msgt == "addon" then
   if recipient then
      SendAddonMessage("", msg, "WHISPER", recipient)
   else
      SendAddonMessage("", msg, "GUILD")
   end
  else
   if recipient then 
      SendChatMessage(msg, "WHISPER", nil, recipient)
   else
      SendChatMessage(msg, msgt, nil, nil)
   end
  end
end