function main()
{
	AutoCVar( "set_reticle_offset", "1.55,1.41,1.31,1.21,1.13,1.02,0.95,0.855,0.795,0.75,0.65", "Sets the offsetValsCentered value in the material proxies nut file.", "" )
	AutoCVar( "set_reticle_offset_factor", "1.0", "Sets the reticleCenterFactor value in the material proxies nut file.", "" )
	AutoCVar( "set_default_attachment_dist", "10.0", "Affects the attachmentDistance value in the material proxies nut file.", "" )

	local weaponNames = [ "r101", "g2", "hemlok", "spitfire", "r97", "car", "wingman", "hcog", "holo", "aog" ]
	local defaultOffsetsX = [ "1.0", "0.65", "0.81", "-0.28", "0.78", "0.36", "-0.25", "0.98", "0.92", "1.03" ]
	local defaultOffsetsY = [ "1.0", "0.65", "0.81", "-0.28", "0.78", "0.36", "-0.25", "1.25", "0.92", "1.03" ]

	local defaultScales = [ "1.0", "2.0", "2.0", "1.0", "1.5", "1.0", "2.0", "1.0", "1.0", "1.0" ]

	for ( local i = 0; i < weaponNames.len(); i++ )
	{
		AutoCVar( "set_reticle_offset_multiplier_" + weaponNames[i] + "_x", defaultOffsetsX[i], "Sets the xOffsetMultiplier value in the material proxies nut file.", "" )
		AutoCVar( "set_reticle_offset_multiplier_" + weaponNames[i] + "_y", defaultOffsetsY[i], "Sets the yOffsetMultiplier value in the material proxies nut file.", "" )

		AutoCVar( "set_reticle_offset_addend_" + weaponNames[i] + "_x", "0", "Sets the xOffsetAddend value in the material proxies nut file.", "" )
		AutoCVar( "set_reticle_offset_addend_" + weaponNames[i] + "_y", "0", "Sets the yOffsetAddend value in the material proxies nut file.", "" )

		AutoCVar( "set_reticle_scale_" + weaponNames[i], defaultScales[i], "Sets the scale of the reticle.", "" )
	}
}

main()
