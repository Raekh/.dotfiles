
// Topographic contour shader for Ghostty
// Transparent background, white lines, alpha blending, sharp and consistent thickness

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Use normalized coordinates for terminal texture
    vec2 uv = fragCoord.xy / iResolution.xy;
    // Animate elevation vertically over time, seamless and cyclic every 30s
    float cycle_length = 30.0;
    float movement_phase = fract(iTime / cycle_length);
    vec2 uv_moving = uv + vec2(0.0, movement_phase);

    // Wild but continuous base pattern for elevation (no grid artifacts)
    float elevation = 0.0;
    elevation += sin(uv_moving.x * 13.7 + uv_moving.y * 7.3);
    elevation += cos(uv_moving.x * 8.2 - uv_moving.y * 15.4);
    elevation += sin((uv_moving.x + uv_moving.y) * 11.5);
    elevation += cos((uv_moving.x - uv_moving.y) * 17.9);
    elevation += sin(uv_moving.x * 21.3 + uv_moving.y * 19.8);
    elevation += cos(uv_moving.x * 29.1 + uv_moving.y * 31.7);
    elevation *= 0.25; // Normalize amplitude
    elevation = mod(elevation, 2.0 * 3.14159); // wrap elevation to [0, 2π)

    // Create denser and sharp contour lines using modulo and fixed thickness
    float thickness = 0.06;
    float contourPeriod = 1.0;
    float contour = mod(elevation * 8.0, contourPeriod) - contourPeriod * 0.5;
    // Sharp, consistently thick lines with minimal antialiasing
    float dist = abs(contour);
    float aa = fwidth(dist) * 1.5; // Small antialias band
    float line = 1.0 - smoothstep(thickness * 0.5 - aa, thickness * 0.5 + aa, dist); // Sharp, full lines

    // White color for lines
    vec3 lineColor = vec3(1.0);
    float lineAlpha = line * 0.05; // Very subtle lines

    // Sample terminal texture
    vec4 termColor = texture(iChannel0, uv);

    // Blend lines over terminal, preserve alpha
    vec3 finalColor = mix(termColor.rgb, lineColor, lineAlpha);
    float finalAlpha = max(termColor.a, lineAlpha);

    fragColor = vec4(finalColor, finalAlpha);
}
