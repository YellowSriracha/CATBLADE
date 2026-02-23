//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float dist3d(vec3 a, vec3 b)
{
    vec3 d = a - b;
    return sqrt(dot(d, d)); // same as length(d)
}

void main()
{
	vec4 originalColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if (originalColor.a < 0.5)
	{
		gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
		return;
	}
	float maxDistance = 1.73205;
	float distance = dist3d(vec3(originalColor.r, originalColor.g, originalColor.b), vec3(0.0, 0.0, 0.0));
	float threshold = distance/maxDistance;
	float blackOrWhiteStrength = step(0.5, distance);
	vec4 black = vec4(0.0, 0.0, 0.0, 1.0);
	vec4 white = vec4(1.0, 1.0, 1.0, 1.0);
	vec4 blackAndWhite = mix(black, white, blackOrWhiteStrength); 
	gl_FragColor = blackAndWhite;
}
