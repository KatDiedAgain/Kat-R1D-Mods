function main()
{

	// USER INSTRUCTIONS
	//
	// Commands that you can safely modify in-game:
	//
	// autocvar_set_reticle_offset_amount
	// autocvar_set_global_reticle_scale
	// autocvar_disable_collimation
	// autocvar_set_reticle_scale_<any optic or weapon>
	//
	// All other commands exist purely to make development quicker and testing easier. If you try to modify the others, you might change a fundamental value that the mod relies on to remain consistent.
	// For instance, changing autocvar_set_reticle_offset will make it so the mod can no longer keep the reticle in the center of your screen when autocvar_set_reticle_center_factor is set to 1.
	// Changing the other scale or attachment distance variables may throw the measurements off and make some reticles stop behaving like the others. I've chosen these values carefully in order to
	// keep things running smoothly and consistently.
	//
	// To make changes with a text editor instead of Titanfall's command prompt, you can create a file called "custom_reticle_offsets.cfg" and place it in the cfg folder.
	// The cfg folder path should match your original Titanfall install location. Here's mine:
	// C:\Program Files (x86)\Origin Games\Titanfall\r1\cfg
	//
	// EDIT AT YOUR OWN RISK!

	AutoCVar( "set_reticle_offset", "1.55,1.41,1.31,1.21,1.13,1.02,0.95,0.855,0.795,0.75,0.65", "Sets the offsetValsCentered value in the material proxies nut file.", "" )
	AutoCVar( "set_reticle_offset_amount", "1.0", "Multiplies global offset values.", "" )
	AutoCVar( "disable_transitional_multiplier", "0", "Disables the way the reticle moves more right before the ADS animation ends.", "" )

	AutoCVar( "set_global_reticle_scale", "1.0", "Globally affects the scale of all reticles.", "" )
	AutoCVar( "set_irons_reticle_scale", "1.0", "Globally affects the scale of all iron-dot reticles.", "" )
	AutoCVar( "set_optic_reticle_scale", "1.0", "Globally affects the scale of all optical reticles.", "" )
	AutoCVar( "disable_collimation", "0", "Disables the consistent scaling of the reticle across FOVs and optic positions.", "" )

	AutoCVar( "set_global_reticle_zero_x", "0", "How much the reticle should be translated relative to its default position on the X axis.", "" )
	AutoCVar( "set_global_reticle_zero_y", "0", "How much the reticle should be translated relative to its default position on the Y axis.", "" )

	AutoCVar( "set_default_attachment_dist", "13.5", "Affects the attachmentDistance value in the material proxies nut file.", "" )

	AutoCVar( "set_att_diff_hcog", "3", "Sets the individual attachment distance difference for the HCOG.", "" )
	AutoCVar( "set_att_diff_holo", "4", "Sets the individual attachment distance difference for the Holosight.", "" )
	AutoCVar( "set_att_diff_aog", "-1.577", "Sets the individual attachment distance difference for the AOG.", "" )

	local weaponNames = [ "r101", "g2", "hemlok", "lmg", "r97", "car", "wingman", "hcog", "holo", "aog" ]
	local defaultOffsetsX = [ "1.0", "0.65", "0.81", "-0.28", "0.78", "0.36", "-0.25", "0.98", "0.92", "1.03" ]
	local defaultOffsetsY = [ "1.0", "0.65", "0.81", "-0.28", "0.78", "0.36", "-0.25", "1.25", "0.92", "1.03" ]

	local defaultZeroX = [ "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" ]
	local defaultZeroY = [ "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" ]

	local defaultScales = [ "2.0", "3.0", "2.0", "1.0", "2.0", "1.0", "2.0", "1.0", "1.0", "1.5" ]

	local mapsList = [
		"mp_fracture",
		"mp_nexus",
		"mp_overlook",
		"mp_airbase",
		"mp_outpost_207",
		"mp_corporate",
		"mp_boneyard",
		"mp_angel_city",
		"mp_lagoon",
		"mp_demeter",
		"mp_smugglers_cove",
		"mp_rise",
		"mp_relic",
		"mp_colony",
		"mp_training_ground",
		"mp_runoff",
		"mp_swampland",
		"mp_war_games",
		"mp_harmony_mines", // dig site
		"mp_haven",
		"mp_switchback", // Export
		"mp_backwater",
		"mp_sandtrap",
		"mp_zone_18",
		"mp_box",
		"mp_nest",
		"mp_mia",
		"mp_npe"
	]

	local holosightColorByMap = [
		"3.0,6.0,12.0", //	"mp_fracture",
		"4.0,8.0,16.0", //	"mp_nexus",
		"2.4,4.8,9.6", //	"mp_overlook",
		"2.0,4.0,8.0", //	"mp_airbase",
		"4.0,8.0,16.0", //	"mp_outpost_207",
		"4.0,8.0,16.0", //	"mp_corporate",
		"4.0,8.0,16.0", //	"mp_boneyard",
		"4.0,8.0,16.0", //	"mp_angel_city",
		"4.0,8.0,16.0", //	"mp_lagoon",
		"4.0,8.0,16.0", //	"mp_demeter",
		"4.0,8.0,16.0", //	"mp_smugglers_cove",
		"4.0,8.0,16.0", //	"mp_rise",
		"4.0,8.0,16.0", //	"mp_relic",
		"4.0,8.0,16.0", //	"mp_colony",
		"4.0,8.0,16.0", //	"mp_training_ground",
		"4.0,8.0,16.0", //	"mp_runoff",
		"4.0,8.0,16.0", //	"mp_swampland",
		"4.0,8.0,16.0", //	"mp_war_games",
		"3.0,6.0,12.0", //	"mp_harmony_mines",
		"4.0,8.0,16.0", //	"mp_haven",
		"4.0,8.0,16.0", //	"mp_switchback",
		"4.0,8.0,16.0", //	"mp_backwater",
		"4.0,8.0,16.0", //	"mp_sandtrap",
		"4.0,8.0,16.0", //	"mp_zone_18",
		"4.0,8.0,16.0", //	"mp_box",
		"4.0,8.0,16.0", //	"mp_nest",
		"4.0,8.0,16.0", //	"mp_mia",
		"4.0,8.0,16.0" //	"mp_npe"
	]

	for ( local i = 0; i < weaponNames.len(); i++ )
	{
		AutoCVar( "set_reticle_offset_multiplier_" + weaponNames[i] + "_x", defaultOffsetsX[i], "Sets the xOffsetMultiplier value in the material proxies nut file.", "" )
		AutoCVar( "set_reticle_offset_multiplier_" + weaponNames[i] + "_y", defaultOffsetsY[i], "Sets the yOffsetMultiplier value in the material proxies nut file.", "" )

		AutoCVar( "set_reticle_scale_" + weaponNames[i], defaultScales[i], "Sets the scale of the reticle.", "" )

		AutoCVar( "set_reticle_zero_" + weaponNames[i] + "_x", defaultZeroX[i], "Sets the zero of the reticle.", "" )
		AutoCVar( "set_reticle_zero_" + weaponNames[i] + "_y", defaultZeroY[i], "Sets the zero of the reticle.", "" )
	}

	for ( local i = 0; i < mapsList.len(); i++ )
	{
		AutoCVar( "holosight_corrected_color_" + mapsList[i], holosightColorByMap[i], "Sets the custom color for the Holosight for a given map.", "" )
	}

}

main()
