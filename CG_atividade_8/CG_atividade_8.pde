
void setup()
{
  size( 800, 600);
}


void draw()
{
  fill(#1e90ff);
  rect(10,10,500,100);
  fill(#e00034);
  rect(10,110,500,100);
  fill(#00ae65);
  rect(10,210,500,100);
  fill(255);
  circle(250,160,90);
  fill(#e00034);
  circle(260,160,70);
  fill(255);
  star( 300, 160, 20, 8, 8 );
  
}


void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
