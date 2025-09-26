
// Topographic contour shader for Ghostty
// Transparent background, white lines, alpha blending, sharp and consistent thickness

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Use normalized coordinates for terminal texture
    vec2 uv = fragCoord.xy / iResolution.xy;
    // Use fixed reference resolution for contour pattern
    vec2 referenceResolution = vec2(1920.0, 1080.0);
    vec2 uv_contour = fragCoord.xy / referenceResolution;
    // Scale up contour pattern, slightly more on vertical axis
    float scale = 0.7;
    float vertical_scale = 0.7;
    vec2 uv_scaled = uv_contour * vec2(scale, scale * vertical_scale);
    // Diagonal movement from top-left to bottom-right for contour (even slower)
    float speed = 0.0025;
    vec2 uv_moving = uv_scaled + vec2(-speed * iTime, speed * iTime);

    // Generate pseudo-elevation with more randomness and higher frequency, slowly morphing over time (reversed and even slower)
    float morph_speed = 0.0125;
    float elevation = sin(uv_moving.x * 24.0 - iTime * morph_speed) + cos(uv_moving.y * 24.0 - iTime * morph_speed);
    elevation += sin((uv_moving.x + uv_moving.y) * 16.0 - iTime * morph_speed);
    elevation += cos((uv_moving.x - uv_moving.y) * 32.0 - iTime * morph_speed) * 0.5;
    elevation += sin(uv_moving.x * 48.0 - iTime * morph_speed) * cos(uv_moving.y * 48.0 - iTime * morph_speed) * 0.3;
    elevation += sin((uv_moving.x * uv_moving.y) * 64.0 - iTime * morph_speed) * 0.2;
    elevation *= 0.5;
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
