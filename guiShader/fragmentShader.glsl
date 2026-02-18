#version 330 core

in vec2 vTex;

out vec4 FragColor;

uniform sampler2D uTexture;

void main()
{
    // Just sample the texture and output it
    FragColor = texture(uTexture, vTex);
}
