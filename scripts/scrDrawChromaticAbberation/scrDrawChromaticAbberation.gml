
function Shader_ChromaticAbberation_Create()
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
	else
	{
		// TODO: Log here
	}
}

function Shader_ChromaticAbberation_Begin(_application_surface)
{
	var texelWidth = 1.0 / surface_get_width(_application_surface);  // already 1/texture_width
    var texelHeight = 1.0 / surface_get_height(_application_surface);

	// apply shader
	shader_set(shChromaticAberration);
	shader_set_uniform_f(global.__sh_chromaticabberation_u_texel, texelWidth, texelHeight);
	shader_set_uniform_f(global.__sh_chromaticabberation_u_focalPoint, global.__sh_chromaticabberation_playerUvCoordinatesU, global.__sh_chromaticabberation_playerUvCoordinatesV);
    shader_set_uniform_f(global.__sh_chromaticabberation_u_numberOfPixelsSampledBeforeThreshold, global.__sh_chromaticabberation_pixelsSampledBeforeThreshold);
	shader_set_uniform_f(global.__sh_chromaticabberation_u_numberOfAdditionalPixelsSampledAfterThreshold, global.__sh_chromaticabberation_pixelsSampledAfterThreshold);
    shader_set_uniform_f(global.__sh_chromaticabberation_u_uvDistortionMidPoint, global.__sh_chromaticabberation_uvDistortionMidPoint);
}

function Shader_ChromaticAbberation_End()
{
	// TODO: In the future, we may add other things here like reseting blend mode, color, alpha, end a surface, etc.
	shader_reset();
	surface_reset_target();
}

// _numberOfPixelsSampledBeforeThreshold number of pixels to sample before the uv threshold.
// _numberOfAdditionalPixelsSampledAfterThreshold number of pixels to sample after the uv threshold.
// _uvDistortionMidPoint the textore coordinates midpoint for the uv sampling gradient. Choose a value between 0.0 and 1.0
function Shader_ChromaticAbberation_SetParameters(_numberOfPixelsSampledBeforeThreshold, _numberOfAdditionalPixelsSampledAfterThreshold, _uvDistortionMidPoint)
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
	
	var px =  global.globalPlayerPositionX;
	var py = global.globalPlayerPositionY;

	var u = clamp(px / room_width, 0, 1);
	var v = clamp(py / room_height, 0, 1);
	
	global.__sh_chromaticabberation_playerUvCoordinatesU = u;
	global.__sh_chromaticabberation_playerUvCoordinatesV = v;
}

function Shader_ChromaticAbberation_IsEnabled() 
{
	return global.__sh_chromaticabberation_slowMoShaderEnabled;
}

function Shader_ChromaticAbberation_Enable()
{
	global.__sh_chromaticabberation_slowMoShaderEnabled = true;
}

function Shader_ChromaticAbberation_Disable()
{
	global.__sh_chromaticabberation_slowMoShaderEnabled = false;
}