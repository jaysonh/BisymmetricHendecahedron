class CameraView
{
    CameraView()
    {
      
    }
    
    void update()
    {
      // move camera
      if(keyPressed)
      {
        cameraY = width/2.0;
        fov     = map(mouseY,0,height,0.5,0.9) * PI*2.0;
        cameraZ = cameraY / tan(fov / 2.0);
        aspect  = float(width)/float(height);
        mX      = mouseX;
      }
      translate(0,0,-cameraZ);
      //perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
      
      translate(width/2+30, height/2, 0);
      rotateX(-PI/6);
      rotateY(PI/3 + mX/float(width) * PI);
      
    }
    float mX;
    float cameraY ;
    float fov ;
    float cameraZ;
    float aspect;
}
