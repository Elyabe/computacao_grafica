// Atividade 2 de Computação Gráfica
// Elyabe Alves

int margem_predio = 20, margem_chao = 10;
PVector pos_predio = new PVector( 30, 40 ) ;
float predio_altura = 0.5, predio_largura = 0.2;

void setup()
{
  size( 800, 600 );  
}


void draw()
{
   rect( pos_predio.x, height * 0.5 - margem_chao, width * predio_largura, height * predio_altura );
   
  
}
