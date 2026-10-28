
function VMTCallback_ExampleEntityScriptProxy( ent )
{
	return 0.0
}

function VMTCallback_ExampleScriptModifyProxy( player )
{
	return 0.0
}

function VMTCallback_ArcCannonCrosshair( player )
{
	local weapon = player.GetActiveWeapon()
	if ( IsValid( weapon ) )
	{
		local charge = clamp ( weapon.GetWeaponChargeFraction() * ( 1 / GetArcCannonChargeFraction( weapon ) ), 0.0, 1.0 )
		local numOfFrames = 30 // 0 - N notation
		local frame = (numOfFrames * charge).tointeger()

		return frame
	}
	return 0
}

function VMTCallback_DefenderCrosshair( player )
{
	local weapon = player.GetActiveWeapon()
	local charge = weapon.GetWeaponChargeFraction()
	local numOfFrames = 30 // 0 - N notation
	local frame = (numOfFrames * charge).tointeger()

	return frame
}

function VMTCallback_TitanShotgunCrosshair( player )
{
	local weapon = player.GetActiveWeapon()
	local currentAmmo = player.GetActiveWeaponPrimaryAmmoLoaded()
	local numOfFrames = player.GetWeaponAmmoMaxLoaded( weapon ) // max clip ammo (9 normal, 12 extended)
	local frame

	Assert( currentAmmo <= numOfFrames )

	if ( currentAmmo > numOfFrames )
		return 1

	if ( currentAmmo == 0 )
		frame = 0
	else
		frame = ( ( numOfFrames + 1 ) - currentAmmo )

	return frame
}

function VMTCallback_ArcCannonChargeAmount( player )
{
	local weapon = player.GetActiveWeapon()
	local charge = 0
	if ( IsValid( weapon ) && weapon.GetClassname() == "mp_titanweapon_arc_cannon" )
	{
		charge = clamp ( weapon.GetWeaponChargeFraction() * ( 1 / GetArcCannonChargeFraction( weapon ) ), 0.0, 1.0 )
	}
	return charge
}

function VMTCallback_TitanSniperCrosshair( player )
{
	local weapon = player.GetActiveWeapon()
	if ( !IsValid( weapon ) )
		return 0

	//return 0
	return weapon.GetScriptScope().GetTitanSniperChargeLevel( weapon )
}

const XRAY_PULSE_DURATION = 2.0

function VMTCallback_MPEntitySonarFrac( entity )
{
	if ( !( "createTime" in entity.s ) )
		return 0.0

	return GraphCapped( Time() - entity.s.createTime, 0, entity.s.pulseDuration, entity.s.maxFrac, 0.0 )
}

// Use ClipAmmoColor Proxy
// function VMTCallback_ClipAmmoColor( player )
// {
// 	if ( !player.GetActiveWeapon() )
// 		return Vector( 1, 1, 1 )
//
// 	local clipAmmo = player.GetActiveWeaponPrimaryAmmoLoaded()
// 	local maxClipAmmo = player.GetActiveWeaponPrimaryAmmoMaxLoaded()
//
// 	if ( clipAmmo <= maxClipAmmo * 0.1 )
// 	{
// 		return Vector( 255, 75, 66 ) * (1.0 / 255.0)
// 	}
// 	else if ( clipAmmo < maxClipAmmo * 0.4 )
// 	{
// 		return Vector( 255, 128, 64 ) * (1.0 / 255.0)
// 	}
// 	else
// 	{
// 		return Vector( 133, 231, 255 ) * (1.0 / 255.0)
// 	}
// }

// Use BackgroundAmmoColor Proxy
// function VMTCallback_BackgroundAmmoColor( player )
// {
// 	if ( !player.GetActiveWeapon() )
// 	{
// 		return Vector( 1, 1, 1 )
// 	}
//
//
// 	local clipAmmo = player.GetActiveWeaponPrimaryAmmoLoaded()
// 	local maxClipAmmo = player.GetActiveWeaponPrimaryAmmoMaxLoaded()
//
// 	if ( clipAmmo <= maxClipAmmo * 0.1 )
// 	{
// 		return Vector( 255, 175, 166 ) * (1.0 / 255.0)
// 	}
// 	else
// 	{
// 		return Vector( 255, 255, 255 ) * (1.0 / 255.0)
// 	}
// }

