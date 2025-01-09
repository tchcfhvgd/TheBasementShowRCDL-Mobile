#pragma header
#define texture flixel_texture2D
#define iResolution openfl_TextureSize
#define iChannel0 bitmap
uniform float iTime;
uniform float alphaNoise;

float filmGrainNoise(in float time, in vec2 uv)
{
    return fract(sin(dot(uv, vec2(12.9898, 78.233) * time)) * 43758.5453);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord / iResolution.xy;
    vec3 pixelColor;
    pixelColor.r =texture(iChannel0,uv).r;
    pixelColor.g =texture(iChannel0,uv).g;
    pixelColor.b =texture(iChannel0,uv).b;

    float grainFactor = filmGrainNoise(iTime, uv);
    pixelColor = mix(pixelColor, vec3(0.0), grainFactor * alphaNoise);
    fragColor = vec4(pixelColor,texture(iChannel0, uv).a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}