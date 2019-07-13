//PImage tex, lado1, lado2, lado3, lado4, lado5, lado6;
//float rotx = PI/4;
//float roty = PI/4;

//float angulo = 0, angulo_lua = 0;
//void setup() {
//  size(640, 360, P3D);
//  lado1 = loadImage("lado1.png");
//  lado2 = loadImage("lado2.png");
//  lado3 = loadImage("lado3.png");
//  lado4 = loadImage("lado4.png");
//  lado5 = loadImage("lado5.png");
//  lado6 = loadImage("lado6.png");
//  textureMode(NORMAL);
//  fill(255);
//  stroke(color(44,48,32));
//}

//void draw() {
//  angulo = angulo % 360;
//  angulo++;
//  background(0);
//  noStroke();
//  translate(width/2.0, height/2.0, -100);
//  rotateY(radians(angulo));
//  rotateX(rotx);
//  rotateY(roty);
//  scale(90);
//  TexturedCube(tex);
//}

//void TexturedCube(PImage tex) {
//  beginShape(QUADS);
//  texture(lado1);

//  // Given one texture and six faces, we can easily set up the uv coordinates
//  // such that four of the faces tile "perfectly" along either u or v, but the other
//  // two faces cannot be so aligned.  This code tiles "along" u, "around" the X/Z faces
//  // and fudges the Y faces - the Y faces are arbitrarily aligned such that a
//  // rotation along the X axis will put the "top" of either texture at the "top"
//  // of the screen, but is not otherwised aligned with the X/Z faces. (This
//  // just affects what type of symmetry is required if you need seamless
//  // tiling all the way around the cube)
  
//  // +Z "front" face
//  vertex(-1, -1,  1, 0, 0);
//  vertex( 1, -1,  1, 1, 0);
//  vertex( 1,  1,  1, 1, 1);
//  vertex(-1,  1,  1, 0, 1);
//  endShape();
  
//  beginShape(QUADS);
//  texture(lado2);
//  // -Z "back" face
//  vertex( 1, -1, -1, 0, 0);
//  vertex(-1, -1, -1, 1, 0);
//  vertex(-1,  1, -1, 1, 1);
//  vertex( 1,  1, -1, 0, 1);
//  endShape();
  
//  beginShape(QUADS);
//  texture(lado3);
//  // +Y "bottom" face
//  vertex(-1,  1,  1, 0, 0);
//  vertex( 1,  1,  1, 1, 0);
//  vertex( 1,  1, -1, 1, 1);
//  vertex(-1,  1, -1, 0, 1);
//  endShape();
  
//  beginShape(QUADS);
//  texture(lado4);
//  // -Y "top" face
//  vertex(-1, -1, -1, 0, 0);
//  vertex( 1, -1, -1, 1, 0);
//  vertex( 1, -1,  1, 1, 1);
//  vertex(-1, -1,  1, 0, 1);
//  endShape();
  
//  beginShape(QUADS);
//  texture(lado5);
//  // +X "right" face
//  vertex( 1, -1,  1, 0, 0);
//  vertex( 1, -1, -1, 1, 0);
//  vertex( 1,  1, -1, 1, 1);
//  vertex( 1,  1,  1, 0, 1);
//  endShape();
  
// beginShape(QUADS);
//  texture(lado6);
//  // -X "left" face
//  vertex(-1, -1, -1, 0, 0);
//  vertex(-1, -1,  1, 1, 0);
//  vertex(-1,  1,  1, 1, 1);
//  vertex(-1,  1, -1, 0, 1);
//  endShape();
//}

//void mouseDragged() {
//  float rate = 0.01;
//  rotx += (pmouseY-mouseY) * rate;
//  roty += (mouseX-pmouseX) * rate;
//}
