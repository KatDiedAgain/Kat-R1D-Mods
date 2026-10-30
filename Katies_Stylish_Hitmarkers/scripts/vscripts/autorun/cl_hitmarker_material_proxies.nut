// Hitmarker Types
//
// 0 = ineffective
// 1 = regular
// 2 = crit

hitmarkerType <- 0

// Victim Types
//
// -1 = other/uncategorized
// 0 = grunt
// 1 = spectre
// 2 = pilot
// 3 = titan
// 4 = heavy turret
// 5 = flyer
// 6 = dropship

victimType <- 0

// Is Kill?
//
// false = nope
// true = yep

isKill <- false

// Gradient Position for color
//
// 0.0 - 1.0

hitmarkerGradientPos <- 1.0

// Last Hit Time: the Time() value when the last bullet hit

lastHitTime <- 0

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function main()
{
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt("HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST HITMARKER TEST")
	printt(Time())

	AddLocalPlayerDidDamageCallback( DamageEvent )
}

function DamageEvent( attacker, params )
{
	hitmarkerGradientPos = 1.0
	lastHitTime = Time()
	local player = GetLocalViewPlayer()
	local weapon = player.GetActiveWeapon()

  if ( params.playKillSound )
	{
		isKill = true
		printt( "*********************************************************" )
		printt( "*********************************************************" )
		printt( "*********************************************************" )
		printt( "*********************************************************" )
    printt( "You killed something!" )
		printt( "*********************************************************" )
		printt( "*********************************************************" )
		printt( "*********************************************************" )
		printt( "*********************************************************" )
	}
	else
	{
		isKill = false
		printt( "*********************************************************" )
		printt( "*********************************************************" )
		printt( "*********************************************************" )
		printt( "*********************************************************" )
		printt( "You dealt damage, but didn't kill anything." )
		printt( "*********************************************************" )
		printt( "*********************************************************" )
		printt( "*********************************************************" )
		printt( "*********************************************************" )
	}

	if ( params.victim.IsSoldier() )
	{
		victimType = 0
	}
	else if ( params.victim.IsSpectre() )
	{
		victimType = 1
	}
	else if ( params.victim.IsPlayer() )
	{
		victimType = 2
	}
	else if ( params.victim.IsTitan() )
	{
		victimType = 3
	}
	else if ( params.victim.IsDropship() )
	{
		victimType = 6
	}
	else
	{
		victimType = -1
	}

	if ( params.hitIneffective )
	{
		hitmarkerType = 0
	}
	else if ( params.hitWeakpoint )
	{
		hitmarkerType = 2
	}
	else
	{
		hitmarkerType = 1
	}

	// Print details
	printt( " " )
	printt( " " )
	printt( " " )
	printt( " " )
	printt( "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>" )
	printt( "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>" )
	printt( "<><><><><><><><><><><><><><><><>   DAMAGE EVENT DETAILS   <><><><><><><><><><><><><><><><><><><>" )
	printt( "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>" )
	printt( "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>" )
	printt( " " )
	printt( "Victim Type:    ", victimType )
	printt( "Is Kill:        ", isKill )
	printt( "Hitmarker Type: ", hitmarkerType )
	printt( "Last Hit Time:  ", lastHitTime )
	printt( " " )
	printt( " " )
	printt( " " )
	printt( " " )
}

function VMTCallback_HitmarkerSpring( player_but_different )
{
	hitmarkerGradientPos -= 0.02
	local vibrate = sin( Time() * 64 ) * 0.2 + 1.2
	local decay = hitmarkerGradientPos
	decay = clamp ( decay, 0.0, 1.0 )

	local springVal = (vibrate * decay) + 1

	printt("Spring Val: ", springVal)
	printt("Decay:      ", decay)

	return springVal
}

function VMTCallback_HitmarkerColorR( player_but_different )
{
	return ChangeHitmarkerColor( 0 )
}

function VMTCallback_HitmarkerColorG( player_but_different )
{
	return ChangeHitmarkerColor( 1 )
}

function VMTCallback_HitmarkerColorB( player_but_different )
{
	return ChangeHitmarkerColor( 2 )
}

function ChangeHitmarkerColor( colIndex )
{
	local newColor = [ 1, 0.25, 0.25 ]
	hitmarkerGradientPos += FrameTime()

	if ( isKill )
	{
		//newColor = [ 2, 0.5, 0.5 ]
		newColor = [ 0.25, 0.25, 1 ]
	}
	else
	{
		newColor = [ 1, 0.25, 0.25 ]
	}

	return newColor[colIndex]
}

/*
function VMTCallback_HideStandardHitmarkerDuringCrit( player_but_different )
{
	if (hitmarkerType == 2)
	{
		return 0
	}
	else
	{
		return 1
	}
}
*/

function VMTCallback_HitmarkerFrameChange( player_but_different )
{
	if ( isKill )
	{
		return 1
	}
	else
	{
		return 0
	}
}

main()
