#define LINE_SPACING 0.015        // More lines (keep as is)
#define LINE_THICKNESS 0.02        // Increased line thickness
#define AA_SCALE 1.0

// Colors and blending will match topographic shader

#define smooth(x) (3.0 * x * x - 2.0 * x * x * x)

mat2 r(float t)
{
    return mat2(cos(t), -sin(t), sin(t), cos(t));
}

vec2 hash22(vec2 p)
{
    vec3 p3 = fract(p.xyx * vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

float perlinNoise(vec2 p, float t)
{
    vec2 tlVal = r(t * hash22(vec2(floor(p.x), ceil(p.y)) + 20.0).x) * (hash22(vec2(floor(p.x), ceil(p.y))) - 0.5) * 2.0;
    vec2 blVal = r(t * hash22(vec2(floor(p.x), floor(p.y)) + 20.0).x) * (hash22(vec2(floor(p.x), floor(p.y))) - 0.5) * 2.0;
    vec2 trVal = r(t * hash22(vec2(ceil(p.x), ceil(p.y)) + 20.0).x) * (hash22(vec2(ceil(p.x), ceil(p.y))) - 0.5) * 2.0;
    vec2 brVal = r(t * hash22(vec2(ceil(p.x), floor(p.y)) + 20.0).x) * (hash22(vec2(ceil(p.x), floor(p.y))) - 0.5) * 2.0;

    float tl = dot(p - vec2(floor(p.x), ceil(p.y)), tlVal);
    float bl = dot(p - vec2(floor(p.x), floor(p.y)), blVal);
    float tr = dot(p - vec2(ceil(p.x), ceil(p.y)), trVal);
    float br = dot(p - vec2(ceil(p.x), floor(p.y)), brVal);

    return mix(mix(bl, tl, smooth(fract(p.y))),
               mix(br, tr, smooth(fract(p.y))),
               smooth(fract(p.x))) * 0.5 + 0.5;
}

float fbm(vec2 p, float t)
{
    float v = 0.0;
    for (float i = 0.0; i < 4.0; i++)
    {
        v += perlinNoise(p * exp(i), t * exp(i)) * exp(-i);
    }
    return v * 0.5;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;

    float t = iTime * 0.03;
    float height = fbm(uv + t, t * 0.5);

    // Contour logic
    float contour = abs(fract(height / LINE_SPACING) - 0.5);

    // Anti-aliased thicker line
    float thickness = fwidth(height) * AA_SCALE;
    float line = smoothstep(LINE_THICKNESS + thickness, thickness, contour);

    // Sample terminal texture
    vec2 uv_tex = fragCoord.xy / iResolution.xy;
    vec4 termColor = texture(iChannel0, uv_tex);

    // White lines, subtle alpha
    vec3 lineColor = vec3(1.0);
    float lineAlpha = line * 0.12;

    // Blend lines over terminal text (visible)
    vec3 finalColor = mix(termColor.rgb, lineColor, lineAlpha);
    float finalAlpha = max(termColor.a, lineAlpha);

    fragColor = vec4(finalColor, finalAlpha);
}

