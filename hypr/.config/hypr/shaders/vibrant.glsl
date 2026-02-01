#version 300 es
precision mediump float;

// Use 'in' instead of 'varying' for GLSL 300 es
in vec2 v_texcoord;
uniform sampler2D tex;

// Define a custom output variable
out vec4 fragColor;

void main() {
    // texture() is used instead of texture2D() in 300 es
    vec4 pixColor = texture(tex, v_texcoord);
    
    // Calculate luminance for grayscale baseline
    vec3 grayBaseline = vec3(dot(pixColor.rgb, vec3(0.299, 0.587, 0.114)));
    
    // Apply saturation (1.4 is your vibrance level)
    pixColor.rgb = mix(grayBaseline, pixColor.rgb, 1.4); 
    
    fragColor = pixColor;
}
