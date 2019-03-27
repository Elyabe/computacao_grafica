// Atividade 2 de Computação Gráfica
// Elyabe Alves (Ciência da Computação) - 2014203834
// Usando percentuais para acompanhar o tamanho da janela
// Legenda: p : percentual
// mg : margem 

int mg_janela_predio, mg_chao;
PVector pos_predio;
PVector pos_portao;
float p_predio_altura = 0.5, p_predio_largura = 0.25;
float p_portao_altura = 0.2, p_portao_largura = 0.5;
float p_janela_altura = 0.12, p_janela_largura = 0.4;
float p_raio_macaneta = 0.01;
float p_tronco_altura = 0.16, p_tronco_largura = 0.1;

int predio_altura, predio_largura;
int janela_altura, janela_largura, tronco_altura, tronco_largura, raio_copa;
int raio_macaneta;
int dist_macaneta;
int qtd_janelas_abertas = 3;

ArrayList<PVector> janelas_abertas = new ArrayList<PVector>(); 


void setup()
{
  size( 800, 600 );
  pos_predio = new PVector( 30, 40 );
  mg_chao = int(0.005 * height);
  mg_janela_predio = int(0.008 * height );
  raio_macaneta = int(p_raio_macaneta * height);
}


void draw()
{
  background(64,177,255);  
  predio_altura = int(height * p_predio_altura);
  predio_largura = int(width * p_predio_largura);
  
  
  int portao_altura = int(p_portao_altura * predio_altura), portao_largura = int(p_portao_largura * predio_largura) ;
  // Corpo do predio
  fill(255,215,0);
  triangle(pos_predio.x, predio_altura - mg_chao, pos_predio.x + predio_largura, predio_altura - mg_chao,  pos_predio.x + predio_largura/2, predio_altura*0.7);
  rect( pos_predio.x, predio_altura - mg_chao, predio_largura, predio_altura );
  
  // Portao
  fill(#3f3f3f);
  pos_portao = new PVector( pos_predio.x + predio_largura/2 - portao_largura/2, height - portao_altura - mg_chao ); 
  rect( pos_portao.x, pos_portao.y, portao_largura, portao_altura);
  line( pos_portao.x + portao_largura/2, pos_portao.y, pos_portao.x + portao_largura/2, height - mg_chao );
  dist_macaneta = int(0.1*portao_largura);
  fill(255);
  ellipse( pos_portao.x + portao_largura/2 - dist_macaneta, pos_portao.y + portao_altura/2, raio_macaneta , raio_macaneta );
  ellipse( pos_portao.x + portao_largura/2 + dist_macaneta, pos_portao.y + portao_altura/2, raio_macaneta, raio_macaneta );
  
  //janelas
   janela_altura = int( p_janela_altura * predio_altura);
   janela_largura = int( p_janela_largura * predio_largura );
   
   //Sorteia quais janelas estarão abertas
   qtd_janelas_abertas = 3;
   janelas_abertas.clear();
   while( qtd_janelas_abertas > 0 )
   {
     // Sorteia a fileira e o lado
     PVector nova_janela = new PVector( int(random(4)), int(random(2)) );
     // Verifica se a janela já não foi sorteada
     if ( !janelas_abertas.contains(nova_janela) ) 
      {
        janelas_abertas.add(nova_janela);
        qtd_janelas_abertas--;
      }
       println( nova_janela);
   }
   
   // Plota as fileiras com duplas de janelas
   PVector pos = new PVector();
   for ( int fileira = 0; fileira < 5; fileira++ )
   {
     // lado 0: esquerdo, lado 1: direito;
     for ( int lado = 0; lado < 2; lado++ )
     {
       boolean aberta = !janelas_abertas.contains( new PVector(fileira,lado) ) ;
       pos.x = lado * ( int(pos_predio.x) + mg_janela_predio ) + (1-lado)*( int(pos_predio.x) + predio_largura - mg_janela_predio - janela_largura ); 
       pos.y = predio_altura + fileira * ( janela_altura + mg_janela_predio ) + mg_janela_predio;
       construir_janela( int(pos.x), int(pos.y), aberta );
     }
     
   }


  // Arvore
  tronco_altura = int(width * p_tronco_altura);
  tronco_largura = int(height * p_tronco_largura );
  raio_copa = int( height * 0.2 );
  PVector pos_tronco = new PVector( width - tronco_largura - raio_copa , height - tronco_altura - mg_chao  );
  fill(61,48,48);
  rect( pos_tronco.x, pos_tronco.y, tronco_largura, tronco_altura );
  fill(80,200,120);
  ellipse( pos_tronco.x, pos_tronco.y, raio_copa, raio_copa );
  ellipse( pos_tronco.x + tronco_largura/2, pos_tronco.y*0.9, raio_copa, raio_copa );
  ellipse( pos_tronco.x + tronco_largura, pos_tronco.y, raio_copa, raio_copa );
  
  
  // Nuvens com posições randômicas
  for ( int qtd_nuvens = 3; qtd_nuvens > 0; qtd_nuvens--) 
    construir_nuvem( int(random(width)), int(random(height*0.3)) );
  //ellipse( 90, 30, 90, 50 );
  
  noFill();
  stroke(2);
  arc(50,55,50,50,  PI, 3*HALF_PI);
  arc(0,55,50,50, 3*HALF_PI, 2*PI);
  
  noLoop();
}

// Plota janela na posição desejada
// x, y : Posição desejada
// aberta : Se a janela deve ser construída aberta ou fechada
void construir_janela(int x, int y, boolean aberta )
{
  // Troca cor se for fechada
  if ( !aberta )
    fill( 0,0,0 );
  
    
  rect( x, y, janela_largura, janela_altura );
  
  if( aberta )
    line( x + janela_largura/2, y, x + janela_largura/2, y + janela_altura );
  
  fill(255);
}

// Plota nuvem na posição desejada
// x, y: Posição da nova nuvem
void construir_nuvem( int x, int y )
{
  noStroke();
  fill(255);
  ellipse( x, y, 0.18*width, 0.1*width );
  ellipse( x, y-0.04*width, 0.08*width, 0.08*width );
}