// Use RemainingAmmoColor instead
// function VMTCallback_RemainingAmmoColor( player )
// {
// 	if ( !player.GetActiveWeapon() )
// 		return Vector( 1, 1, 1 )
//
// 	local remainingAmmo = player.GetActiveWeaponPrimaryAmmoTotal()
// 	local maxClipAmmo = player.GetActiveWeaponPrimaryAmmoMaxLoaded()
//
// 	if ( remainingAmmo <= maxClipAmmo * 1 )
// 	{
// 		return Vector( 255, 75, 66 ) * (1.0 / 255.0)
// 	}
// 	else if ( remainingAmmo <= maxClipAmmo * 3 )
// 	{
// 		return Vector( 255, 128, 64 ) * (1.0 / 255.0)
// 	}
// 	else
// 	{
// 		return Vector( 133, 231, 255 ) * (1.0 / 255.0)
// 	}
// }

// Use HoloSight
// function VMTCallback_HoloSight( entity )
// {
// 	return GetLocalViewPlayer().GetAdsFraction()
// }

function VMTCallback_HoloSightOffset_Common( entity, attachment = "HOLO_REAR", hOffsetMultiplier = 3.65, vOffsetMultiplier = 3.65 )
{
	local holoRearOrg = entity.GetAttachmentOrigin( entity.LookupAttachment( attachment ) )
	local holoRearAng = entity.GetAttachmentAngles( entity.LookupAttachment( attachment ) )
	local camOrg = GetLocalViewPlayer().CameraPosition()
	//local camAng = GetLocalViewPlayer().CameraAngles()

	local gunVec = holoRearAng.AnglesToForward()
	local upVec = holoRearAng.AnglesToUp()
	local rightVec = holoRearAng.AnglesToRight()

	local camVec = (holoRearOrg - camOrg)

	local hOffset = camVec.Dot( rightVec ) * hOffsetMultiplier
	local vOffset = camVec.Dot( upVec ) * vOffsetMultiplier

	return Vector( hOffset, vOffset, 0.0 )
}

function VMTCallback_HoloSightOffset_RSPN101_Front( ent )
{
	/*
	local tagOrg = ent.GetAttachmentOrigin( ent.LookupAttachment( "HOLO_FRONT" ) )
	printt( "Front", tagOrg )

	local tagOrg = ent.GetAttachmentOrigin( ent.LookupAttachment( "HOLO_REAR" ) )
	printt( "Rear", tagOrg )

	local tagOrg = ent.GetAttachmentOrigin( ent.LookupAttachment( "CAMERA_BASE" ) )
	printt( "Cam", tagOrg )

	local camOrg = GetLocalViewPlayer().CameraPosition()
	printt( "Real Cam", camOrg )
	*/

	local attachment 			= "HOLO_REAR"
	local hOffsetMultiplier 	= 0.6 // Default: 0.6
	local vOffsetMultiplier		= -0.75 // Default: -0.75

	local ret = VMTCallback_HoloSightOffset_Common( ent, attachment, hOffsetMultiplier, vOffsetMultiplier )
	return ret
}

function VMTCallback_HoloSightOffset_RSPN101_Rear( ent )
{
	local attachment 			= "HOLO_REAR"
	local hOffsetMultiplier 	= 0.5 // Default: 0.5
	local vOffsetMultiplier		= -0.65 // Default: -0.65

	local ret = VMTCallback_HoloSightOffset_Common( ent, attachment, hOffsetMultiplier, vOffsetMultiplier )
	return ret
}

function VMTCallback_VduStaticAlpha( ent )
{
	if ( level.vduCustomStatic != null )
	{
		switch ( level.vduCustomStatic )
		{
			case STATIC_RANDOM:
				local rnd = RandomFloat( 0, 4.64 )
				rnd = ( ( rnd * rnd * rnd ) / 20 ).tointeger()
				return level.vduStatic + GraphCapped( rnd, 0, 4, 0, 0.06 )

			case STATIC_LIGHT:
				local val1 = sin( Time() * 1.5 )
				local val2 = sin( Time() * 4.5 )
				local val = val1 * val2

				val *= 0.04
				local base = RandomFloat( 0.01, 0.04 )
				if ( val > 0 )
					return base + val
				else
					return base

			case STATIC_HEAVY:
				local val1 = sin( Time() * 4.5 )
				local val2 = sin( Time() * 7.5 )
				local val = val1 * val2

				val *= 0.15
				local base = RandomFloat( 0.03, 0.1 )
				if ( val > 0 )
					return base + val
				else
					return base
		}
	}

	return level.vduStatic
}

