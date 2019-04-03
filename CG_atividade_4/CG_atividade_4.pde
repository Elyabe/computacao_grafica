/* 
CENTRO UNIVERSTÁRIO NORTE DO ESPÍRITO SANTO - CEUNES/ UFES
TAREFA DE COMPUTAÇÂO GRÁFICA 2019/1
AUTOR: ELYABE ALVES SANTOS
CURSO: CIÊNCIA DA COMPUTAÇÃO
MATRÍCULA: 2014203834

OBJETIVO: Implementação de inversão de cores de canais de imagem
CRIADO EM: 03/04/2019
PROFESSOR: Jacques Facon
*/

PImage img_original, img_transformada;
String flip_aplicado;

void setup()
{
  size(620,1020);
  img_original = loadImage("ft_perfil.jpg");
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
          img_transformada = inverter_cor_canal( img_original, 'r' );
          flip_aplicado = "Flip VERTICAL";
        } else if ( keyCode == LEFT ) {
          // Flip horizontal
          img_transformada = inverter_cor_canal( img_original, 'g' );
          flip_aplicado = "Flip HORIZONTAL";
        } else if ( keyCode == RIGHT ) {
          img_transformada = inverter_cor_canal( img_original, 'b' );
        } else
          img_transformada = inverter_cor_canal( img_original, 't' );
         
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
PImage inverter_cor_canal( PImage img_original, char canal )
{
  
  PImage img = img_original.copy();
  img.loadPixels();
  
  int img_altura = img.height, img_largura = img.width,  k, k_transf;;
  color px_valor, px_invertido;
  
  // Não precisa ser bidimensional : 
  for ( int x = 0; x < img_largura * img_altura; x++ )
  {
         px_invertido = px_valor = img.pixels[x];
         switch ( canal )
         {
           case 'r':
           case 'R':
             px_invertido = color( 255 - red(px_valor), green(px_valor), blue(px_valor)); 
             break;
           case 'g':
           case 'G':
             px_invertido = color( red(px_valor), 255 - green(px_valor), blue(px_valor)); 
             break;
           case 'b':
           case 'B':
             px_invertido = color( red(px_valor), green(px_valor), 255 - blue(px_valor)); 
             break;
           default:
             px_invertido = color( 255-red(px_valor), 255-green(px_valor), 255 - blue(px_valor));
         }
         img.pixels[x] =  px_invertido;
  }
  
  img.updatePixels();
  
  return img;
}
