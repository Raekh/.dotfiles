// =============================================================================
// Samaritan Lens Grid — Ghostty shader
// =============================================================================
// Replicates Samaritan's surveillance lens grid from "Lens Grid Texture-01.png".
//
// Each tile is a 3x3 grid of inner cells with:
//   - Dark solid outer border lines (don't meet at corners — gap before +)
//   - Light + (plus/cross) marks at tile corners where tiles meet
//   - Dotted inner divider lines (same color as the +)
//   - Inner cells that occasionally flash with flat uniform brightness
//
// Pulses: 3-4 cells max lit globally, flat brightness (no fade), on for a
// few frames to ~1 second, then snap off.
// =============================================================================

// --- Configuration ---
#define TILE_PX 280.0            // Fixed tile size in pixels (window-independent)
#define OUTER_LINE_W 0.008      // Outer border line thickness (in UV)
#define INNER_DOT_W 0.005       // Inner dotted line thickness
#define INNER_DOT_LEN 0.03      // Dot segment length
#define INNER_DOT_GAP 0.02      // Gap between dots
#define PLUS_SIZE 0.018         // Size of the + mark at corners
#define PLUS_THICK 0.005        // Thickness of the + arms
#define CORNER_GAP 0.025        // Gap between outer line end and the +

#define OUTER_COLOR 0.02        // Near-black: subtly darkens over base background
#define INNER_COLOR 0.16        // Softer light lines/+ marks
#define GRID_ALPHA 0.08         // Lower overall overlay intensity

#define PULSE_BRIGHTNESS 0.02   // Subtle cell pulse, still visible
#define MAX_LIT_CELLS 4         // Maximum cells lit at once globally
#define PULSE_MIN_FRAMES 3.0    // Minimum pulse duration in frames (~50ms)
#define PULSE_MAX_SEC 1.0       // Maximum pulse duration in seconds

// --- Hash functions ---
float hash11(float p) {
    p = fract(p * 0.1031);
    p *= p + 33.33;
    p *= p + p;
    return fract(p);
}

