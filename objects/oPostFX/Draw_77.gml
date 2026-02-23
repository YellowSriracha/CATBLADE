


if (global.__sh_chromaticabberation_slowMoShaderEnabled == true)
{
	global.__sh_chromaticabberation_slowMoShaderEnabled = false;
	application_surface_draw_enable(false);
	setChromaticAbberationShader(
			application_surface
		, global.__sh_chromaticabberation_playerUvCoordinatesU
		, global.__sh_chromaticabberation_playerUvCoordinatesV
		, global.__sh_chromaticabberation_pixelsSampledBeforeThreshold
		, global.__sh_chromaticabberation_pixelsSampledAfterThreshold
		, global.__sh_chromaticabberation_uvDistortionMidPoint
	);

	shader_reset();
}
else
{
	application_surface_draw_enable(true);
}


