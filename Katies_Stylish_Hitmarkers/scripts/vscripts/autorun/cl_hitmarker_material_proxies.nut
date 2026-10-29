function main()
{
}

function VMTCallback_HitmarkerSpring( ent )
{
	//if ( !( "createTime" in ent.s ) )
	//	return 0.0

	local vibrate = sin( Time() * 0.1 )
	//local lastFiredTime = GetLocalViewPlayer().GetLastFiredTime()

	return vibrate * 2 // * ( lastFiredTime / 60 )
}
