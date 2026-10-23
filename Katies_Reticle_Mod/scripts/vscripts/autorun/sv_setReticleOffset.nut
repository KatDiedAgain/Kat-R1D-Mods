function main()
{
    AutoCVar( "set_reticle_offset", "1.55,1.41,1.31,1.21,1.13,1.02,0.95,0.855,0.795,0.75,0.65", "Sets the offsetValsCentered value in the material proxies nut file.", "" ) //1.5 for first value obv
    AutoCVar( "set_reticle_offset_factor", "1.0", "Sets the reticleCenterFactor value in the material proxies nut file.", "" )

    // These return an array that contains each value for each of the three optics.
    // Format:
    // [R101_IRONS,G2_IRONS,HEMLOK_IRONS,LMG_IRONS,R97_IRONS,CAR_IRONS,HCOG,HOLOSIGHT,AOG]

    //                                            r1  g2a4 hmlk lmg   r97  car  hcog holo aog
    AutoCVar( "set_reticle_offset_multiplier_x", "1.0,0.65,0.81,-0.28,0.78,0.36,0.98,0.92,1.03", "Sets the xOffsetMultiplier value in the material proxies nut file.", "" )
    AutoCVar( "set_reticle_offset_multiplier_y", "1.0,0.65,0.81,-0.28,0.78,0.36,1.25,0.92,1.03", "Sets the yOffsetMultiplier value in the material proxies nut file.", "" )

    AutoCVar( "set_reticle_offset_addend_x", "0,0,0,0,0,0,0,0,0", "Sets the xOffsetAddend value in the material proxies nut file.", "" )
    AutoCVar( "set_reticle_offset_addend_y", "0,0,0,0,0,0,0,0,0", "Sets the yOffsetAddend value in the material proxies nut file.", "" )

    AutoCVar( "set_reticle_scale_irons_r101", "1.0", "Sets the scale of the reticle for: R-101 IRON SIGHTS", "" )
    AutoCVar( "set_reticle_scale_irons_g2", "2.0", "Sets the scale of the reticle for: G2 IRON SIGHTS", "" )
    AutoCVar( "set_reticle_scale_irons_hemlok", "2.0", "Sets the scale of the reticle for: Hemlok IRON SIGHTS", "" )
    AutoCVar( "set_reticle_scale_irons_lmg", "1.0", "Sets the scale of the reticle for: Spitfire IRON SIGHTS", "" )
    AutoCVar( "set_reticle_scale_irons_r97", "1.0", "Sets the scale of the reticle for: R-97 IRON SIGHTS", "" )
    AutoCVar( "set_reticle_scale_irons_car", "1.0", "Sets the scale of the reticle for: CAR IRON SIGHTS", "" )
    AutoCVar( "set_reticle_scale_hcog", "1.0", "Sets the scale of the reticle for: HCOG", "" )
    AutoCVar( "set_reticle_scale_holo", "1.0", "Sets the scale of the reticle for: HOLOSIGHT", "" )
    AutoCVar( "set_reticle_scale_aog", "1.0", "Sets the scale of the reticle for: AOG", "" )
}

main()