function VMTCallback_GetCloakFactor( ent )
{
	local cloakiness = ent.GetCloakFadeFactor();

	// Adjust cloakiness based on movement?
	// ...

	// Output:  Remap fade amount into our base->overpower range.
	local base = 0.2
	local cloakAmount = cloakiness * ( 1.0 - base ) + base;
	return cloakAmount;
}

function VMTCallback_TeamColor( ent )
{
	if ( ShouldPreventFriendlyFire( ent, GetLocalViewPlayer() ) )
		return Vector( 0, 0, 1 )
	else
		return Vector( 1, 0, 0 )
}


function VMTCallback_TitanDamageColor( ent )
{
	/*
	// Relative
	if ( ent.GetTeam() == GetLocalViewPlayer().GetTeam() )
		return Vector( 0, 0, 1 )
	else
		return Vector( 1, 0, 0 )
	*/

	// Absolute
	if ( ent.GetTeam() == TEAM_IMC )
		return Vector( 105.0 / 255.0, 146.0 / 255.0, 1.0 )
	else
		return Vector( 1.0, 134.0 / 255.0, 92.0 / 255.0 )
}

function VMTCallback_MPEntityARAlpha( ent )
{
	if ( !ShouldShowWeakpoints( ent ) )
		return 0.0

	//return 0.75 + flashVal
	return 1.0
}

function VMTCallback_MPEntityARColor( ent )
{
	if ( !ShouldShowWeakpoints( ent ) )
		return Vector( 0.0, 0.0, 0.0 )

	return Vector( 1.0, 1.0, 1.0 )
}


function ShouldShowWeakpoints( ent )
{
	local player = GetLocalViewPlayer()

	if ( !IsAlive( ent ) )
		return false

	if ( !IsValid( player ) )
		return false

	if ( !ent.IsNPC() && !ent.IsPlayer() )
	{
		if ( ( "showWeakpoints" in ent.s ) && ent.s.showWeakpoints )
			return true
		else
			return false
	}

	if ( ShouldPreventFriendlyFire( ent, player ) )
		return false

	local soul = ent.GetTitanSoul()
	if ( IsValid( soul ) )
	{
		if ( soul.GetShieldHealth() )
			return false

		if ( soul.GetInvalidHealthBarEnt() )
			return false
	}

	//Turn off AR if you are rodeoing
	if ( ent == GetTitanBeingRodeoed( player ) )
		return false

	//if ( ent.IsTitan() && ent.GetDoomedState() )
	//	return false

	if ( !WeaponCanCrit( player.GetActiveWeapon() ) )
		return false

	if ( GetHealthBarTargetEntity( player ) )
	{
		return ent == GetHealthBarTargetEntity( player )
	}
	else
	{
		local eyePos = player.EyePosition()
		eyePos.z = 0

		local entPos = ent.GetWorldSpaceCenter()
		entPos.z = 0

		local eyeVec = player.GetViewVector()
		eyeVec.z = 0
		eyeVec.Normalize()

		local dirToEnt = (entPos - eyePos)
		dirToEnt.Normalize()

		if ( dirToEnt.Dot( eyeVec ) < 0.996 )
			return false
	}

	return true
}


function VMTCallback_RBCooldown( player )
{
	local weapon = player.GetOffhandWeapon( 0 )
	if ( !IsValid( weapon ) )
		return 0

	local cooldownFrac = 1.0

	if ( "CooldownBarFracFunc" in weapon.GetScriptScope() )
		cooldownFrac = weapon.GetScriptScope().CooldownBarFracFunc()

	Assert( cooldownFrac >= 0 && cooldownFrac <= 1.0 )

	return (cooldownFrac * 60).tointeger()
}


function VMTCallback_LBCooldown( player )
{
	local weapon = player.GetOffhandWeapon( 1 )
	if ( !IsValid( weapon ) )
		return 0

	local cooldownFrac = 1.0

	if ( "CooldownBarFracFunc" in weapon.GetScriptScope() )
		cooldownFrac = weapon.GetScriptScope().CooldownBarFracFunc()

	Assert( cooldownFrac >= 0 && cooldownFrac <= 1.0 )

	return (cooldownFrac * 60).tointeger()
}

::g_frac <- 0.0

// 2.5 = lots
// 0.8 = none

function VMTCallback_DamageFlash( player )
{
	//local damageTimeDelta = Time() - GetLastDamageTime( player )

	//local frac = 0

	local frac = GetHealthFrac( player )

	//const DAMAGE_OUT_TIME = 0.5
	frac = GraphCapped( frac, 0.0, 0.75, 2.5, 0.8 )
	return Vector( frac, frac, 0.0 )
}

