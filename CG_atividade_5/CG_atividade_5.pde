/* 
CENTRO UNIVERSTÁRIO NORTE DO ESPÍRITO SANTO - CEUNES/ UFES
TAREFA DE COMPUTAÇÂO GRÁFICA 2019/1
AUTOR: ELYABE ALVES SANTOS
CURSO: CIÊNCIA DA COMPUTAÇÃO
MATRÍCULA: 2014203834

OBJETIVO: Implementação de conversão de imagem colorida para tons de cinza
CRIADO EM: 06/04/2019
PROFESSOR: Jacques Facon
*/

PImage img_original, img_transformada;
String nome_metodo;

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
  nome_metodo = "";
  
  if ( keyPressed )
  {
      img_transformada = converter_tons_cinza( img_original, key );
         
      image(img_transformada, img_original.width, 0);
      
      // Insere legendas
      fill(0);
      rect(0,0, img_original.width, 30 );
      rect(img_original.width, height - 30, img_original.width, height );
      fill(255);
      
      switch ( key )
      {
         case '1':
           nome_metodo = "Média"; 
           break;
         case '2':
           nome_metodo = "Canal máximo";   
           break;
         default:
           nome_metodo = "Clássico (0.29R + 0.59G + 0.11B)";
           break;
       } 
      
      text("Imagem Original", 5, 25 );
      text("Método: " + nome_metodo, img_original.width, height - 5 );
    
  } else
  {
    fill(0);
    text("Use as teclas para ver as conversões:\n 1: Método da média de canais \n 2: Método do canal máximo", img_original.width + 20, height - 150 );
  } 
 
  //noLoop();
}

// Aplica conversão em tons de cinza em uma imagem
// my_img: Imagem alvo da conversão
PImage converter_tons_cinza( PImage img_original, char metodo )
{
  
  PImage img = img_original.copy();
  img.loadPixels();
  
  int img_altura = img.height, img_largura = img.width;
  color px_valor;
  float valor_componente, r_valor, g_valor, b_valor;
  
  // Não precisa ser bidimensional : 
  for ( int x = 0; x < img_largura * img_altura; x++ )
  {
        px_valor = img.pixels[x];
        r_valor = red(px_valor);
        g_valor = green(px_valor);
        b_valor = red(px_valor);
        
        switch( metodo )
        {
          case '1':
            valor_componente = ( r_valor + g_valor + b_valor )/3;
            break;
          case '2':
            valor_componente = Math.max( Math.max( r_valor, g_valor), b_valor );
            break;
          default:
            valor_componente = 0.29*r_valor  + 0.59*g_valor + 0.11*b_valor; 
        }
        
        img.pixels[x] =  color( valor_componente, valor_componente, valor_componente );
  }
  
  img.updatePixels();
  
  return img;
}
