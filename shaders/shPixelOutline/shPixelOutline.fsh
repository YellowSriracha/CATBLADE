//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_texel; // (1/width, 1/height)
uniform vec4 u_borderColor;
uniform float u_alphaThresholdCreature;
uniform float u_numberOfTransparentPixelNeighborsForFullOutline;
uniform float u_minimumNumberOfTransparentNeighborsForOutline;
uniform vec4 u_uvCorners; // in order of left, top, right, bottom

void main()
{
	 gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	 vec2 uv = v_vTexcoord;
	 
	// Neighbor UVs
	 vec2 leftUv      = uv + vec2(-u_texel.x,  0.0);
	 vec2 rightUv     = uv + vec2( u_texel.x,  0.0);
	 vec2 upUv        = uv + vec2( 0.0,        u_texel.y);
	 vec2 downUv      = uv + vec2( 0.0,       -u_texel.y);

	 vec2 upLeftUv    = uv + vec2(-u_texel.x,  u_texel.y);
	 vec2 upRightUv   = uv + vec2( u_texel.x,  u_texel.y);
	 vec2 downLeftUv  = uv + vec2(-u_texel.x, -u_texel.y);
	 vec2 downRightUv = uv + vec2( u_texel.x, -u_texel.y);

	// Samples
	 float currentFragmentAlpha = texture2D(gm_BaseTexture, uv).a;
	 float leftFragmentAlpha         = texture2D(gm_BaseTexture, leftUv).a;
	 float rightFragmentAlpha        = texture2D(gm_BaseTexture, rightUv).a;
	 float upFragmentAlpha           = texture2D(gm_BaseTexture, upUv).a;
	 float downFragmentAlpha         = texture2D(gm_BaseTexture, downUv).a;
	 float upLefFragmentAlpha       = texture2D(gm_BaseTexture, upLeftUv).a;
	 float upRightFragmentAlpha      = texture2D(gm_BaseTexture, upRightUv).a;
	 float downLeftFragmentAlpha     = texture2D(gm_BaseTexture, downLeftUv).a;
	 float downRightFragmentAlpha    = texture2D(gm_BaseTexture, downRightUv).a;
	 
	 float transparencyCounters = 0.0;
	 
	 // step returns 0.0 if x < threshold, and 1.0 otherwise step(threshold, x);
	 // we use step to be branchless.
	 float leftCounter       = 1.0 - step(u_alphaThresholdCreature, leftFragmentAlpha);
	 float rightCounter      = 1.0 - step(u_alphaThresholdCreature, rightFragmentAlpha);
	 float upCounter         = 1.0 - step(u_alphaThresholdCreature, upFragmentAlpha);
	 float downCounter       = 1.0 - step(u_alphaThresholdCreature, downFragmentAlpha);
	 
	 float upLeftCounter     = 1.0 - step(u_alphaThresholdCreature, upLefFragmentAlpha);
	 float upRightCounter    = 1.0 - step(u_alphaThresholdCreature, upRightFragmentAlpha);
	 float downLeftCounter = 1.0 - step(u_alphaThresholdCreature, downLeftFragmentAlpha);
	 float downRightCounter= 1.0 - step(u_alphaThresholdCreature, downRightFragmentAlpha);
	 
	 float maxUvLeft = u_uvCorners[0];
	 float maxUvTop = u_uvCorners[1];
	 float maxUvRight = u_uvCorners[2];
	 float maxUvBottom = u_uvCorners[3];
	 
	 float isCurrentPixelAtTheLeftOfTheSprite =   step(uv.x - u_texel.x, maxUvLeft);	 
	 float isCurrentPixelAtTheTopOfTheSprite =    step(uv.y - u_texel.y, maxUvTop);
	 float isCurrentPixelAtTheRightOfTheSprite =  step(maxUvRight, uv.x + u_texel.x);
	 float isCurrentPixelAtTheBottomOfTheSprite = step(maxUvBottom, uv.y + u_texel.y);


	 transparencyCounters += upLeftCounter
		+ upRightCounter
		+ downLeftCounter
		+ downRightCounter
		+ leftCounter
		+ rightCounter
		+ upCounter
		+ downCounter
		+ isCurrentPixelAtTheLeftOfTheSprite
		+ isCurrentPixelAtTheTopOfTheSprite
		+ isCurrentPixelAtTheRightOfTheSprite
		+ isCurrentPixelAtTheBottomOfTheSprite;
		
	 bool transparencyCounterThresholdMet = transparencyCounters >= u_minimumNumberOfTransparentNeighborsForOutline;
	 float mixStrength = clamp(transparencyCounters / u_numberOfTransparentPixelNeighborsForFullOutline, 0.0, 1.0);
	 vec4 borderMixedWithOriginalFragColor = mix(gl_FragColor, u_borderColor, mixStrength);
	 
	 // mix strenght of 0.0 means we have are not considered a border fragment.
	 // mix strength of 1.0 means we have met the number of transparent bordering fragments to be considered a border
	 float mixTransparencyThresholdMet = step(u_minimumNumberOfTransparentNeighborsForOutline, transparencyCounters);
	 vec4 borderColor = mix(gl_FragColor, borderMixedWithOriginalFragColor, mixTransparencyThresholdMet);
	 
	 // mix strength of 0.0 means we are an inside pixel (non border).
	 // mix strenght of 1.0 means we are a border pixel.
	 float mixBorderStrength = step(u_alphaThresholdCreature, currentFragmentAlpha);
	 vec4 borderVsNonBorderColor = mix(gl_FragColor, borderColor, mixBorderStrength);
	 gl_FragColor = borderVsNonBorderColor;
}
