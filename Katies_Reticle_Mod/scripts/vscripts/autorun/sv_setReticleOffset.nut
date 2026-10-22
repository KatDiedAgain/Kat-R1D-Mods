function main()
{
    AutoCVar( "set_reticle_offset", "1.55,1.41,1.31,1.21,1.13,1.02,0.95,0.855,0.795,0.75,0.65", "Sets the offsetValsCentered value in the material proxies nut file.", "" ) //1.5 for first value obv
    AutoCVar( "set_reticle_offset_factor", "1.0", "Sets the reticleCenterFactor value in the material proxies nut file.", "" )

    // These return an array that contains each value for each of the three optics.
    // Format:
    // [IRONSIGHTS,HCOG,HOLOSIGHT,AOG]
    AutoCVar( "set_reticle_offset_multiplier_x", "1.0,0.98,0.92,1.03", "Sets the xOffsetMultiplier value in the material proxies nut file.", "" )
    AutoCVar( "set_reticle_offset_multiplier_y", "1.0,1.25,0.92,1.03", "Sets the yOffsetMultiplier value in the material proxies nut file.", "" )

    AutoCVar( "set_reticle_offset_addend_x", "0,0,0,0", "Sets the xOffsetAddend value in the material proxies nut file.", "" )
    AutoCVar( "set_reticle_offset_addend_y", "0,0,0,0", "Sets the yOffsetAddend value in the material proxies nut file.", "" )
}

main()
