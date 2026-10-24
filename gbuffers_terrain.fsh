#version 330 compatibility

uniform sampler2D texture;   // The main block textures
uniform sampler2D lightmap;  // Minecraft's lightmap (torch light/sky light)

in vec2 texCoord;
in vec2 lmCoord;
in vec4 glColor;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 fragColor;

void main() {
    // Sample the color of the block texture
    vec4 blockTexture = texture2D(texture, texCoord);
    
    // Sample the lightmap color
    vec4 light = texture2D(lightmap, lmCoord);
    
    // Combine texture, biome color tint, and light
    vec4 finalColor = blockTexture * glColor * light;
    
    // Output the final color to the screen
    fragColor = finalColor;
}
