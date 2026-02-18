#version 330 core

layout(location = 0) in vec2 aPos;
layout(location = 1) in vec2 aTex;
layout(location = 2) in float aTexIndex;
layout(location = 3) in vec2 aDir;
layout(location = 4) in float aStartTime;

out vec2 vTex;
flat out float vTexIndex;
uniform float current_time;

void main()
{
    float cellW = 1.0 / 6.0;
    float cellH = 1.0 / 5.0;

    int index = int(aTexIndex);

    // Pink pawn
    float col = index%6;
    float row = int(index/6);  // top row flipped to bottom-left origin
    vTex = vec2(
        col * cellW + aTex.x * cellW,
        row * cellH + aTex.y * cellH
    );
    

    vTexIndex = aTexIndex;
    gl_Position = vec4(aPos + aDir * min(1.0, (current_time - aStartTime)*2),0.0,1.0 );

}
