
// Draws the shader to the surface at the end
var ensureResult = ensure_post_process_surface(application_surface, post_process_surface_one);
var anyShaderEnabled = Shader_ChromaticAbberation_IsEnabled();
if(ensureResult[0] == true) 
{
	post_process_surface_one = ensureResult[1];
}

if (Shader_ChromaticAbberation_IsEnabled())
{
	Shader_ChromaticAbberation_SetParameters(0.0, 36, 0.12);
	Shader_ChromaticAbberation_Begin(application_surface);
	apply_shader_pass(application_surface, post_process_surface_one);
	Shader_ChromaticAbberation_End();
}

if (anyShaderEnabled)
{
	final_output_surface = post_process_surface_one;
}
else
{
	final_output_surface = application_surface
}