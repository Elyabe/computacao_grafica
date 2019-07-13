/* 
CENTRO UNIVERSTÁRIO NORTE DO ESPÍRITO SANTO - CEUNES/ UFES
TAREFA DE COMPUTAÇÂO GRÁFICA 2019/1
AUTOR: ELYABE ALVES SANTOS
CURSO: CIÊNCIA DA COMPUTAÇÃO
MATRÍCULA: 2014203834

OBJETIVO: Modelo do dino trabalho final
CRIADO EM: 28/05/2019
PROFESSOR: Jacques Facon
*/

PImage tex;
float rotx = PI/4;
float roty = PI/4;

float angulo = 0, angulo_lua = 0;
void setup() {
  size(800, 800, P3D);
  fill(255);
  stroke(1);
}

void draw() {
  background(0);
  //noStroke();
  translate(width/2.0, height/2.0, -100);
  rotateY(radians(angulo));
  rotateX(rotx);
  rotateY(roty);
  criar_dino();
}

void criar_dino() 
{
    box(150);
    pushMatrix();
      translate(38,-112);
      box(75,75,150);
      
      pushMatrix();
      translate(-55,15);
      box(40,50,130);
      popMatrix();
      
      pushMatrix();
        translate(10,-50);
        box(50,25,150);
      popMatrix();
      
      //cabeca
      pushMatrix();
        translate(50,-105);
        box(90,90,150);
        //boca
        translate(85,35);
        box(80,20,150);
        // boca cima
        
        translate(0,-70);
        box(140,90,150);
        
        pushMatrix();
        translate(-115,-25);
        box(30,40,150);
        popMatrix();
        
        translate(-30,-50);
        box(170,20,150);
      popMatrix();
      
      // Peitoral
      translate(62,28);
      box(60,180,150);
      
      
      
      // Pata
      pushMatrix();
          translate(40,-20,45);
          box(25,25,20);
          translate(20,10,0);
          box(25,45,20);
      popMatrix();
      
      pushMatrix();
          translate(40,-20,-45);
          box(25,25,20);
          translate(20,10,0);
          box(25,45,20);
      popMatrix();
    popMatrix();
    
    pushMatrix();
       translate(95,20);
       box(40,32,150);
       translate(-10,25);
       box(20,20,150);
    popMatrix();
    
    
    pushMatrix();
      translate(-110,-36);
      box(75,75,150);
      pushMatrix();
        translate(-15,-48);
        box(45,20,100);
        translate(-8,-15);
        box(30,10,80);
      popMatrix();
      
      pushMatrix();
        translate(-50,-40);
        box(25,160,70);
      popMatrix();
      
      
      translate(10,55);
      box(55,35,150);
      translate(15,26);
       box(20,20,150);
    popMatrix();
    
    // Pé
    pushMatrix();
      translate(-15,80,-35);
      box(70,20,40);
      translate(0,30);
      box(30,80,40);
      
      translate(15,40);
      box(60,20,40);
    popMatrix();
    
    pushMatrix();
      translate(0,80,40);
      box(70,20,40);
      translate(0,30);
      box(30,80,40);
      
      translate(15,40);
      box(60,20,40);
    popMatrix();
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}
