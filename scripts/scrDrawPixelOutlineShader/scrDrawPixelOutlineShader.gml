/// SetBorderOutlineShader(_sprite_index, _image_index, _alphaThreshold, _borderColor, _numTransparentForFull, _minTransparentForOutline)/// SetBorderOutlineShader(_sprite_index, _image_index, _alphaThreshold, _borderColor, _numTransparentForFull, _minTransparentForOutline)
/// Example call for good results DrawoutlineSprite(sprite_index, image_index, 0.5, c_red, 1, 1); Creates a red border. 
/// Draws the given sprite frame using shPixelOutline with the provided settings.
/// Call from a Draw event (or anywhere you're drawing).
function SetBorderOutlineShader(_sprite_index, _image_index, _alphaThreshold, _borderColor, _numTransparentForFull, _minTransparentForOutline)
{
    // One-time cache of uniform locations (global)
    if (!variable_global_exists("__outline_init") || !global.__outline_init)
    {
        global.__outline_init = true;

        global.__outline_sh = shPixelOutline;
        global.__outline_u_texel = shader_get_uniform(shPixelOutline, "u_texel");
        global.__outline_u_borderColor = shader_get_uniform(shPixelOutline, "u_borderColor");
        global.__outline_u_alphaThreshold = shader_get_uniform(shPixelOutline, "u_alphaThresholdCreature");
        global.__outline_u_fullNeighbors = shader_get_uniform(shPixelOutline, "u_numberOfTransparentPixelNeighborsForFullOutline");
        global.__outline_u_minNeighbors  = shader_get_uniform(shPixelOutline, "u_minimumNumberOfTransparentNeighborsForOutline");
		global.__outline_u_uvCorners  = shader_get_uniform(shPixelOutline, "u_uvCorners");
    }

    // Texel size for the actual texture backing this sprite frame (atlas-correct)
    var tex = sprite_get_texture(_sprite_index, _image_index);
    var texelWidth = texture_get_texel_width(tex);   // already 1/texture_width
    var texelHeight = texture_get_texel_height(tex);  // already 1/texture_height

    // Border color (GM color -> 0..1)
    var r = color_get_red(_borderColor)   / 255.0;
    var g = color_get_green(_borderColor) / 255.0;
    var b = color_get_blue(_borderColor)  / 255.0
	
	var uvs = sprite_get_uvs(_sprite_index, _image_index);
	var uvLeft = uvs[0];
	var uvTop = uvs[1];
	var uvRight = uvs[2];
	var uvBottom = uvs[3];

    // Draw with shader
    gpu_set_texfilter(false); // crisp pixel outline; remove if you want filtering
    shader_set(global.__outline_sh);

    shader_set_uniform_f(global.__outline_u_texel, texelWidth, texelHeight);
    shader_set_uniform_f(global.__outline_u_borderColor, r, g, b, 1.0);
    shader_set_uniform_f(global.__outline_u_alphaThreshold, _alphaThreshold);
    shader_set_uniform_f(global.__outline_u_fullNeighbors, _numTransparentForFull);
    shader_set_uniform_f(global.__outline_u_minNeighbors, _minTransparentForOutline);
	shader_set_uniform_f(global.__outline_u_uvCorners, uvLeft, uvTop, uvRight, uvBottom);
}