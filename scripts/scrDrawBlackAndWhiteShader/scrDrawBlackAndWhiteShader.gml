function SetBlackAndWhiteShader(_application_surface)
{
	
if (!variable_global_exists("__sh_blackandwhite_init") || !global.__sh_blackandwhite_init)
    {
        global.__sh_blackandwhite_init = true;

        global.__sh_blackandwhite = shSlowMo;
    }
	
	var _pos = application_get_position();

	// apply shader
	shader_set(shSlowMo);
	draw_surface_stretched(_application_surface, _pos[0], _pos[1], _pos[2]-_pos[0], _pos[3]-_pos[1]);
}