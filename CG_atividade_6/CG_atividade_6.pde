/* 
CENTRO UNIVERSTÁRIO NORTE DO ESPÍRITO SANTO - CEUNES/ UFES
TAREFA DE COMPUTAÇÂO GRÁFICA 2019/1
AUTOR: ELYABE ALVES SANTOS
CURSO: CIÊNCIA DA COMPUTAÇÃO
MATRÍCULA: 2014203834

OBJETIVO: Implementação de rotação e mapeamento reverso em imagens
CRIADO EM: 15/04/2019
PROFESSOR: Jacques Facon
*/

PImage img_original, img_transformada, img_transformada_r;
String nome_metodo;

void setup()
{
  size(1250,600);
  img_original = loadImage("ft_perfil.jpg");
  textSize(25);
  img_transformada = rotacionar_imagem( img_original, radians(33));
  img_transformada_r = mapeamento_reverso( img_original, radians(33));
}


void draw()
{
  background(255);
  image(img_original,0,0);
  nome_metodo = "";
  
  if ( keyPressed )
  {
      switch ( key )
      {
         case '1':
           image(img_transformada, img_original.width, 0);
           nome_metodo = "Rotação comum"; 
           break;
         case '2':
           image(img_transformada_r, img_original.width, 0);
           nome_metodo = "Mapeamento Inverso";   
           break;
         default:
           nome_metodo = "";
           break;
       } 
      
      // Insere legendas
      fill(0);
      rect(0,0, img_original.width, 30 );
      rect(img_original.width, height - 30, img_original.width, height );
      fill(255);
      text("Imagem Original", 5, 25 );
      text("Método: " + nome_metodo, img_original.width, height - 5 );
    
  } else
  {
    fill(0);
    text("Use as teclas para ver as conversões:\n 1: Rotação comum \n 2: Mapeamento Reverso", img_original.width + 20, height - 150 );
  } 
 
  //noLoop();
}

// Aplica rotação comum em uma imagem 
// my_img: Imagem alvo da rotação
// theta: ângulo de rotação
PImage rotacionar_imagem( PImage img_original, float theta )
{
  
  PImage img = createImage( img_original.width, img_original.height, RGB );
  img.loadPixels();
  img_original.loadPixels(); 
  int img_altura = img_original.height, img_largura = img_original.width, nova_pos, pos;
  PVector P_linha, P;
  
  //  
  for ( int x = 0; x < img_largura; x++ )
  {
    for ( int y = 0; y < img_altura; y++ )
    {
        float x_t = x - img_largura*0.5, y_t = y - img_altura*0.5; 
        pos = y * img_largura + x;
        P = new PVector( x_t, y_t );
        P_linha = transformar_coordenadas( P, theta );
        P_linha.x = P_linha.x +  img_largura*0.5;
        P_linha.y = P_linha.y +  img_altura*0.5;
        nova_pos = int(P_linha.y) * img_largura + int(P_linha.x);
        if ( P_linha.x >=0 && P_linha.x < img_largura - 10 && P_linha.y >=0 && P_linha.y < img_altura - 10 )
        {  img.pixels[ nova_pos ] = img_original.pixels[pos];}
        else
        { println("Pintou");}
    }
  }
  
  img.updatePixels();
  
  return img;
}

// Transforma as coordenadas cartesianas usando rotação
// P : coordenadas (x,y) a serem rotacionadas
// theta: ângulo de rotação
PVector transformar_coordenadas( PVector P, float theta )
{
  PVector P_l = new PVector(0,0);
  float cos_theta = cos(theta), sin_theta = sin(theta);
  //println(cos_theta + " " + sin_theta);
  P_l.x = P.x * cos_theta + P.y * sin_theta;
  P_l.y = -P.x * sin_theta  + P.y * cos_theta;
  
  return P_l;
}


// Aplica rotação usando o método do mapeamento reverso
// my_img: Imagem alvo da rotação
// theta: ângulo de rotação
PImage mapeamento_reverso( PImage img_original, float theta )
{
  
  PImage img = createImage( img_original.width, img_original.height, RGB );
  img.loadPixels();
  img_original.loadPixels();
  
  int img_altura = img_original.height, img_largura = img_original.width, pos;
  PVector P_linha, P;
  
  float delta_col, delta_lin;
  int mg_borda = 3;
  
  color A, B, C, D;
  PVector cor_A, cor_B, cor_C, cor_D;
  for ( int x = mg_borda; x < img_largura-mg_borda; x++ )
  {
    for ( int y = mg_borda; y < img_altura-mg_borda; y++ )
    {
        // Realiza rotação no ponto largura/2
        float x_t = x - img_largura*0.5, y_t = y - img_altura*0.5; 
        pos = y * img_largura + x;
        P = new PVector( x_t, y_t );
        
        P_linha = transformar_coordenadas( P, -theta );
        
        P_linha.x = P_linha.x +  img_largura*0.5;
        P_linha.y = P_linha.y +  img_altura*0.5;
        
        
        // Calculos do mapeamento reverso
        delta_col = P_linha.x - int(P_linha.x);
        delta_lin = P_linha.y - int(P_linha.y);
        
        int pos_A_x = int(P_linha.x), pos_A_y = int(P_linha.y);
        
        // Capturando os pixels vizinhos
        A = img_original.get( pos_A_x, pos_A_y );
        B = img_original.get( pos_A_x + 1, pos_A_y);
        C = img_original.get( pos_A_x, pos_A_y + 1);
        D = img_original.get( pos_A_x + 1, pos_A_y + 1);
        
        // Transforma as cores usando TAD PVector para aproveitar as operações de vetores (adicionar, multiplicar por escalar, ...)
        // E fazer todas as operações rapidamente
        cor_A = new PVector( red(A), green(A), blue(A) );
        cor_B = new PVector( red(B), green(B), blue(B) );
        cor_C = new PVector( red(C), green(C), blue(C) );
        cor_D = new PVector( red(D), green(D), blue(D) );
        
        
        PVector ctrlAB = new PVector(0,0,0), ctrlCD = new PVector(0,0,0), P_x = new PVector(0,0,0);
        
        // Calcula ctrlAB
        ctrlAB.add(cor_A);
        ctrlAB.mult(-1);
        ctrlAB.add(cor_B);
        ctrlAB.mult(delta_col);
        ctrlAB.add(cor_A);
        
        // Calcula ctrlCD
        ctrlCD.add(cor_C);
        ctrlCD.mult(-1);
        ctrlCD.add(cor_D);
        ctrlCD.mult(delta_col);
        ctrlCD.add(cor_C);
        
        // Calcula cor do novo pixel
        P_x.add(ctrlAB);
        ctrlCD.mult(-1);
        ctrlCD.add(ctrlCD);
        ctrlCD.mult(delta_lin);
        ctrlCD.add(ctrlAB);
        
        img.pixels[ pos ] = color( P_x.x, P_x.y, P_x.z );
      
    }
  }
  
  img.updatePixels();
  
  return img;
}
