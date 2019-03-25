// Atividade 2 de Computação Gráfica
// Elyabe Alves

int margem_predio = 20, margem_chao;
PVector pos_predio = new PVector( 30, 40 ) ;
PVector pos_portao;
float p_predio_altura = 0.5, p_predio_largura = 0.2;
float p_portao_altura = 0.2, p_portao_largura = 0.5;
void setup()
{
  size( 800, 600 );  
  margem_chao = int(0.005 * height);
}


void draw()
{
  int predio_altura = int(height * p_predio_altura);
  int predio_largura = int(width * p_predio_largura);
  
  int portao_altura = int(p_portao_altura * predio_altura), portao_largura = int(p_portao_largura * predio_largura) ;
  // Corpo do predio
  rect( pos_predio.x, predio_altura - margem_chao, predio_largura, predio_altura );
  // Portao
  pos_portao = new PVector( pos_predio.x + predio_largura/2 - portao_largura/2, height - portao_altura - margem_chao ); 
  rect( pos_portao.x, pos_portao.y, portao_largura, portao_altura);
  line( pos_portao.x + portao_largura/2, pos_portao.y, pos_portao.x + portao_largura/2, height - margem_chao );
  
}
