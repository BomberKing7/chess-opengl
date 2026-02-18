#version 330 core

layout(location = 0) in vec2 aPos;
layout(location = 1) in vec2 aTex;
layout(location = 2) in float aTexIndex;
layout(location = 3) in vec2 center;      // optional for animation
layout(location = 4) in float aStartTime; // optional

out vec2 vTex;
uniform float move_time;
uniform float current_time;
void main()
{
    float cellW = 1.0 ;
    float cellH = 1.0 /6.0;

    int index = int(aTexIndex);

    // Pink pawn
    float col = 0;
    float row = 6-index-1;  // top row flipped to bottom-left origin
    vTex = vec2(
        col * cellW + aTex.x * cellW,
        row * cellH + aTex.y * cellH
    );

    float t = abs(sin(current_time - move_time)) / 10.0; // small oscillation
    vec2 pos = center + (aPos - center) * (1.0 + t);    // scale relative to center
    gl_Position = vec4(pos, 0.0, 1.0);                  // vec4 for OpenGL

}
