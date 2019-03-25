// Atividade 2 de Computação Gráfica
// Elyabe Alves

int mg_janela_predio, margem_chao;
PVector pos_predio = new PVector( 30, 40 ) ;
PVector pos_portao;
float p_predio_altura = 0.5, p_predio_largura = 0.25;
float p_portao_altura = 0.2, p_portao_largura = 0.5;
float p_janela_altura = 0.12, p_janela_largura = 0.4;
float p_raio_macaneta = 0.01;

int predio_altura, predio_largura;
int janela_altura, janela_largura;
int raio_macaneta;
int dist_macaneta;

void setup()
{
  size( 800, 600 );  
  margem_chao = int(0.005 * height);
  mg_janela_predio = int(0.008 * height );
  raio_macaneta = int(p_raio_macaneta * height);
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
  dist_macaneta = int(0.1*portao_largura);
  ellipse( pos_portao.x + portao_largura/2 - dist_macaneta, pos_portao.y + portao_altura/2, raio_macaneta , raio_macaneta );
  ellipse( pos_portao.x + portao_largura/2 + dist_macaneta, pos_portao.y + portao_altura/2, raio_macaneta, raio_macaneta );
  
  //janela
   janela_altura = int( p_janela_altura * predio_altura);
   janela_largura = int( p_janela_largura * predio_largura );
   
   PVector pos = new PVector();
   for ( int fileira = 0; fileira < 5; fileira++ )
   {
     for ( int lado = 0; lado < 2; lado++ )
     {
       boolean aberta = int(random(0,10))%2 == 0 ;
       pos.x = lado * ( int(pos_predio.x) + mg_janela_predio ) + (1-lado)*( int(pos_predio.x) + predio_largura - mg_janela_predio - janela_largura ); 
       pos.y = predio_altura + fileira * ( janela_altura + mg_janela_predio ) + mg_janela_predio;
       construir_janela( int(pos.x), int(pos.y), aberta );
     }
     
   }
   
   

  
}


void construir_janela(int x, int y, boolean aberta )
{
  if ( !aberta )
  {
    fill( 0,0,0 );
  } else {
    line( x + janela_largura/2, y, x + janela_largura/2, y + janela_altura );
  }
    
  rect( x, y, janela_largura, janela_altura );
  fill(255);
}
