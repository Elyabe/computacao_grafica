/* 
CENTRO UNIVERSTÁRIO NORTE DO ESPÍRITO SANTO - CEUNES/ UFES
TAREFA DE COMPUTAÇÂO GRÁFICA 2019/1
AUTOR: ELYABE ALVES SANTOS
CURSO: CIÊNCIA DA COMPUTAÇÃO
MATRÍCULA: 2014203834

OBJETIVO: Implementação de flip HORIZONTAL em imagem
CRIADO EM: 27/09/2019
PROFESSOR: Jacques Facon
*/

PImage img_original, img_transformada;
int img_largura, img_altura, k, k_transf;
color px_valor;

void setup()
{
  size(800,600);
  img_original = loadImage("presidentu.jpeg");
  img_transformada = loadImage("presidentu.jpeg");
  img_largura = img_original.width;
  img_altura = img_original.height;
}


void draw()
{
  background(255);
 
  // Carrega o array de pixels da imagem
  img_transformada.loadPixels();
  
  for ( int x = 0; x < img_largura/2; x++ )
  {
    for ( int y = 0; y < img_altura; y++ )
    {
         k = y*img_largura + x;
         k_transf = img_largura*(1+y)-x-1;
//      Executa flip
         px_valor = img_transformada.pixels[k];
         img_transformada.pixels[k] = img_transformada.pixels[k_transf];
         img_transformada.pixels[k_transf] = px_valor;
    }
  }
  
  img_transformada.updatePixels();
  
  // Plota as imagens na janela
  image(img_original,0,0);
  image(img_transformada,0,img_altura);
  
  noLoop();
}
