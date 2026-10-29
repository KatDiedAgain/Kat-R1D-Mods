function main()
{
}

function VMTCallback_HitmarkerSpring( ent )
{
	local player = GetLocalViewPlayer()
	local weapon = player.GetActiveWeapon()

	if( !("lastHitTime" in weapon.s ) )
		{
		   weapon.s.lastHitTime <- 0
		}
	weapon.s.lastHitTime = Time()

	//AddLocalPlayerDidDamageCallback

	local vibrate = sin( Time() * 0.1 )
	//local lastFiredTime = GetLocalViewPlayer().GetLastFiredTime()

  printt("penis returns")

	return vibrate * 2 // * ( lastFiredTime / 60 )
}

function HitmarkerSpring()
{
	local vibrate = sin( Time() * 0.1 )

  printt("penis returns")

	return vibrate * 2
}
