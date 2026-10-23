function main()
{
    AddCallback_OnClientScriptInit( Reticle_ScriptInit )
}

function Reticle_ScriptInit( player )
{
    player.ClientCommand( "exec custom_reticle_offsets.cfg" )
}

main()
