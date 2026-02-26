
// TODO: Dispatch any shaders here
//if (true)
//{
//	global.__sh_chromaticabberation_slowMoShaderEnabled = false;
	
//	//setChromaticAbberationShader(
//	//		application_surface
//	//	, global.__sh_chromaticabberation_playerUvCoordinatesU
//	//	, global.__sh_chromaticabberation_playerUvCoordinatesV
//	//	, global.__sh_chromaticabberation_pixelsSampledBeforeThreshold
//	//	, global.__sh_chromaticabberation_pixelsSampledAfterThreshold
//	//	, global.__sh_chromaticabberation_uvDistortionMidPoint
//	//);

//}

// Draws the shader to the surface at the end
//var _pos = application_get_position();
//draw_surface_stretched(application_surface, _pos[0], _pos[1], _pos[2]-_pos[0], _pos[3]-_pos[1]);

// Draws the shader to the surface at the end
var ensureResult = ensure_post_process_surface(application_surface, post_process_surface_one);
if(ensureResult[0] == true) 
{
	post_process_surface_one = ensureResult[1];
}

Shader_ChromaticAbberation_SetParameters(0.0, 100, 0.1);
Shader_ChromaticAbberation_Begin(application_surface);
apply_shader_pass(application_surface, post_process_surface_one);
Shader_ChromaticAbberation_End();

final_output_surface = post_process_surface_one;

