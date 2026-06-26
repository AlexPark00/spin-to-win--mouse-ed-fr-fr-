shader_type canvas_item;

uniform vec4 line_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);

void fragment() {
    vec4 texture_color = texture(TEXTURE, UV);
    
    if (texture_color.a > 0.0) {
        COLOR = vec4(line_color.r, line_color.g, line_color.b, texture_color.a);
    } else {
        COLOR = texture_color;
    }
}