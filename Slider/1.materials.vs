// bass
#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;

out vec3 FragPos;
out vec3 Normal;
out vec3 Pos;

const float amplitude = 0.125;
const float frequency = 4;
const float PI = 3.14159;

varying float x;
varying float y;
varying float z;
uniform float t;
uniform float b1;
uniform float b2;
uniform float b3;
uniform int op;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
    float distance = length(aPos);

    y = amplitude*sin(b1*distance)*0.8f;

    x = amplitude*sin(b2*distance)*0.8f;

    if (op != 0) z = amplitude*sin(b3*distance)*0.8f;
    else z = 0.0f;

    FragPos = vec3(aPos.x-x, aPos.y-y, aPos.z-z);
    Pos = aPos;

    Normal = mat3(transpose(inverse(model))) * aNormal;

    gl_Position = projection * view *model* vec4(FragPos, 1.0);
    gl_PointSize = 3.0f;
}