float hash21(vec2 p) {
    vec3 p3 = fract(vec3(p.xyx) * 0.1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

// --- Determine if a global cell is lit ---
// We use a slot system: MAX_LIT_CELLS slots, each picking a random cell
// with its own timing. This guarantees at most MAX_LIT_CELLS are lit.
float isCellLit(vec2 globalCellID, float totalCellsX, float totalCellsY) {
    for (int slot = 0; slot < MAX_LIT_CELLS; slot++) {
        float fslot = float(slot);

        // Each slot has its own time offset so they don't sync up
        float slotPhase = hash11(fslot * 73.137) * 100.0;
        float t = iTime + slotPhase;

        // Each slot picks a new cell on a staggered schedule
        // Slot period: random between 0.8 and 2.5 seconds
        float slotPeriod = 0.8 + hash11(fslot * 41.7) * 1.7;
        float epoch = floor(t / slotPeriod);

        // Which cell does this slot light up in this epoch?
        float cellX = floor(hash21(vec2(epoch, fslot * 13.1)) * totalCellsX);
        float cellY = floor(hash21(vec2(epoch + 99.0, fslot * 7.3)) * totalCellsY);

        if (cellX == globalCellID.x && cellY == globalCellID.y) {
            // How long is this particular pulse? (few frames to 1 second)
            float minDur = PULSE_MIN_FRAMES / 60.0; // ~50ms
            float pulseDuration = mix(minDur, PULSE_MAX_SEC,
                                       hash21(vec2(epoch + 50.0, fslot)));

            // Where are we within this epoch?
            float elapsed = fract(t / slotPeriod) * slotPeriod;

            // Lit if we're within the pulse duration (snap on/off, no fade)
            if (elapsed < pulseDuration) {
                // Vary brightness slightly per pulse instance
                float b = PULSE_BRIGHTNESS * (0.6 + 0.4 * hash21(vec2(epoch + 200.0, fslot)));
                return b;
            }
        }
    }
    return 0.0;
}

// --- Dotted line ---
// Returns 1.0 if the point is on a dot, 0.0 if in a gap
float dottedLine(float along, float across, float lineW) {
    float dotPattern = mod(along, INNER_DOT_LEN + INNER_DOT_GAP);
    float onDot = step(dotPattern, INNER_DOT_LEN);
    float onLine = 1.0 - smoothstep(lineW * 0.5 - 0.001, lineW * 0.5, abs(across));
    return onDot * onLine;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    // Sample terminal texture
    vec2 screenUV = fragCoord.xy / iResolution.xy;
    vec4 termColor = texture(iChannel0, screenUV);

    // Compute tile coordinates — fixed pixel size (window-independent)
    float tilePixelSize = TILE_PX;
    float tilesX = ceil(iResolution.x / tilePixelSize);
    float tilesY = ceil(iResolution.y / tilePixelSize);

    // Position in tile space
    vec2 tilePos = fragCoord.xy / tilePixelSize;
    vec2 tileID = floor(tilePos);
    vec2 tileUV = fract(tilePos); // [0,1] within current tile

    // Inner cell within this tile (3x3)
    vec2 innerPos = tileUV * 3.0;
    vec2 innerCellID = floor(innerPos);
    vec2 innerCellUV = fract(innerPos); // [0,1] within inner cell

    // Global cell ID (unique across entire screen)
    vec2 globalCellID = tileID * 3.0 + innerCellID;
    float totalCellsX = tilesX * 3.0;
    float totalCellsY = tilesY * 3.0;

    // --- Draw grid elements ---
    float overlay = 0.0;     // Dark overlay (outer lines)
    float lightOverlay = 0.0; // Light overlay (+ marks, dotted inner lines)

    // === OUTER BORDER LINES ===
    // These run along each tile edge but stop short of corners (gap for +)
    float edgeL = tileUV.x;
    float edgeR = 1.0 - tileUV.x;
    float edgeB = tileUV.y;
    float edgeT = 1.0 - tileUV.y;

    // Distance from nearest corner (for gap calculation)
    float nearCornerX = min(tileUV.x, 1.0 - tileUV.x);
    float nearCornerY = min(tileUV.y, 1.0 - tileUV.y);

    // Horizontal outer lines (top and bottom of tile)
    float onHLineTop = step(edgeT, OUTER_LINE_W) * step(CORNER_GAP, nearCornerX);
    float onHLineBot = step(edgeB, OUTER_LINE_W) * step(CORNER_GAP, nearCornerX);

    // Vertical outer lines (left and right of tile)
    float onVLineLeft = step(edgeL, OUTER_LINE_W) * step(CORNER_GAP, nearCornerY);
    float onVLineRight = step(edgeR, OUTER_LINE_W) * step(CORNER_GAP, nearCornerY);

    float outerLine = max(max(onHLineTop, onHLineBot), max(onVLineLeft, onVLineRight));
    overlay = outerLine;

    // === PLUS (+) MARKS AT TILE CORNERS ===
    // The + is centered at each corner of the tile
    // Check all 4 corners
    for (int cx = 0; cx <= 1; cx++) {
        for (int cy = 0; cy <= 1; cy++) {
            vec2 corner = vec2(float(cx), float(cy));
            vec2 d = tileUV - corner;

            // Horizontal arm of +
            float hArm = step(abs(d.y), PLUS_THICK) * step(abs(d.x), PLUS_SIZE);
            // Vertical arm of +
            float vArm = step(abs(d.x), PLUS_THICK) * step(abs(d.y), PLUS_SIZE);

            lightOverlay = max(lightOverlay, max(hArm, vArm));
        }
    }

    // === INNER DOTTED LINES ===
    // Two vertical and two horizontal dotted lines dividing the tile into 3x3
    // Vertical inner lines at tileUV.x = 1/3 and 2/3
    for (int i = 1; i <= 2; i++) {
        float lineX = float(i) / 3.0;
        float acrossV = tileUV.x - lineX;
        float dotV = dottedLine(tileUV.y, acrossV, INNER_DOT_W);
        // Don't draw in the outer border zone
        float insideV = step(OUTER_LINE_W * 2.0, edgeB) * step(OUTER_LINE_W * 2.0, edgeT);
        lightOverlay = max(lightOverlay, dotV * insideV);
    }

    // Horizontal inner lines at tileUV.y = 1/3 and 2/3
    for (int i = 1; i <= 2; i++) {
        float lineY = float(i) / 3.0;
        float acrossH = tileUV.y - lineY;
        float dotH = dottedLine(tileUV.x, acrossH, INNER_DOT_W);
        float insideH = step(OUTER_LINE_W * 2.0, edgeL) * step(OUTER_LINE_W * 2.0, edgeR);
        lightOverlay = max(lightOverlay, dotH * insideH);
    }

    // === CELL PULSE ===
    float glow = isCellLit(globalCellID, totalCellsX, totalCellsY);

    // === COMPOSE ===
    vec3 color = termColor.rgb;

    // Dark outer border lines
    color = mix(color, vec3(OUTER_COLOR), overlay * GRID_ALPHA);

    // Light inner lines and + marks
    color = mix(color, vec3(1.0), lightOverlay * GRID_ALPHA * INNER_COLOR);

    // Cell pulse: flat uniform brightness, no fade
    color += vec3(glow);

    fragColor = vec4(color, termColor.a);
}
