shader_type canvas_item;

void fragment() {
    vec4 texture_color = texture(TEXTURE, UV);
    
    if (texture_color.a > 0.0) {
        COLOR = vec4(1.0, 1.0, 1.0, texture_color.a);
    } else {
        COLOR = texture_color;
    }
}