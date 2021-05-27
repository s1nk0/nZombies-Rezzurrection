SWEP.Base = "tfa_melee_base"
SWEP.Category = "nZombies Buyable Knives"
SWEP.PrintName = "Slash N' Burn"
SWEP.Author		= "Laby" --Author Tooltip
SWEP.ViewModel = "models/weapons/bo3_melees/axe/c_axe_nz.mdl"
SWEP.WorldModel = "models/weapons/bo3_melees/axe/w_axe.mdl"
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 70
SWEP.UseHands = true
SWEP.HoldType = "melee2"
SWEP.DrawCrosshair = true

SWEP.Primary.Directional = false

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.DisableIdleAnimations = true

SWEP.Secondary.CanBash = false
SWEP.Secondary.MaxCombo = 0
SWEP.Primary.MaxCombo = 0

SWEP.VMPos = Vector(0,0,0) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.

-- nZombies Stuff
SWEP.NZPreventBox		= true	-- If true, this gun won't be placed in random boxes GENERATED. Users can still place it in manually.


SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -4.5,
        Right = 1,
        Forward = 3.5,
        },
        Ang = {
		Up = -90,
        Right = 5,
        Forward = 90
        },
		Scale = 1
}

function SWEP:Deploy()
	self:SendWeaponAnim(ACT_VM_DRAW_DEPLOYED)
	self.HolsterTime = CurTime() + (45/30)
	
end
SWEP.Primary.Attacks = {
	{
		['act'] = ACT_VM_MISSCENTER, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 24*6, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		["src"] = Vector(0, 0, 0), -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		["dir"] = Vector(-45, 0, -35), -- Trace direction/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 400, --This isn't overpowered enough, I swear!!
		["dmgtype"] = bit.bor(DMG_SLASH),  --DMG_SLASH,DMG_CRUSH, etc.
		["delay"] = 11 / 30, --Delay
		['snd_delay'] = 10 / 30,
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "Weapon_BO3_AXE.Swing", -- Sound ID
		["viewpunch"] = Angle(0, 0, 0), --viewpunch angle
		["end"] = 1.3, --time before next attack
		["hull"] = 1, --Hullsize
		['hitflesh'] = "Weapon_BO3_AXE.Hit_Flesh",
		['hitworld'] ="Weapon_BO3_AXE.Hit"
	},
	{
		['act'] = ACT_VM_HITCENTER, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 24*6, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		["src"] = Vector(0, 0, 0), -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		["dir"] = Vector(-10, 0, -50), -- Trace direction/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 400, --This isn't overpowered enough, I swear!!
		["dmgtype"] = bit.bor(DMG_SLASH),  --DMG_SLASH,DMG_CRUSH, etc.
		["delay"] = 9 / 30, --Delay
		['snd_delay'] = 8 / 30,
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "Weapon_BO3_AXE.Swing", -- Sound ID
		["viewpunch"] = Angle(0, 0, 0), --viewpunch angle
		["end"] = 1, --time before next attack
		["hull"] = 1, --Hullsize
		['hitflesh'] = "Weapon_BO3_AXE.Hit_Flesh",
		['hitworld'] ="Weapon_BO3_AXE.Hit"
	}
}

SWEP.EventTable = {
	["draw_first"] = {
		{time = 7 / 30, type = "sound", value = "Weapon_BO3_AXE.Draw"}
	}
}

SWEP.ImpactDecal = "ManhackCut"

SWEP.SequenceRateOverride = {
	[ACT_VM_MISSCENTER] = 45 / 30,
	[ACT_VM_HITCENTER] = 30 / 30
}


if CLIENT then
	SWEP.WepSelectIconCSO = Material("vgui/killicons/tfa_cso_mastercombatknife")
	SWEP.DrawWeaponSelection = TFA_CSO_DrawWeaponSelection
end
