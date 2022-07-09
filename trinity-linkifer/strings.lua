-------------------------------------------------------------------------------------------------------------
--
-- TrinityAdmin Version 3.x
-- TrinityAdmin is a derivative of MangAdmin.
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
function ReturnPratStrings_ruRU()
  return {
    --linkifier
    ----------====~~GO Target Command Match Text ~~====----------
    ["lfer_GOtargid1"] = "GUID: |cffffffff|Hpos:|h(%d+).+ ID: |cffffffff|Hpos:|h(%d+)|h",
    ["lfer_GOtargid2"] = "GUID: |cffffffff|Hpos:|h(%d+).+ ID: |cffffffff|Hpos:|h(%d+)|h",
    ["lfer_GOtargid3"] = "GUID: %1 ID: %2",
    ["lfer_GOtargguid1"] = "GUID: (%d+) ID: (%d+)",
    ["lfer_GOtargguid3"] = "GUID: %1 ID: %1",
    ["lfer_GOtargxyz1"] = "X: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Y: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Z: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r MapId: |cffffffff|Hpos:|h(%d+)",
    ["lfer_GOtargxyz2"] = "X: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Y: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Z: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r MapId: |cffffffff|Hpos:|h(%d+)",
    ["lfer_GOtargxyz3"] = "X: %1  Y: %2  Z: %3 MapId: %4", "%1 %2 %3 %4",
    ----------====~~ NPC Info Command Match Text ~~====----------
    ["lfer_NPCInfoguid1"] = "SpawndID: (%d+)%.",
    ["lfer_NPCInfoguid2"] = "SpawndID: (%d+)%.",
    ["lfer_NPCInfoguid3"] = "SpawndID: %1.",
    ["lfer_NPCInfoentry1"] = "Entry: (%d+)%.",
    ["lfer_NPCInfoentry2"] = "Entry: (%d+)%.",
    ["lfer_NPCInfoentry3"] = "Entry: %1.",
    ["lfer_NPCInfodisplay1"] = "DisplayID: (%d+)",
    ["lfer_NPCInfodisplay2"] = "DisplayID: (%d+)",
    ["lfer_NPCInfodisplay3"] = "DisplayID: %1.",
    ----------====~~ GOB Near Command Match Text ~~====----------
    ["lfer_GOBTarGuid1"] = "GUID: (%d+) ID: (%d+)",
    ["lfer_GOBTarGuid2"] = ".+GUID: (%d+) ID: (%d+)",
    ["lfer_GOBTarGuid3"] = "GUID: %1 ID: %2",

    ["lfer_GOBTarOrientation1"] = "Orientation: (%d+%.%d+)",
    ["lfer_GOBTarOrientation2"] = "Orientation: %1",
    ----------====~~ ADD GO Command Match Text ~~====----------
    ["lfer_AddGoguid1"] = "%) %(GUID: (%d+)%)",
    ["lfer_AddGoguid2"] = "%(GUID: (%d+)%)",
    ["lfer_AddGoguid3"] = "(GUID: %1)",
    ["lfer_AddGoid1"] = "Object '(%d+)'",
    ["lfer_AddGoid2"] = "Object '(%d+)'",
    ["lfer_AddGoid3"] = "Object '%1')",
    ["lfer_AddGoxyz1"] = "'([%p%d.%d]+) ([%p%d.%d]+) ([%p%d.%d]+)'",
    ["lfer_AddGoxyz2"] = "'([%p%d.%d]+) ([%p%d.%d]+) ([%p%d.%d]+)'",
    ["lfer_AddGoxyz3"] = "'%1 %2 %3'"
}
end

function ReturnStrings_ruRU()
  return {
    --linkifier
    ----------====~~GO Target Command Match Text ~~====----------
    ["lfer_GOtargid1"] = "GUID: |cffffffff|Hpos:|h(%d+).+ ID: |cffffffff|Hpos:|h(%d+)|h",
    ["lfer_GOtargid2"] = "GUID: |cffffffff|Hpos:|h(%d+).+ ID: |cffffffff|Hpos:|h(%d+)|h",
    ["lfer_GOtargid3"] = "GUID: %1 ID: %2",
    ["lfer_GOtargguid1"] = "GUID: (%d+) ID: (%d+)",
    ["lfer_GOtargguid3"] = "GUID: %1 ID: %1",
    ["lfer_GOtargxyz1"] = "X: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Y: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Z: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r MapId: |cffffffff|Hpos:|h(%d+)",
    ["lfer_GOtargxyz2"] = "X: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Y: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r Z: |cffffffff|Hpos:|h([0-9 -]+.%d+)|h|r MapId: |cffffffff|Hpos:|h(%d+)",
    ["lfer_GOtargxyz3"] = "X: %1  Y: %2  Z: %3 MapId: %4", "%1 %2 %3 %4",
    ----------====~~ NPC Info Command Match Text ~~====----------
    ["lfer_NPCInfoguid1"] = "SpawndID: (%d+)%.",
    ["lfer_NPCInfoguid2"] = "SpawndID: (%d+)%.",
    ["lfer_NPCInfoguid3"] = "SpawndID: %1.",
    ["lfer_NPCInfoentry1"] = "Entry: (%d+)%.",
    ["lfer_NPCInfoentry2"] = "Entry: (%d+)%.",
    ["lfer_NPCInfoentry3"] = "Entry: %1.",
    ["lfer_NPCInfodisplay1"] = "DisplayID: (%d+)",
    ["lfer_NPCInfodisplay2"] = "DisplayID: (%d+)",
    ["lfer_NPCInfodisplay3"] = "DisplayID: %1.",
    ----------====~~ GOB Near Command Match Text ~~====----------
    ["lfer_GOBTarGuid1"] = "GUID: (%d+) ID: (%d+)",
    ["lfer_GOBTarGuid2"] = ".+GUID: (%d+) ID: (%d+)",
    ["lfer_GOBTarGuid3"] = "GUID: %1 ID: %2",

    ["lfer_GOBTarOrientation1"] = "Orientation: (%d+%.%d+)",
    ["lfer_GOBTarOrientation2"] = "Orientation: %1",
    ----------====~~ ADD GO Command Match Text ~~====----------
    ["lfer_AddGoguid1"] = "%) %(GUID: (%d+)%)",
    ["lfer_AddGoguid2"] = "%(GUID: (%d+)%)",
    ["lfer_AddGoguid3"] = "(GUID: %1)",
    ["lfer_AddGoid1"] = "Object '(%d+)'",
    ["lfer_AddGoid2"] = "Object '(%d+)'",
    ["lfer_AddGoid3"] = "Object '%1')",
    ["lfer_AddGoxyz1"] = "'([%p%d.%d]+) ([%p%d.%d]+) ([%p%d.%d]+)'",
    ["lfer_AddGoxyz2"] = "'([%p%d.%d]+) ([%p%d.%d]+) ([%p%d.%d]+)'",
    ["lfer_AddGoxyz3"] = "'%1 %2 %3'",

    ["lfer_LookUpObj1"] = "(%d+) - .+(%d+).+%[(.+)%]|h|r'",
    ["lfer_LookUpObj2"] = "(%d+) - .+(%d+).+%[(.+)%]|h|r",
    ["lfer_LookUpObj3"] = "%1 - %3'"

}
end