
Hendecahedron h;

void setup()
{
  size(800,800, P3D); 
  
  h = new Hendecahedron();
}

void draw()
{
  lights();
  background(0);
  
  float cameraY = width/2.0;
  float fov = mouseY/float(height) * PI/2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  
  translate(width/2+30, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/3 + mouseX/float(width) * PI);
 
  h.draw();
}
