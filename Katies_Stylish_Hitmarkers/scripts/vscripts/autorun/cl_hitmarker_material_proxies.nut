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

hitmarkerGradientPos <- 0.0

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
	hitmarkerGradientPos = 0.0
	local player = GetLocalViewPlayer()
	local weapon = player.GetActiveWeapon()

/*
	if( !("killType" in player.s ) )
		{
			 player.s.killType <- -1
		}

	if( !("hitmarkerType" in player.s ) )
		{
			 player.s.hitmarkerType <- 0
		}

	if( !("hitmarkerGradientPos" in player.s ) )
		{
			 player.s.hitmarkerGradientPos <- 0
		}
*/

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
	printt( " " )
	printt( " " )
	printt( " " )
	printt( " " )
}

function VMTCallback_HitmarkerSpring( player_but_different )
{
	//printt("penis returns, like when Moe kicks Barney out of the bar in The Simpsons and he just appears behind him")

	local player = GetLocalViewPlayer()
	local weapon = player.GetActiveWeapon()

	if( !("lastHitTime" in weapon.s ) )
		{
		   weapon.s.lastHitTime <- 0
		}
	weapon.s.lastHitTime = Time()

	local vibrate = sin( Time() )
	//local vibrate = sin( Time() * FrameTime() * 0.1 )
	local decay = ( Time() - weapon.s.lastHitTime ) * FrameTime()
	decay = GraphCapped(decay, 0.0, 144.0, 1.0, 0.0)

	printt(vibrate * decay)

	return vibrate * decay
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

main()
