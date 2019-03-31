/* 
CENTRO UNIVERSTÁRIO NORTE DO ESPÍRITO SANTO - CEUNES/ UFES
TAREFA DE COMPUTAÇÂO GRÁFICA 2019/1
AUTOR: ELYABE ALVES SANTOS
CURSO: CIÊNCIA DA COMPUTAÇÃO
MATRÍCULA: 2014203834

OBJETIVO: Implementação de transformações (Reflexão) em imagem
CRIADO EM: 27/09/2019
PROFESSOR: Jacques Facon
*/

PImage img_original, img_transformada;
String flip_aplicado;

void setup()
{
  size(620,560);
  img_original = loadImage("presidentu.jpeg");
  textSize(25);
}


void draw()
{
  background(255);
  image(img_original,0,0);
  flip_aplicado = "Imagem Original";
  
  if ( keyPressed )
  {
      if ( keyCode == UP || keyCode == DOWN ){
        // Flip vertical
        img_transformada = refletir_eixo_x( img_original );
        flip_aplicado = "Flip VERTICAL";
      } else if ( keyCode == RIGHT || keyCode == LEFT ) {
        // Flip horizontal
        img_transformada = refletir_eixo_y( img_original );
        flip_aplicado = "Flip HORIZONTAL";
      } else 
        img_transformada = img_original;
     
     image(img_transformada, 0, img_original.height);
      
      // Insere legendas
      fill(0);
      rect(img_original.width/2 - 5,0, img_original.width, 30 );
      rect(img_original.width/2 - 5, height - 30, img_original.width, height );
      fill(255);
      text("Imagem Original", img_original.width/2, 25 );
      text(flip_aplicado, img_original.width/2, height - 5 );
      
  } else
  {
    fill(0);
    text("Use as teclas para ver as transformações:\n ESQUERDA/DIREITA para Flip Horizontal\n CIMA/BAIXO para Flip Vertical ", 0, height - 150 );
  } 
 
  //noLoop();
}

// Aplica transformação de reflexão HORIZONTAL em uma imagem
// my_img: Imagem a ser 'flipada'
PImage refletir_eixo_y( PImage img_original )
{
  
  PImage img = img_original.copy();
  img.loadPixels();
  
  int img_altura = img.height, img_largura = img.width,  k, k_transf;;
  color px_valor;
  
  for ( int x = 0; x < img_largura/2; x++ )
  {
    for ( int y = 0; y < img_altura; y++ )
    {
         // mapeia k |-> k_transf 
         // (x,y) -> (-x,y) porém só existem coordenadas positivas aqui 
         // Com ajuste, (x,y) |-> (largura-1-x, y)
         k = y*img_largura + x;
         k_transf = img_largura*(1+y)-x-1;
//      Executa flip
         px_valor = img.pixels[k];
         img.pixels[k] = img.pixels[k_transf];
         img.pixels[k_transf] = px_valor;
    }
  }
  
  img.updatePixels();
  
  return img;
}

// Aplica transformação de reflexão VERTICAL em uma imagem
// my_img: Imagem a ser 'flipada'
PImage refletir_eixo_x( PImage img_original )
{
  
  PImage img = img_original.copy();
  img.loadPixels();
  
  int img_altura = img.height, img_largura = img.width,  k, k_transf;;
  color px_valor;
  
  for ( int x = 0; x < img_largura; x++ )
  {
    for ( int y = 0; y < img_altura/2; y++ )
    {
         // mapeia k |-> k_transf 
         // (x,y) -> (x,-y) porém só existem coordenadas positivas aqui 
         // Com ajuste, (x,y) |-> (x, altura-1-y)
         k = y*img_largura + x;
         k_transf = ( img_altura - 1 - y )*img_largura + x;
//      Executa flip
         px_valor = img.pixels[k];
         img.pixels[k] = img.pixels[k_transf];
         img.pixels[k_transf] = px_valor;
    }
  }
  
  img.updatePixels();
  
  return img;
}