function VMTCallback_CompassTickerOffset( player )
{
	local playerYaw = player.CameraAngles().y

	playerYaw /= 360

	return Vector( -playerYaw, 0.0, 0.0 )
}

function VMTCallback_CompassTickerScale( player )
{
	return Vector( 0.225, 0.95, 1.0 )
}

const DAMAGEHUD_ARROW_FADE_TIME = 0.25

function VMTCallback_DamageArrowAlpha( entity )
{
	return GraphCapped( entity.s.arrowData.endTime - Time(), 0.0, DAMAGEHUD_ARROW_FADE_TIME, 0.0, 1.0 )
}


function VMTCallback_DamageArrowDepthAlpha( entity )
{
	return (entity.s.arrowData.endTime - Time()) > DAMAGEHUD_ARROW_FADE_TIME ? 1.0 : 0.0
}


function VMTCallback_DamageArrowFlash( entity )
{
	local flashVal
	if ( Time() - entity.s.arrowData.startTime < 0.15 )
		flashVal = 0.0
	else
		flashVal = GraphCapped( Time() - entity.s.arrowData.startTime, 0.15, 0.65, 2.0, 0.0 )

	return Vector( 1.0, flashVal, flashVal )
}

///////////////////////////////////////////////////////////////////////////////////////////////////////

const MAX_PROSCREEN_VALUE = 999999
function VMTCallback_ProScreen( entity )
{
	return GetProScreenStats()
}

function VMTCallback_GruntProScreen( entity )
{
	return GetProScreenStats( false, true )
}

function VMTCallback_AllProScreen( entity )
{
	return GetProScreenStats( true, true )
}

function VMTCallback_HasMaxedProScreen( entity )
{
	local kills = GetProScreenStats()

	if ( kills >= MAX_PROSCREEN_VALUE )
		return 1

	return 0
}

function GetProScreenStats( pilots = true, grunts = false )
{
	local kills = 0

	local player = GetLocalViewPlayer()
 	if ( !IsValid( player ) )
 		return kills

	local weapon = player.GetActiveWeapon()
 	if ( !IsValid( weapon ) )
 		return kills

	local weaponName = weapon.GetWeaponClassName()
	if ( !ItemDefined( weaponName ) )
		return kills

	if ( pilots )
	{
		kills += StatToInt( "weapon_kill_stats", "pilots", weaponName, player )
		kills += StatToInt( "weapon_kill_stats", "titansTotal", weaponName, player )
	}

	if ( grunts )
	{
 		kills += StatToInt( "weapon_kill_stats", "grunts", weaponName, player )
		kills += StatToInt( "weapon_kill_stats", "spectres", weaponName, player )
		kills += StatToInt( "weapon_kill_stats", "marvins", weaponName, player )
	}

	if ( kills >= MAX_PROSCREEN_VALUE )
		return MAX_PROSCREEN_VALUE

	return kills
}

/*
*********************************************************************************************************************************************************************************************
///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET
*********************************************************************************************************************************************************************************************
///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET
*********************************************************************************************************************************************************************************************
*********************************************************************************************************************************************************************************************
///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET
*********************************************************************************************************************************************************************************************
///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET
*********************************************************************************************************************************************************************************************
*********************************************************************************************************************************************************************************************
///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET
*********************************************************************************************************************************************************************************************
///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET ///// BEGIN OFFSET
*********************************************************************************************************************************************************************************************
I keep missing the beginning and end of this segment and it's making me feel like I can't see. It's like trying to see in a dream
*/

// https://thunderstore.io/c/northstar/p/Creamy_jpg/Customisable_Reticles_Framework/

// cl_fovscale values
const FOV_70 = 1.0
const FOV_76 = 1.0825
const FOV_80 = 1.1375
const FOV_86 = 1.22
const FOV_90 = 1.275
const FOV_96 = 1.3575
const FOV_100 = 1.4125
const FOV_106 = 1.495
const FOV_110 = 1.55
const FOV_115 = 1.6
const FOV_120 = 1.7

