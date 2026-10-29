function main()
{
	AddLocalPlayerDidDamageCallback( KillMarker )
}

function KillMarker( attacker, params )
{
  if ( params.playKillSound )
    printt( "waow" )
}

function VMTCallback_HitmarkerSpring( ent )
{
	printt("penis returns, like when Moe kicks Barney out of the bar in The Simpsons and he just appears behind him")

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

	return vibrate
}

main()
