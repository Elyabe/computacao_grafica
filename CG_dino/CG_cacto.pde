///* 
//CENTRO UNIVERSTÁRIO NORTE DO ESPÍRITO SANTO - CEUNES/ UFES
//TAREFA DE COMPUTAÇÂO GRÁFICA 2019/1
//AUTOR: ELYABE ALVES SANTOS
//CURSO: CIÊNCIA DA COMPUTAÇÃO
//MATRÍCULA: 2014203834

//OBJETIVO: Atividade de texturização
//CRIADO EM: 22/05/2019
//PROFESSOR: Jacques Facon
//*/

//PImage tex;
//float rotx = PI/4;
//float roty = PI/4;

//float angulo = 0, angulo_lua = 0;
//void setup() {
//  size(800, 600, P3D);
//  fill(255);
//  stroke(0);
//}

//void draw() {
//  background(0);
//  noStroke();
//  translate(width/2.0, height/2.0, -100);
//  rotateY(radians(angulo));
//  rotateX(rotx);
//  rotateY(roty);
//  criar_cacto();
//}

//void criar_cacto()
//{  
//    stroke(0);
//  pushMatrix();
  
//    translate(0,0);//cubo caule
//    box(50,300,60);

//      pushMatrix();
//        translate(0,-155);//cubo do topo
//        box(35,10,40);
//      popMatrix();
    
//      pushMatrix();
  
//          //galho direito do cacto
          
//          translate(42,40);//cubo 1 inferior
//          box(35,30,60);
       
//          pushMatrix();
//            translate(22,0);//cubo 2 quina 1
//            box(10,10,60);
//          popMatrix();
          
//          pushMatrix();
//            translate(27,-10);//cubo 3 quina 2
//            box(20,10,60);
//          popMatrix();
          
//          pushMatrix();
//            translate(29,-20);//cubo 4 base do galho
//            box(33,10,60);
//          popMatrix();
          
//          pushMatrix();
//            translate(32,-75);//cubo 5 galho
//            box(39,100,60);
            
//            pushMatrix();
//              translate(0,-55);//cubo 6 topo do galho
//              box(25,5,40);
//            popMatrix();
            
//          popMatrix();
          
//      popMatrix();
      
      
//pushMatrix();
  
//          /*galho esquerdo do cacto*/
          
//          translate(-42,45);//cubo 1 inferior
//          box(-35,-35,60);
       
//          pushMatrix();
//            translate(-24,0);//cubo 2 quina 1
//            box(14,10,60);
//          popMatrix();
          
//          pushMatrix();
//            translate(-27,-15);//cubo 3 quina 2
//            box(-20,15,60);
//          popMatrix();
          
//          pushMatrix();
//            translate(-29,-25);//cubo 4 base do galho
//            box(-35,-10,60);
//          popMatrix();
          
//          pushMatrix();
//            translate(-29,-70);//cubo 5 galho
//            box(-35,-80,60);
            
//            pushMatrix();
//              translate(0,-44);//cubo 6 topo do galho
//              box(-25,-5,40);
//            popMatrix();
            
//          popMatrix();
          
//      popMatrix();
//  popMatrix();
  
  
// /* pushMatrix();
  
//          galho esquerdo do cacto
          
//          translate(-42,-40);//cubo 1 inferior
//          box(35,30,60);
       
//          pushMatrix();
//            translate(-22,0);//cubo 2 quina 1
//            box(10,10,60);
//          popMatrix();
          
//          pushMatrix();
//            translate(-27,10);//cubo 3 quina 2
//            box(20,10,60);
//          popMatrix();
          
//          pushMatrix();
//            translate(-29,20);//cubo 4 base do galho
//            box(35,10,60);
//          popMatrix();
          
//          pushMatrix();
//            translate(-29,75);//cubo 5 galho
//            box(35,100,60);
            
//            pushMatrix();
//              translate(0,55);//cubo 6 topo do galho
//              box(25,5,40);
//            popMa?trix();
            
//          popMatrix();
          
//      popMatrix();
//  popMatrix();
//  */
  
   
//}   

 

//void mouseDragged() {
//  float rate = 0.01;
//  rotx += (pmouseY-mouseY) * rate;
//  roty += (mouseX-pmouseX) * rate;
//}
