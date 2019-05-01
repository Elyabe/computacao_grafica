
void setup()
{
  size( 800, 600, P3D );
}

int altura_predio = 120, largura_predio = 100, r_esf_arvore = 20;
int z_sol, r_sol = 30;
void draw()
{
  background(255);
  stroke(2);
  directionalLight(255, 255, 126, mouseX, mouseY, -100);

  pushMatrix();
  translate(width*0.5, height*0.8);
  //if ( mouseY > height*0.40 && mouseY < height*0.80 )
    if( keyPressed && key == 'p')
    rotateY(HALF_PI*(0.5));
    
  //rotateX(HALF_PI*0.5);
  
  //camera(mouseX, mouseY, 220.0, // eyeX, eyeY, eyeZ
  //       0.0, 0.0, 0.0, // centerX, centerY, centerZ
  //       0.0, 1.0, 0.0); // upX, upY, upZ

  fill(color(36,36,36));
  //noFill();
  box(600, 10, 300 );
  translate(0, -(int)(altura_predio/2.0)-5);
  
  fill(color(100,149,237));
  box(largura_predio,altura_predio,0.4*altura_predio);
  fill(color(36,36,36));
  box(0.3*largura_predio,altura_predio,0.4*altura_predio);
  translate(0,0, 10);
  fill(color(0,127,255));
  box(0.3*largura_predio,altura_predio,0.4*altura_predio);
  pushMatrix();
    fill(255);
    translate(0,50, 10);  
    box(0.15*largura_predio,altura_predio*0.2, 30);
  popMatrix();
  
  pushMatrix();
    fill(255);
    translate(-30, -(int)(altura_predio/8.0)-5, 5);
    box(0.2*largura_predio,altura_predio*0.3,0.2*altura_predio);
    pushMatrix();
    fill(255);
    translate(0, 10, 0);
      box(0.2*largura_predio,altura_predio*0.3,0.2*altura_predio);
    popMatrix();
    
    translate(60, 0, 0);
    box(0.2*largura_predio,altura_predio*0.3,0.2*altura_predio);
    translate(0, 10, 0);
    box(0.2*largura_predio,altura_predio*0.3,0.2*altura_predio);
  popMatrix();
  
  fill(color(139,69,19));
  noStroke();
  translate(-100, 25);
    rotateX(HALF_PI);
  desenhar_cilindro( 360, 10, 60);
  //stroke(1);
  fill(color(0,255,0));
  pushMatrix();
  translate(0,0, 30);
  sphere(r_esf_arvore);
  translate(-15,-10,0);
  sphere(r_esf_arvore);
  translate(30,0);
  sphere(r_esf_arvore);
  translate(-15,0,15);
  sphere(r_esf_arvore);
  popMatrix();
  
  //translate(-10,0);
  //sphere(r_esf_arvore);
  //translate(-15,0);
  //sphere(r_esf_arvore);
  
  
  
  fill(255);
  popMatrix();
  
  
  translate(mouseX, mouseY);
  fill(255,153,81);

    rotateX(HALF_PI);
    
    //beginShape();
    //vertex(-100, -100, -100);
    //vertex( 100, -100, -100);
    //vertex(   0,    0,  100);
    
    //vertex( 100, -100, -100);
    //vertex( 100,  100, -100);
    //vertex(   0,    0,  100);
    
    //vertex( 100, 100, -100);
    //vertex(-100, 100, -100);
    //vertex(   0,   0,  100);
    
    //vertex(-100,  100, -100);
    //vertex(-100, -100, -100);
    //vertex(   0,    0,  100);
    //endShape();
  
  
  
  
  
}


void desenhar_cilindro(int sides, float r, float h)
{
    float angle = 360 / sides;
    float halfHeight = h / 2;
    // draw top shape
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        vertex( x, y, -halfHeight );    
    }
    endShape(CLOSE);
    // draw bottom shape
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        vertex( x, y, halfHeight );    
    }
    endShape(CLOSE);
    
    // draw body
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
      float x = cos( radians( i * angle ) ) * r;
      float y = sin( radians( i * angle ) ) * r;
      vertex( x, y, halfHeight);
      vertex( x, y, -halfHeight);    
  }
  endShape(CLOSE);
} 
