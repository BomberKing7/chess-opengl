#version 330 core

in vec2 vTex;
flat in float vTexIndex;

out vec4 FragColor;

uniform sampler2D uTexture;

void main()
{
    // Chessboard & piece texture sampling
    // (vTexIndex is available if you want
    // to switch between multiple texture atlases later)
    FragColor = texture(uTexture, vTex);
}
