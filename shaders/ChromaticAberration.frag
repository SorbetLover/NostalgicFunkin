//Shader by mr.Wifi7

#pragma header

vec2 uv = openfl_TextureCoordv.xy;
uniform float iTime;

void main(void)
{
    float amount = 0.0;
	amount *= 0.05;

    float amount2 = 0.0;
	amount2 *= 0.05;
	
	amount = (sin(iTime*4.0)) * 0.004; //Itime*4.0 = Speed ( Example: more speed = iTime*10.0 )
    amount2 = (cos(iTime*4.0)) * 0.004; // * 0.004 = offsets ( Example: less offset = * 0.001 )
	


    vec4 col;
    col.r = texture2D(bitmap, vec2(uv.x + amount, uv.y + amount2)).r;
    col.g = texture2D(bitmap, vec2(uv.x, uv.y)).g;
    col.b = texture2D(bitmap, vec2(uv.x - amount, uv.y - amount2)).b;
    col.a = (texture2D(bitmap, vec2(uv.x + amount, uv.y + amount2)).a + texture2D(bitmap, vec2(uv.x - 0.01, uv.y)).a + texture2D(bitmap, vec2(uv.x, uv.y)).a)/3;
    gl_FragColor = col;
}