// use VMTCallback_FOVReticleOffsetKatie instead
// Lol special thanks to Nacho for helping me out! Without her, this would have taken a LOT fuckin longer.
/*
function VMTCallback_FOVReticleOffset( ent )
{
	local fov = GetConVarFloat( "cl_fovScale" )
	local offset = 1.0

	local fovVals = [ FOV_70, FOV_76, FOV_80, FOV_86, FOV_90, FOV_96, FOV_100, FOV_106, FOV_110, FOV_115, FOV_120 ]
	local offsetValsVanilla = [ 1.0, 1.0825, 1.375, 1.22, 1.275, 1.375, 1.4125, 1.495, 1.55, 1.6, 1.7 ]

	local offsetValsCentered = [
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[0].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[1].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[2].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[3].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[4].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[5].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[6].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[7].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[8].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[9].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[10].tofloat()
		]

	local offsetVals = [
		((offsetValsVanilla[0] * (1.0 - reticleCenterFactor)) + (offsetValsCentered[0] * reticleCenterFactor)),
		((offsetValsVanilla[1] * (1.0 - reticleCenterFactor)) + (offsetValsCentered[1] * reticleCenterFactor)),
		((offsetValsVanilla[2] * (1.0 - reticleCenterFactor)) + (offsetValsCentered[2] * reticleCenterFactor)),
		((offsetValsVanilla[3] * (1.0 - reticleCenterFactor)) + (offsetValsCentered[3] * reticleCenterFactor)),
		((offsetValsVanilla[4] * (1.0 - reticleCenterFactor)) + (offsetValsCentered[4] * reticleCenterFactor)),
		((offsetValsVanilla[5] * (1.0 - reticleCenterFactor)) + (offsetValsCentered[5] * reticleCenterFactor)),
		((offsetValsVanilla[6] * (1.0 - reticleCenterFactor)) + (offsetValsCentered[6] * reticleCenterFactor)),
		((offsetValsVanilla[7] * (1.0 - reticleCenterFactor)) + (offsetValsCentered[7] * reticleCenterFactor)),
		((offsetValsVanilla[8] * (1.0 - reticleCenterFactor)) + (offsetValsCentered[8] * reticleCenterFactor)),
		((offsetValsVanilla[9] * (1.0 - reticleCenterFactor)) + (offsetValsCentered[9] * reticleCenterFactor)),
		((offsetValsVanilla[10] * (1.0 - reticleCenterFactor)) + (offsetValsCentered[10] * reticleCenterFactor))
	]

	for ( local i = 0; i < 11; i++ )
	{
		//offset = GraphCapped( fov, fovVals[i], fovVals[i + 1], offsetVals[i], offsetVals[i + 1] )

		if ( fov == fovVals[i] ) {
			offset = offsetVals[i]
			break
		} else if ( fov > fovVals[i] && fov < fovVals[i + 1] ) {
			local trange = fovVals[i + 1] - fovVals[i]
			local tratio = ( fov - fovVals[i] )
			local trelative = ( tratio / trange )
			offset = (offsetVals[i] * (1.0 - trelative)) + (offsetVals[i + 1] * trelative)
		} else {
			continue
		}
	}

	return offset
}
*/

function VMTCallback_FOVReticleOffsetX( ent )
{
	return FOVReticleOffsetKatie( ent, true )
}

function VMTCallback_FOVReticleOffsetY( ent )
{
	return FOVReticleOffsetKatie( ent, false )
}

function FOVReticleOffsetKatie( ent, isX )
{
	local player = GetLocalViewPlayer()

	if ( !player )
		{
		return 0
		}

	local fov = GetConVarFloat( "cl_fovScale" )
	local offset = 1.0

	// Default to the iron sights value
	// Pistols dont use the iron_sights attachment so we cant rely on that
	local optic = ""
	local weapon = player.GetActiveWeapon()

	if ( weapon )
	{
		if ( IsBodyGroupSet( weapon, "sight_hcog" ) )
		{
		optic = "hcog"
		}
		else if ( IsBodyGroupSet( weapon, "sight_holo" ) )
		{
		optic = "holo"
		}
		else if ( IsBodyGroupSet( weapon, "sight_aog04" ) )
		{
		optic = "aog"
		}
		else
		{
			// Remove mp_weapon_ from the classname
			optic = weapon.GetClassname().slice( 10, weapon.GetClassname().len() )
		}
	}

	local axialOffsetMultiplier = 1.0

	local convarName = format( "autocvar_set_reticle_offset_multiplier_%s_%s", optic, isX ? "x" : "y" )
	if ( ConVarExists( convarName ) )
	{
		axialOffsetMultiplier = GetConVarFloat( convarName )
	}

	local fovVals = [ FOV_70, FOV_76, FOV_80, FOV_86, FOV_90, FOV_96, FOV_100, FOV_106, FOV_110, FOV_115, FOV_120 ]

	local offsetVals = [
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[0].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[1].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[2].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[3].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[4].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[5].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[6].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[7].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[8].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[9].tofloat(),
		split(GetConVarString( "autocvar_set_reticle_offset" ),",")[10].tofloat()
		]

	for ( local i = 0; i < 11; i++ )
	{
		if ( fov == fovVals[i] ) {
			offset = offsetVals[i]
			break
		} else if ( fov > fovVals[i] && fov < fovVals[i + 1] ) {
			local trange = fovVals[i + 1] - fovVals[i]
			local tratio = ( fov - fovVals[i] )
			local trelative = ( tratio / trange )
			offset = (offsetVals[i] * (1.0 - trelative)) + (offsetVals[i + 1] * trelative)
		} else {
			continue
		}
	}

	if ( GetConVarFloat( "autocvar_disable_transitional_multiplier" ) == 1 )
	{
		return (offset * axialOffsetMultiplier) * GetConVarFloat( "autocvar_set_reticle_offset_amount" )
	}
	else
	{
		return (offset * axialOffsetMultiplier) * GetConVarFloat( "autocvar_set_reticle_offset_amount" ) + ( ( ( player.GetAdsFraction() * -1 ) + 1 ) * 1.5 )
	}
}

