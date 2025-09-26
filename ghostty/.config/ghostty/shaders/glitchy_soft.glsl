// Softened version of glitchy shader for Ghostty
// Effects are toned down for a subtler look

#define DURATION 10.
#define AMT .07 // reduced glitch amount

#define SS(a, b, x) (smoothstep(a, b, x) * smoothstep(b, a, x))

#define UI0 1597334673U
#define UI1 3812015801U
#define UI2 uvec2(UI0, UI1)
#define UI3 uvec3(UI0, UI1, 2798796415U)
#define UIF (1. / float(0xffffffffU))

// Hash by David_Hoskins
vec3 hash33(vec3 p)
{
    uvec3 q = uvec3(ivec3(p)) * UI3;
    q = (q.x ^ q.y ^ q.z)*UI3;
    return -1. + 2. * vec3(q) * UIF;
}

// Gradient noise by iq
float gnoise(vec3 x)
{
    vec3 p = floor(x);
    vec3 w = fract(x);
    vec3 u = w * w * w * (w * (w * 6. - 15.) + 10.);
    vec3 ga = hash33(p + vec3(0., 0., 0.));
    vec3 gb = hash33(p + vec3(1., 0., 0.));
    vec3 gc = hash33(p + vec3(0., 1., 0.));
    vec3 gd = hash33(p + vec3(1., 1., 0.));
    vec3 ge = hash33(p + vec3(0., 0., 1.));
    vec3 gf = hash33(p + vec3(1., 0., 1.));
    vec3 gg = hash33(p + vec3(0., 1., 1.));
    vec3 gh = hash33(p + vec3(1., 1., 1.));
    float va = dot(ga, w - vec3(0., 0., 0.));
    float vb = dot(gb, w - vec3(1., 0., 0.));
    float vc = dot(gc, w - vec3(0., 1., 0.));
    float vd = dot(gd, w - vec3(1., 1., 0.));
    float ve = dot(ge, w - vec3(0., 0., 1.));
    float vf = dot(gf, w - vec3(1., 0., 1.));
    float vg = dot(gg, w - vec3(0., 1., 1.));
    float vh = dot(gh, w - vec3(1., 1., 1.));
    float gNoise = va + u.x * (vb - va) + 
            u.y * (vc - va) + 
            u.z * (ve - va) + 
            u.x * u.y * (va - vb - vc + vd) + 
            u.y * u.z * (va - vc - ve + vg) + 
            u.z * u.x * (va - vb - ve + vf) + 
            u.x * u.y * u.z * (-va + vb + vc - vd + ve - vf - vg + vh);
    return 2. * gNoise;
}

float gnoise01(vec3 x)
{
    return .5 + .5 * gnoise(x);   
}

vec2 crt(vec2 uv)
{
    float tht  = atan(uv.y, uv.x);
    float r = length(uv);
    r /= (1. - .08 * r * r); // less curve
    uv.x = r * cos(tht);
    uv.y = r * sin(tht);
    return .5 * (uv + 1.);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord / iResolution.xy;
    float t = iTime;
    float glitchAmount = SS(DURATION * .001, DURATION * AMT, mod(t, DURATION));  
    float displayNoise = 0.;
    vec3 col = vec3(0.);
    vec2 eps = vec2(3. / iResolution.x, 0.); // less chromatic aberration
    vec2 st = vec2(0.);

    // analog distortion
    float y = uv.y * iResolution.y;
    float distortion = gnoise(vec3(0., y * .01, t * 500.)) * (glitchAmount * 2. + .05); // less distortion
    distortion *= gnoise(vec3(0., y * .02, t * 250.)) * (glitchAmount * 1. + .0125); // less distortion
    ++displayNoise;
    distortion += smoothstep(.999, 1., sin((uv.y + t * 1.6) * 2.)) * .01; // less
    distortion -= smoothstep(.999, 1., sin((uv.y + t) * 2.)) * .01; // less
    st = uv + vec2(distortion, 0.);
    // chromatic aberration
    col.r += textureLod(iChannel0, st + eps + distortion, 0.).r;
    col.g += textureLod(iChannel0, st, 0.).g;
    col.b += textureLod(iChannel0, st - eps - distortion, 0.).b;
    // white noise + scanlines
    displayNoise = 0.1 * clamp(displayNoise, 0., 1.); // less noise
    col += (.08 + .35 * glitchAmount) * (hash33(vec3(fragCoord, mod(float(iFrame), 1000.))).r) * displayNoise; // less
    col -= (.12 + .35 * glitchAmount) * (sin(4. * t + uv.y * iResolution.y * 1.75)) * displayNoise; // less
    fragColor = vec4(col, 1.0);
}
