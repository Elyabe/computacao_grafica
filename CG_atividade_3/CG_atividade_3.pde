
// Atividade do dia 27/09
// Objetivo: Inserir e manipular imagem 

PImage imagem;
void setup()
{
  size(800,600);
  imagem = loadImage("presidentu.jpeg");
  
}


void draw()
{
  background(255);
 
   imagem.loadPixels();
  for ( int i = 0; i < imagem.width * imagem.height; i++ )
  {
    if ( imagem.pixels[i] == color(255) )
    {
      imagem.pixels[i] = color(0);
      println("trocou");
    }
  }
  
  image(imagem,0,0);
  
  noLoop();
}
