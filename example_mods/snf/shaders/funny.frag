#pragma header

vec2 u_resolution = openfl_TextureSize;
uniform float u_time; 
uniform float mult;
void main() {
    vec3 map = vec3(openfl_TextureCoordv.xy,0.0);
    //vec3 extMap = vec3(gl_FragCoord.xy/u_resolution.xy,1920.1080);
    vec4 image = texture2D( bitmap, openfl_TextureCoordv);
    vec4 imageR = texture2D( bitmap, openfl_TextureCoordv + vec2(0.0,0.005*mult));
    vec4 imageB = texture2D( bitmap, openfl_TextureCoordv - vec2(0.0,0.005*mult));

    if (sin(map.y * 900. + (u_time/10.)) > 0.0) {
        image = vec4(mix(image.r,0.0,0.5*mult),mix(image.g,0.0,0.5*mult),mix(image.b,0.0,0.5*mult),mix(image.a,0.0,0.5*mult));
        imageR = vec4(mix(imageR.r,0.0,0.5*mult),mix(imageR.g,0.0,0.5*mult),mix(imageR.b,0.0,0.5*mult),mix(imageR.a,0.0,0.5*mult));
        imageB = vec4(mix(imageB.r,0.0,0.5*mult),mix(imageB.g,0.0,0.5*mult),mix(imageB.b,0.0,0.5*mult),mix(imageB.a,0.0,0.5*mult));
    }
    if (sin(map.y * 900. + (u_time/15.5)) > 0.0) {
        image = vec4(mix(image.r,0.0,1.*mult),mix(image.g,0.0,1.*mult),mix(image.b,0.0,1.*mult),mix(image.a,0.0,1.*mult));
        imageR = vec4(mix(imageR.r,0.0,1.*mult),mix(imageR.g,0.0,1.*mult),mix(imageR.b,0.0,1.*mult),mix(imageR.a,0.0,1.*mult));
        imageB = vec4(mix(imageB.r,0.0,1.*mult),mix(imageB.g,0.0,1.*mult),mix(imageB.b,0.0,1.*mult),mix(imageB.a,0.0,1.*mult));
        
    }
    gl_FragColor = vec4(imageR.r,image.g,imageB.b,image.a);
}