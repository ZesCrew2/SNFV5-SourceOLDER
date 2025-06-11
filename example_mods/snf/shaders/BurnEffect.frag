// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
#define iChannel0 bitmap
uniform sampler2D iChannel1;
#define texture flixel_texture2D

// variables which are empty, they need just to avoid crashing shader
uniform vec4 iMouse;

// end of ShadertoyToFlixel header

// The MIT License
// Copyright  2020 Andr Mattos
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


// based on https://www.shadertoy.com/view/ltV3RG
// TODO: control noise / shape to vary 
// TODO: study how to desintegrate - Sand Effect

uniform float strength;

float Hash( vec2 p)
{
	vec3 p2 = vec3(p.xy,1.0);
    return fract(sin(dot(p2,vec3(37.1,61.7, 12.4)))*3758.5453123);
}

float noise(in vec2 p)
{
    vec2 i = floor(p);
	vec2 f = fract(p);
	f *= f * (3.0-2.0*f);

    return mix(mix(Hash(i + vec2(0.,0.)), Hash(i + vec2(1.,0.)),f.x),
		mix(Hash(i + vec2(0.,1.)), Hash(i + vec2(1.,1.)),f.x),
		f.y);
}

float fbm(vec2 p) 
{
	float v = 0.0;
	v += noise(p*1.)*.5;
	v += noise(p*2.)*.25;
	v += noise(p*4.)*.125;
	v += noise(p*8.)*.0625;
	v += noise(p*16.)*.03125;
	//v += noise(p*32.)*.015625;
	//v += noise(p*64.)*.0078125;
	//v += noise(p*128.)*.00390625;
	//v += noise(p*256.)*.001953125;
	return v;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    
	//vec2 uv = (fragCoord - iResolution.xy*.5)/iResolution.y;
    vec2 uvDisplace = uv;
    
    bool apply = true;
	
	float factor = strength * 0.5;
    //float factor = iMouse.x / iResolution.x;
    if(!apply)
        factor = 0.0;
    
    float factorInv = 1.0 - factor;
    
	
	// burn
    vec2 p = uv * 10.;
    //float noiseBurn = noise(uv + noise(uv * 2. +  fbm(uv * 40.)));
    
    float noiseControl = noise(uv * 3. + 2.5)*1.3;
    
    float noiseBurn = fbm(uv * 15. );
    //noiseBurn *= noiseControl;
    
	float burn = (noiseBurn + factor);
    if(apply)
    	burn = pow(burn, 40.0);
    burn = clamp(burn, 0.0, 1.0);
    
    
    float displace = -mix(0.0, burn * 0.03, factor);
    uvDisplace += displace;
    
    // textures
    vec3 src = texture(iChannel0, uvDisplace).rgb;
	//src.rgb *= factorInv;
	//vec3 tgt = texture(iChannel1, uv).rgb;
	vec3 col = src;
    
    
    col = vec3(burn);
    if(apply)
    	col = mix(src, vec3(0), burn);
    //col = src;

	
	fragColor = vec4(col, texture(iChannel0, fragCoord / iResolution.xy).a);
}



void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}