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
String nome_canal;

void setup()
{
  size(1220,610);
  img_original = loadImage("ft_perfil.jpg");
  textSize(25);
}


void draw()
{
  background(255);
  image(img_original,0,0);
  nome_canal = "";
  
  if ( keyPressed )
  {
      img_transformada = inverter_cor_canal( img_original, key );
         
      image(img_transformada, img_original.width, 0);
      
      // Insere legendas
      fill(0);
      rect(0,0, img_original.width, 30 );
      rect(img_original.width, height - 30, img_original.width, height );
      fill(255);
      
      switch ( key )
      {
         case 'r':
         case 'R':
           nome_canal = "Vermelho"; 
           break;
         case 'g':
         case 'G':
           nome_canal = "Verde"; 
           break;
         case 'b':
         case 'B':
           nome_canal = "Azul"; 
           break;
         default:
           nome_canal = "R/G/B";
       } 
      
      text("Imagem Original", 5, 25 );
      text("Canal(is) " + nome_canal + " invertido(s)", img_original.width, height - 5 );
    
  } else
  {
    fill(0);
    text("Use as teclas para ver as inversões:\n R: VERMELHO \n G: VERDE \n B: AZUL \n Outra: INVERTER TUDO", img_original.width + 20, height - 150 );
  } 
 
  //noLoop();
}

// Aplica inversão de cor em 1 ou mais canais em uma imagem
// my_img: Imagem alvo da inversão de canais
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
