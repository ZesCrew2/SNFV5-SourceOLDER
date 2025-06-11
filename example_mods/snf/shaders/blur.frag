#pragma header

uniform float strengthX;
uniform float strengthY;

float weight[5] = float[5](0.227027, 0.1945946, 0.1216216, 0.054054, 0.016216);

void main()
{
	vec2 uv = openfl_TextureCoordv;
    vec4 color = flixel_texture2D(bitmap, uv) * 0.227027;
    vec2 direction = vec2(strengthX, strengthY);

	vec2 tex_offset = 1.0 / openfl_TextureSize;

	for(int i = 1; i < 5; ++i)
	{
		color.rgb += flixel_texture2D(bitmap, uv + vec2(tex_offset.x * i * strengthX, tex_offset.y * i * strengthY)).rgb * weight[i];
		color.rgb += flixel_texture2D(bitmap, uv - vec2(tex_offset.x * i * strengthX, tex_offset.y * i * strengthY)).rgb * weight[i];
	}
    
    
    gl_FragColor = color;
}