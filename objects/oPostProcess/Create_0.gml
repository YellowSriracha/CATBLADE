global.__sh_chromaticabberation_slowMoShaderEnabled = false;
global.__sh_chromaticabberation_pixelsSampledBeforeThreshold = 0.0;
global.__sh_chromaticabberation_pixelsSampledAfterThreshold = 0.0;
global.__sh_chromaticabberation_uvDistortionMidPoint = 0.0;
global.__sh_chromaticabberation_playerUvCoordinatesU = 0.0;
global.__sh_chromaticabberation_playerUvCoordinatesV = 0.0;

application_surface_draw_enable(false);

var application_surface_width  = surface_get_width(application_surface);
var application_surface_height = surface_get_height(application_surface);

post_process_surface_one = surface_create(application_surface_width, application_surface_height);
post_process_surface_two = surface_create(application_surface_width, application_surface_height);

Shader_ChromaticAbberation_Create();

// TODO: Any shader that should be default disabled, call here.
Shader_ChromaticAbberation_Disable();