/*
******************************************************************************************************************************************************************************************
///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET
******************************************************************************************************************************************************************************************
///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET
******************************************************************************************************************************************************************************************
******************************************************************************************************************************************************************************************
///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET
******************************************************************************************************************************************************************************************
///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET
******************************************************************************************************************************************************************************************
******************************************************************************************************************************************************************************************
///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET
******************************************************************************************************************************************************************************************
///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET ///// END OFFSET
******************************************************************************************************************************************************************************************
I keep missing the beginning and end of this segment and it's making me feel like I can't see. It's like trying to see in a dream
*/

// Time for scale!! Hope this works!

function VMTCallback_ReticleScale( ent )
{
	local reticleScale = 1.0
	local player = GetLocalViewPlayer()

	local fovScale = GetConVarFloat( "cl_fovScale" )
	local baseFov = fovScale * 70
	local actualFov = player.GetFOV()
	local baseViewmodelFov = player.GetPlayerSettingsField( "viewmodelfov" )

	if ( !player )
		{
		return reticleScale
		}

	// The following three values depend on the default attachment distance being 13.5
	local attachmentDistDifferenceHCOG = GetConVarFloat( "autocvar_set_att_diff_hcog" ) // 3
	local attachmentDistDifferenceHOLO = GetConVarFloat( "autocvar_set_att_diff_holo" ) // 4
	local attachmentDistDifferenceAOG = GetConVarFloat( "autocvar_set_att_diff_aog" ) // 4

	local attachmentDistDifference = 0.0
	local reticleTypeScale = 1.0

	local optic = "autocvar_set_reticle_scale_r101"
	local weapon = player.GetActiveWeapon()

	if ( weapon )
	{
		if ( IsBodyGroupSet( weapon, "sight_hcog" ) )
		{
		optic = "autocvar_set_reticle_scale_hcog"
		attachmentDistDifference = attachmentDistDifferenceHCOG
			if ( GetConVarFloat( "autocvar_disable_collimation" ) == 1 ) {
				reticleTypeScale = GetConVarFloat( "autocvar_set_irons_reticle_scale" )
			} else {
				reticleTypeScale = GetConVarFloat( "autocvar_set_optic_reticle_scale" )
			}
		}
		else if ( IsBodyGroupSet( weapon, "sight_holo" ) )
		{
		optic = "autocvar_set_reticle_scale_holo"
		attachmentDistDifference = attachmentDistDifferenceHOLO
			if ( GetConVarFloat( "autocvar_disable_collimation" ) == 1 ) {
				reticleTypeScale = GetConVarFloat( "autocvar_set_irons_reticle_scale" )
			} else {
				reticleTypeScale = GetConVarFloat( "autocvar_set_optic_reticle_scale" )
			}
		}
		else if ( IsBodyGroupSet( weapon, "sight_aog04" ) )
		{
		optic = "autocvar_set_reticle_scale_aog"
		attachmentDistDifference = attachmentDistDifferenceAOG
			if ( GetConVarFloat( "autocvar_disable_collimation" ) == 1 ) {
				reticleTypeScale = GetConVarFloat( "autocvar_set_irons_reticle_scale" )
			} else {
				reticleTypeScale = GetConVarFloat( "autocvar_set_optic_reticle_scale" )
			}
		}
		else
		{
			// Remove mp_weapon_ from the classname
			local convarName = "autocvar_set_reticle_scale_" + weapon.GetClassname().slice( 10, weapon.GetClassname().len() )
			if ( ConVarExists( convarName ) )
				optic = convarName
				if ( GetConVarFloat( "autocvar_disable_collimation" ) == 1 ) {
					reticleTypeScale = GetConVarFloat( "autocvar_set_optic_reticle_scale" ) // They need to be SWAPPED! For some reason! Haven't figured that out yet. If I don't do this, the irons get really small with collimation disabled
				} else {
					reticleTypeScale = GetConVarFloat( "autocvar_set_irons_reticle_scale" )
				}
		}
	}

	local opticZoomFovScaled = GetWeaponInfoFileKeyField_WithMods_Global( weapon.GetClassname(), weapon.GetMods(), "zoom_fov" ) * fovScale

	local attachment = GetHoloOffsetAttachment( weapon )
	local attachID = ent.LookupAttachment( attachment )
	if ( attachID <= 0 )
		return reticleScale

	local holoRearOrg = ent.GetAttachmentOrigin( attachID )
	local camOrg = GetLocalViewPlayer().CameraPosition()

	local camHoloVec = camOrg - holoRearOrg
	local attachmentDistance = camHoloVec.Length() - attachmentDistDifference // Distance changes per optic. So.

	if ( GetConVarFloat( "autocvar_disable_collimation" ) == 1 )
	{
		reticleScale = GetConVarFloat( "autocvar_set_global_reticle_scale" ) * reticleTypeScale * GetConVarFloat( optic ) // Not using reticleTypeScale because we're not changing the optics separate from this
	}
	else
	{
		// Here's how it works. This is for Katie to review when she comes back to this a year later wanting to work with the mod again, but forgot everything about it.
		//
		// Reticle scale is initially set to 1.0 (or whatever the global scale value is).
		// It is then multiplied by GetConVarFloat( optic ) * ( baseFov / actualFov ).
		// This is the current optic's personal scale value multiplied by the fraction of how zoomed in you are. Specifically, this uses the exact FOV values so we always get the actual visual data instead of some proxy or other variable down the line that could be affected by other things.
		// For instance, if you're not zoomed at all and your base FOV setting in degrees is 112, it means 112/112, which solves to 1. Thus, reticle scale = optic's personal scale.
		// But, if you're in the middle of zooming in, and it means 112/98, this solves to ~1.143, which would mean the reticle shrinks a bit (scales are inverted!) to compensate for the optic being zoomed in on.
		// Next, we multiply all this by ( opticZoomFovScaled / baseFov ), which gets the current optic's zoom level and generates a scale value based on what size it WILL be when zoomed in fully.
		// That means it stays the same size as it would be when zoomed in, even when you're zoomed out.
		// This sells the collimation effect, as holographic reticles are typically 200m away, and being that far means they don't grow or shrink much in your vision pretty much ever. Do mountains grow in your vision when you get 1 foot closer? Nope.
		// Last but not least is ( GetConVarFloat( "autocvar_set_default_attachment_dist" ) / attachmentDistance ).
		// This part takes the calculated distance between the optic and the camera, then compares it to a default distance. When the optic is closer than that distance, we shrink the reticle a bit to compensate, and vice versa.
		// The reason we do this is that the reticle is stuck to the mesh. This technique Respawn used only moves it around on the surface in order to *fake* a parallax effect.
		// Because the reticle is actually just as close to the cam as the optic model is, recoil makes the reticle bounce between big and small as it's moved closer and farther from the camera.
		// As stated before with the mountain analogy, real life optics don't suffer from this. So, this math counteracts it.
		// Good luck working with this in the future. <3

		reticleScale = GetConVarFloat( "autocvar_set_global_reticle_scale" ) * reticleTypeScale * ( GetConVarFloat( optic ) * ( baseFov / actualFov ) ) * ( opticZoomFovScaled / baseFov ) * ( GetConVarFloat( "autocvar_set_default_attachment_dist" ) / attachmentDistance )
	}

	return reticleScale
}

