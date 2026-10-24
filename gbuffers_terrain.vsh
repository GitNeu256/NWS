#version 330 compatibility

out vec2 texCoord;
out vec2 lmCoord;
out vec4 glColor;

void main() {
    // Transform block vertices to screen space
    gl_Position = gl_ProjectionMatrix * gl_ModelViewMatrix * gl_Vertex;
    
    // Pass texture coordinates to the fragment shader
    texCoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
    
    // Pass lightmap coordinates (sky light and block light)
    lmCoord  = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
    
    // Pass the vertex color (used for biome tints like grass and leaves)
    glColor  = gl_Color;
}
