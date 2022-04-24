/* Created by Brandon Woolworth on 6/18/2017 */

/* Some simple precompilation stuff, so we don't have to recreate it later. */
#define rgb(r,g,b) vec3(r/255., g/255., b/255.)
#define desiredColor rgb(255., 0., 0.)
#define burntOrange rgb(250., 75., 30.)

/**
 * Draw a rectangle
 * @param vec2 uv      - Current position of the gl_FragCoord (x and y) 
 * @param vec2 pos     - Desired position to draw the center of the rectangle
 * @param float width  - Desired width of the rectangle stemming from the center
 * @param float height - Desired height of the rectangle stemming from the center
 * @param vec3 color   - Desired color of the rectangle
 */
 
 #ifdef GL_ES
 precision mediump float;
 #endif
 
uniform vec2 iResolution;
uniform float time;
 
vec4 rectangle(vec2 uv, vec2 pos, float width, float height, vec3 color) {
  float t = 0.0;
    if ((uv.x > pos.x - width / 2.0) && (uv.x < pos.x + width / 2.0)
    && (uv.y > pos.y - height / 2.0) && (uv.y < pos.y + height / 2.0)) {
    t = 1.0;
  }
  return vec4(color, t);
}

/**
 * Main function
 * @param vec4 FragColor - The "out" result of the color that this fragment is supposed to render as.
 * @param vec2 gl_FragCoord - The "in" position of the current fragment.
 *
 * Essentially, you want to check the gl_FragCoord for a position that is within bounds of where you want to draw a special shape.
 * Rectangle function checks the uv against the desired rectangle coordinates.
 *
 * A fragment shader file, such as this, will go through all of the changing pixels and check it within the mainImage function,
 *   then display it to the screen. Keep these functions small, because it will lag a TON--especially on browsers--if it must
 *   do a lot of calculation.
 */
void main()
{
  uv[1] = uv[1]*0.25
  vec2 uv = gl_FragCoord.xy;
    
    // Create a rectangle at the center screen with width 2/4 the screen and size 2/4 screen
    vec2 desiredPos = iResolution.xy * 0.5;
    float width = iResolution.x  * 0.25;
    float height = width;
    vec4 rectOne = rectangle(uv, desiredPos, width, height, desiredColor);
    
    // Create a rectangle to show in the background of the screen
    vec2 fullScreen = vec2(0., 0.);
    float fullWidth = iResolution.x;
    float fullHeight = iResolution.y;
    vec4 backgroundRect = rectangle(uv, fullScreen, fullWidth, fullHeight, burntOrange);
    
    // Divide the colors accordingly.
    // Keeps the backgroundRect separate from rectOne, while also producing a color to set gl_FragColor to.
  gl_FragColor = mix(backgroundRect, rectOne, rectOne.a);
}
