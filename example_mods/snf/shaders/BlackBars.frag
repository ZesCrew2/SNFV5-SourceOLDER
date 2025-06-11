#pragma header
// made by leFatherOfAllHumanBeingsFNF
uniform float size;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;

vec3 margins(vec3 color, vec2 uv, float marginSize)
    {
        float startValue = 0.1;
        float endValue = -0.1;
        float currentValue = mix(startValue, endValue, size + size);

        float startValue2 = 1.1;
        float endValue2 = 0.9;
        float currentValue2 = mix(startValue2, endValue2, size + size);

        
        if(uv.y + currentValue < marginSize || uv.y > currentValue2-marginSize)
        {
            return vec3(0.0);
            color *= 0.9+0.9*sin(100.0*uv.y*1000.0);
            color *= 0.99+0.01*sin(10.0);
            
        }else{
            return color;
            
            
        }
    }


void main()
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    
    vec3 color = texture2D(bitmap, uv).rgb;
    
    vec3 sceneColor = vec3(color);
    
    sceneColor = margins(sceneColor, uv, 0.1);
    
    gl_FragColor = vec4(sceneColor, 1.0);
}