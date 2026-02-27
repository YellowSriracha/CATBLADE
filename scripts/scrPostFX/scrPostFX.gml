function apply_shader_pass(_source_surface, _destination_surface)
{
    surface_set_target(_destination_surface);
    draw_clear_alpha(c_black, 0);

    // Draw 1:1 into the destination surface (no stretching)
    draw_surface(_source_surface, 0, 0);
}

function ensure_post_process_surface(_application_surface, _post_process_surface)
{
    if (!surface_exists(_application_surface)) 
	{
		return [false, null];
	}

    var width  = surface_get_width(_application_surface);
    var height = surface_get_height(_application_surface);

    if (!surface_exists(_post_process_surface)
	    || surface_get_width(_post_process_surface) != width
	    || surface_get_height(_post_process_surface) != height)
    {
        if (surface_exists(_post_process_surface)) 
		{
			surface_free(_post_process_surface);
		}
        _post_process_surface = surface_create(width, height);
    }


    return [true, _post_process_surface];
}