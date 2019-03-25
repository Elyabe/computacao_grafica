// Atividade 2 de Computação Gráfica
// Elyabe Alves

int mg_janela_predio, margem_chao;
PVector pos_predio = new PVector( 30, 40 ) ;
PVector pos_portao;
float p_predio_altura = 0.5, p_predio_largura = 0.25;
float p_portao_altura = 0.2, p_portao_largura = 0.5;
float p_janela_altura = 0.15, p_janela_largura = 0.4;

int predio_altura, predio_largura;
int janela_altura, janela_largura;

void setup()
{
  size( 800, 600 );  
  margem_chao = int(0.005 * height);
  mg_janela_predio = int(0.008 * height );
}


void draw()
{
  predio_altura = int(height * p_predio_altura);
  predio_largura = int(width * p_predio_largura);
  
  int portao_altura = int(p_portao_altura * predio_altura), portao_largura = int(p_portao_largura * predio_largura) ;
  // Corpo do predio
  rect( pos_predio.x, predio_altura - margem_chao, predio_largura, predio_altura );
  // Portao
  pos_portao = new PVector( pos_predio.x + predio_largura/2 - portao_largura/2, height - portao_altura - margem_chao ); 
  rect( pos_portao.x, pos_portao.y, portao_largura, portao_altura);
  line( pos_portao.x + portao_largura/2, pos_portao.y, pos_portao.x + portao_largura/2, height - margem_chao );
 
  //janela
   janela_altura = int( p_janela_altura * predio_altura);
   janela_largura = int( p_janela_largura * predio_largura );
   
   construir_janela( int(pos_predio.x) + mg_janela_predio, predio_altura, false );
   

  
}


void construir_janela(int x, int y, boolean aberta )
{
  rect( x, y, janela_largura, janela_altura );
  if ( !aberta )
  {  line( x + janela_largura/2, y, x + janela_largura/2, y + janela_altura ); }
  else
  {
    
  }
}
