function main()
{
	AutoCVar( "set_reticle_offset", "1.55,1.41,1.31,1.21,1.13,1.02,0.95,0.855,0.795,0.75,0.65", "Sets the offsetValsCentered value in the material proxies nut file.", "" )
	AutoCVar( "set_reticle_offset_factor", "1.0", "Sets the reticleCenterFactor value in the material proxies nut file.", "" )
	AutoCVar( "set_default_attachment_dist", "13.5", "Affects the attachmentDistance value in the material proxies nut file.", "" )
	AutoCVar( "set_global_reticle_scale", "1.0", "Globally affects the scale of all reticles.", "" )
	AutoCVar( "set_global_optic_reticle_scale", "0.75", "Globally affects the scale of all OPTIC reticles.", "" )
	AutoCVar( "disable_collimation", "0", "Disables the consistent scaling of the reticle across FOVs and optic positions.", "" )

	AutoCVar( "set_att_diff_hcog", "3", "Sets the individual attachment distance difference for the HCOG.", "" )
	AutoCVar( "set_att_diff_holo", "4", "Sets the individual attachment distance difference for the Holosight.", "" )
	AutoCVar( "set_att_diff_aog", "-1.577", "Sets the individual attachment distance difference for the AOG.", "" )

	local weaponNames = [ "r101", "g2", "hemlok", "lmg", "r97", "car", "wingman", "hcog", "holo", "aog" ]
	local defaultOffsetsX = [ "1.0", "0.65", "0.81", "-0.28", "0.78", "0.36", "-0.25", "0.98", "0.92", "1.03" ]
	local defaultOffsetsY = [ "1.0", "0.65", "0.81", "-0.28", "0.78", "0.36", "-0.25", "1.25", "0.92", "1.03" ]

	local defaultScales = [ "2.0", "3.0", "2.0", "1.0", "2.0", "1.0", "2.0", "1.0", "1.0", "1.0" ]

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
