//
// Chromatic aberration (fixed syntax)
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2  u_distortionFocusPoint;   // in UV space (0..1)
uniform float u_numberOfPixelsSampledBeforeThreshold;
uniform float u_numberOfAdditionalPixelsSampledAfterThreshold;
uniform float u_uvDistortionMidPoint; // 0.0 to 1.0
uniform vec2 u_texel;

void main()
{
	gl_FragColor =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float maxDistance = 1.41421356;
	float distanceFromPlayer =  distance(v_vTexcoord, u_distortionFocusPoint);
	float distanceNormalized = distanceFromPlayer / maxDistance;
	float thresholdMask = (u_uvDistortionMidPoint, distanceNormalized);

	float totalPixelDistance = u_numberOfPixelsSampledBeforeThreshold 
		+ (u_numberOfAdditionalPixelsSampledAfterThreshold * thresholdMask);
	vec2 offset = u_texel * totalPixelDistance;
	
	gl_FragColor.r = texture2D( gm_BaseTexture, v_vTexcoord - offset ).r;
	gl_FragColor.g = texture2D( gm_BaseTexture, v_vTexcoord).g;
	gl_FragColor.b = texture2D( gm_BaseTexture, v_vTexcoord + offset).b;
}