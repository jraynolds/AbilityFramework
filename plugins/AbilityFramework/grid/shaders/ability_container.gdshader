shader_type canvas_item;

uniform float outline_width : hint_range(1.0, 10.0) = 4.0;
uniform vec4 outline_color : source_color = vec4(1.0, 1.0, 0.0, 1.0);

void fragment() {
    // Calculate distance to the nearest edge of the texture or region
    float dist_x = min(UV.x, 1.0 - UV.x);
    float dist_y = min(UV.y, 1.0 - UV.y);

    // Create an outline by checking if the fragment is within the border width
    float border_x = smoothstep(1.0 - outline_width, 1.0, dist_x);
    float border_y = smoothstep(1.0 - outline_width, 1.0, dist_y);
    float border = min(border_x, border_y);

    // Set the color to the outline color or transparent
    COLOR = mix(outline_color, vec4(1.0, 1.0, 1.0, 0.0), border);
}