// END SCALE // END SCALE // END SCALE // END SCALE // END SCALE // END SCALE // END SCALE // END SCALE // END SCALE // END SCALE // END SCALE // END SCALE // END SCALE // END SCALE // END SCALE // END SCALE

function VMTCallback_ReticleZeroX( ent )
{
	printt( "penis1" )
	return CalculateAxialZero( ent, "x" )
}

function VMTCallback_ReticleZeroY( ent )
{
	printt( "penis2" )
	return CalculateAxialZero( ent, "y" )
}

function CalculateAxialZero( ent, axisString )
{
	local zeroing = 0

	local player = GetLocalViewPlayer()

	if ( !player )
		{
		return zeroing
		}

	local axisvar = "autocvar_set_reticle_zero_r101_" + axisString
	local weapon = player.GetActiveWeapon()

	if ( weapon )
	{
		if ( IsBodyGroupSet( weapon, "sight_hcog" ) )
		{
		axisvar = "autocvar_set_reticle_zero_hcog_" + axisString
		}
		else if ( IsBodyGroupSet( weapon, "sight_holo" ) )
		{
		axisvar = "autocvar_set_reticle_zero_holo_" + axisString
		}
		else if ( IsBodyGroupSet( weapon, "sight_aog04" ) )
		{
		axisvar = "autocvar_set_reticle_zero_aog_" + axisString
		}
		else
		{
			// Remove mp_weapon_ from the classname
			local convarName = "autocvar_set_reticle_zero_" + weapon.GetClassname().slice( 10, weapon.GetClassname().len() ) + "_" + axisString
			if ( ConVarExists( convarName ) )
				axisvar = convarName
		}
	}

	zeroing = GetConVarFloat( axisvar ) + GetConVarFloat( "autocvar_set_global_reticle_zero_" + axisString )

	printt( "penis" )

	return zeroing
}

