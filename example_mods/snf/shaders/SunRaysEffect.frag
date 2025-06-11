#pragma header

#define round(a) floor(a + 0.5)
#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;
#define texture flixel_texture2D

vec4 flixel_texture2D(sampler2D bitmap, vec2 coord, float bias) {
	vec4 color = texture2D(bitmap, coord, bias);
	if (!hasTransform)
	{
		return color;
	}
	if (color.a == 0.0)
	{
		return vec4(0.0, 0.0, 0.0, 0.0);
	}
	if (!hasColorTransform)
	{
		return color * openfl_Alphav;
	}
	color = vec4(color.rgb / color.a, color.a);
	mat4 colorMultiplier = mat4(0);
	colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
	colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
	colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
	colorMultiplier[3][3] = openfl_ColorMultiplierv.w;
	color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);
	if (color.a > 0.0)
	{
		return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
	}
	return vec4(0.0, 0.0, 0.0, 0.0);
}
uniform float iTimeDelta;
uniform float iFrameRate;
uniform int iFrame;
#define iChannelTime float[4](iTime, 0., 0., 0.)
#define iChannelResolution vec3[4](iResolution, vec3(0.), vec3(0.), vec3(0.))
uniform vec4 iMouse;
uniform vec4 iDate;

#define decay 0.76
#define illuminationDecay 1.1
#define density 1.
#define weight 0.98767
#define nsamples 100.
#define position vec2((sin(iTime * 1.) * .15) + .5, (cos(iTime * 3.) * .2) + .4)

vec4 crepuscular_rays(vec2 texCoords, vec2 pos) {
    vec2 tc = texCoords.xy;
    vec2 deltaTexCoord = tc - pos.xy;
    deltaTexCoord *= (1.0 / nsamples * density);
    float illuminationDecay_ = illuminationDecay;

    vec4 color = texture(iChannel0, tc.xy) * .4;

    tc += deltaTexCoord * fract( sin(dot(texCoords.xy+fract(iTime), vec2(12.9898, 78.233)))* 43758.5453 );
    for (int i = 0; i < int(nsamples); i++)
    {
        tc -= deltaTexCoord;
        vec4 sampl = texture(iChannel0, tc.xy);

        sampl *= illuminationDecay_ * weight;
        color += sampl * .4;
        illuminationDecay_ *= decay;
    }
    
    return color;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord.xy / iResolution.xy;
    fragColor = crepuscular_rays(uv, position);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}