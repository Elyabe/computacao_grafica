/* 
CENTRO UNIVERSTÁRIO NORTE DO ESPÍRITO SANTO - CEUNES/ UFES
TAREFA DE COMPUTAÇÂO GRÁFICA 2019/1
AUTOR: ELYABE ALVES SANTOS
CURSO: CIÊNCIA DA COMPUTAÇÃO
MATRÍCULA: 2014203834

OBJETIVO: Reproduzir a bandeira de um pais em 3D com iluminação direcional
CRIADO EM: 08/05/2019
PROFESSOR: Jacques Facon
*/

void setup()
{
  size( 1200, 800, P3D);
}

int raio_lua = 200;
float dl_y, dl_x;
float angulo = 0, angulo_lua = 0;
void draw()
{
  //Quando completa a rotação, zera de novo
  angulo = angulo % 360;
  angulo++;
  
  angulo_lua = angulo_lua % 360;
  angulo_lua += 0.5;
  
  dl_y = (mouseY / float(height) - 0.5) * 2;
  dl_x = (mouseX / float(width) - 0.5) * 2;
  directionalLight(204, 204, 204, -dl_x, -dl_y, -1);
  
  fill(#363636);
  background(255);
  pushMatrix();
    translate(width/2, height/2 + 2*raio_lua );
    sphere(raio_lua);
  popMatrix();
  pushMatrix();
    translate(width/2, height/2 );
    scale(0.5);
    rotateY(radians(angulo));
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
    estrela( 300, 160, 20, 8, 8 );
  popMatrix();
  
  pushMatrix();
    translate(width/2, height/2+raio_lua, 0);
    box(20,400,20);
  popMatrix();
  
  
  
}

// Estrela da bandeira
void estrela(float x, float y, float radius1, float radius2, int npoints) 
{
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