// END ZEROING // END ZEROING // END ZEROING // END ZEROING // END ZEROING // END ZEROING // END ZEROING // END ZEROING // END ZEROING // END ZEROING // END ZEROING // END ZEROING // END ZEROING // END ZEROING // END ZEROING

function VMTCallback_HasSightEquipped( ent )
{
	local player = GetLocalViewPlayer()
	if ( !player )
		return 0.0

	local weapon = player.GetActiveWeapon()
	if ( !weapon )
		return 0.0

	if ( IsBodyGroupSet( weapon, "sight_hcog" ) || IsBodyGroupSet( weapon, "sight_holo" ) || IsBodyGroupSet( weapon, "sight_aog04" ) )
		return 0.0

	return player.GetAdsFraction()
}

function GetHoloOffsetAttachment( weapon )
{
	local attachment = "IRON_SIGHT"
	if ( IsBodyGroupSet( weapon, "sight_hcog" ) )
	{
		attachment = "HCOG_FRONT"
	}
	else if ( IsBodyGroupSet( weapon, "sight_holo" ) )
	{
		attachment = "HOLO_FRONT"
	}
	else if ( IsBodyGroupSet( weapon, "sight_aog04" ) )
	{
		attachment = "AOG_FRONT"
	}

	return attachment
}

function IsBodyGroupSet( ent, bodygroup )
{
	local index = ent.FindBodyGroup( bodygroup )
	if ( index == -1 )
		return false

	return ent.GetBodyGroupState( index ) == 1
}


function VMTCallback_ColorBlindRed( ent )
{
	local col = GetColorBlindColors()

	return col.Red
}

function VMTCallback_ColorBlindBlue( ent )
{
	local col = GetColorBlindColors()

	return col.Blue
}

function VMTCallback_ColorBlindYellow( ent )
{
	local col = GetColorBlindColors()

	return col.Yellow
}

function GetColorBlindColors()
{
	colorInfo <- {}
	colorInfo.Red <- Vector( 0, 0, 0 )
	colorInfo.Blue <- Vector( 0, 0, 0 )
	colorInfo.Yellow <- Vector( 0, 0, 0 )

	if ( !GetConVarBool( "delta_improved_colorblind" ) )
		return colorInfo

	local colorblind = GetConVarInt( "colorblind_mode" )
	switch( colorblind )
	{
		// Deuteranopia
		case 1:
			colorInfo.Red = Vector( 4.45, 3.9, 0 )
			colorInfo.Blue = Vector( 0.247, 0.501, 0.965 ) * 5
			colorInfo.Yellow = Vector( 0, 0, 0 ) // TODO
			break

		// Tritanopia
		case 2:
			colorInfo.Red = Vector( 4, 2.51, 2.72 )
			colorInfo.Blue = Vector( 0.1, 5.8, 7.7 )
			colorInfo.Yellow = Vector( 0, 0, 0 )
			break

		// Protanopia
		case 3:
			colorInfo.Red = Vector( 4.1, 3.7, 0.3 )
			colorInfo.Blue = Vector( 2.8, 5.2, 9.7 )
			colorInfo.Yellow = Vector( 0, 0, 0 )
			break
	}

	return colorInfo
}
