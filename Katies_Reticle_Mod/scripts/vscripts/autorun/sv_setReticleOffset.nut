function main()
{
	AutoCVar( "set_reticle_offset", "1.55,1.41,1.31,1.21,1.13,1.02,0.95,0.855,0.795,0.75,0.65", "Sets the offsetValsCentered value in the material proxies nut file.", "" ) //1.5 for first value obv
	AutoCVar( "set_reticle_offset_factor", "1.0", "Sets the reticleCenterFactor value in the material proxies nut file.", "" )
	AutoCVar( "set_default_attachment_dist", "12.0", "Affects the attachmentDistance value in the material proxies nut file.", "" )

	// These return an array that contains each value for each of the three optics.
	// Format:
	// [R101_IRONS,G2_IRONS,HEMLOK_IRONS,LMG_IRONS,R97_IRONS,CAR_IRONS,HCOG,HOLOSIGHT,AOG]

	local weaponNames = [ "r101", "g2", "hemlok", "spitfire", "r97", "car", "wingman", "hcog", "holo", "aog" ]
	local defaultOffsetsX = [ "1.0", "0.65", "0.81", "-0.28", "0.78", "0.36", "-0.25", "0.98", "0.92", "1.03" ]
	local defaultOffsetsY = [ "1.0", "0.65", "0.81", "-0.28", "0.78", "0.36", "-0.25", "1.25", "0.92", "1.03" ]

	local smallDefaultReticles = [ "g2", "hemlok", "wingman" ]

	for ( local i = 0; i < weaponNames.len(); i++ )
	{
		AutoCVar( "set_reticle_offset_multiplier_" + weaponNames[i] + "_x", defaultOffsetsX[i], "Sets the xOffsetMultiplier value in the material proxies nut file.", "" )
		AutoCVar( "set_reticle_offset_multiplier_" + weaponNames[i] + "_y", defaultOffsetsY[i], "Sets the yOffsetMultiplier value in the material proxies nut file.", "" )

		AutoCVar( "set_reticle_offset_addend_" + weaponNames[i] + "_x", "0", "Sets the xOffsetAddend value in the material proxies nut file.", "" )
		AutoCVar( "set_reticle_offset_addend_" + weaponNames[i] + "_y", "0", "Sets the yOffsetAddend value in the material proxies nut file.", "" )

		local defaultScale = "1.0"
		foreach( name in smallDefaultReticles )
		{
			if ( name == weaponNames[i] )
				defaultScale = "2.0"
		}

		AutoCVar( "set_reticle_scale_" + weaponNames[i], defaultScale, "Sets the scale of the reticle.", "" )
	}
}

main()
