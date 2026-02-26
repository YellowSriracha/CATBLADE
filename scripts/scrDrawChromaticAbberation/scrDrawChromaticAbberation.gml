function setChromaticAbberationShader(_application_surface, _focus_x, _focus_y, _numberOfPixelsSampledBeforeThreshold, _numberOfAdditionalPixelsSampledAfterThreshold, _uvDistortionMidPoint)
{
	
if (!variable_global_exists("__sh_chromaticabberation_init") || !global.__sh_chromaticabberation_init)
    {
        global.__sh_chromaticabberation_init = true;
        global.__sh_chromaticabberation = shChromaticAberration;
		global.__sh_chromaticabberation_u_texel = shader_get_uniform(shChromaticAberration, "u_texel");
	    global.__sh_chromaticabberation_u_focalPoint = shader_get_uniform(shChromaticAberration, "u_distortionFocusPoint");
		global.__sh_chromaticabberation_u_numberOfPixelsSampledBeforeThreshold = shader_get_uniform(shChromaticAberration, "u_numberOfPixelsSampledBeforeThreshold");
		global.__sh_chromaticabberation_u_numberOfAdditionalPixelsSampledAfterThreshold = shader_get_uniform(shChromaticAberration, "u_numberOfAdditionalPixelsSampledAfterThreshold");
		global.__sh_chromaticabberation_u_uvDistortionMidPoint = shader_get_uniform(shChromaticAberration, "u_uvDistortionMidPoint");
    }
	
	var _pos = application_get_position();
	
    var texelWidth = 1.0 / surface_get_width(_application_surface);  // already 1/texture_width
    var texelHeight = 1.0 / surface_get_height(_application_surface);

	// apply shader
	shader_set(shChromaticAberration);
	shader_set_uniform_f(global.__sh_chromaticabberation_u_texel, texelWidth, texelHeight);
	shader_set_uniform_f(global.__sh_chromaticabberation_u_focalPoint, _focus_x, _focus_y);
    shader_set_uniform_f(global.__sh_chromaticabberation_u_numberOfPixelsSampledBeforeThreshold, _numberOfPixelsSampledBeforeThreshold);
	shader_set_uniform_f(global.__sh_chromaticabberation_u_numberOfAdditionalPixelsSampledAfterThreshold, _numberOfAdditionalPixelsSampledAfterThreshold);
    shader_set_uniform_f(global.__sh_chromaticabberation_u_uvDistortionMidPoint, _uvDistortionMidPoint);

	draw_surface_stretched(_application_surface, _pos[0], _pos[1], _pos[2]-_pos[0], _pos[3]-_pos[1]);
}

// _numberOfPixelsSampledBeforeThreshold number of pixels to sample before the uv threshold.
// _numberOfAdditionalPixelsSampledAfterThreshold number of pixels to sample after the uv threshold.
// _uvDistortionMidPoint the textore coordinates midpoint for the uv sampling gradient. Choose a value between 0.0 and 1.0
function enableSlowMoShader(_numberOfPixelsSampledBeforeThreshold, _numberOfAdditionalPixelsSampledAfterThreshold, _uvDistortionMidPoint)
{
	if (!variable_global_exists("globalPlayerPositionX"))
	{
		return;
	}
	if (!variable_global_exists("globalPlayerPositionY"))
	{
		return;
	}
	
	global.__sh_chromaticabberation_pixelsSampledBeforeThreshold = _numberOfPixelsSampledBeforeThreshold;
	global.__sh_chromaticabberation_pixelsSampledAfterThreshold = _numberOfAdditionalPixelsSampledAfterThreshold;
	global.__sh_chromaticabberation_uvDistortionMidPoint = _uvDistortionMidPoint;
	global.__sh_chromaticabberation_slowMoShaderEnabled = true;
	
	var px =  global.globalPlayerPositionX;
	var py = global.globalPlayerPositionY;

	var w = room_width;
	var h = room_height;

	var u = px  / w;
	var v = py  / h;

	u = clamp(u, 0, 1);
	v = clamp(v, 0, 1);
	
	global.__sh_chromaticabberation_playerUvCoordinatesU = u;
	global.__sh_chromaticabberation_playerUvCoordinatesV = v;
}