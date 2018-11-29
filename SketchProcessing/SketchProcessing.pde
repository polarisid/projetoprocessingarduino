import processing.serial.*;
Serial porta;
//DECLARANDO IMAGENS
PImage col;
PImage col2;
PImage ledA;
PImage ledAON;
PImage ledV;
PImage ledVON;
///////////////////////
void setup() {
  //IMORTANDO IMAGENS
  col =loadImage("col.jpg");
  col2 =loadImage("col2.jpg");
  ledA =loadImage("ledA.png");
  ledAON= loadImage("ledAON.jpg");
  ledVON= loadImage("ledVON.png");
  ledV= loadImage("ledV.png");
  /////////
  frameRate(12);   
/// TITULO DA JANELA E TAMANHO 
  frame.setTitle ("Supervisório V1.8");
  size(600, 400);
  fill(0);
  textFont(createFont("ArialBlack", 18));
  textAlign(CENTER);
  ////MOSTRAR SERIAL DISPONIVEL NO CONSOLE
  println(Serial.list());
  ////CONECATANDO A SERIAL DISPONIVEL
  porta = new Serial(this, Serial.list()[0], 9600);

}
void draw() {
 
 if (porta.available () > 0) {
 ////POSICIONANDO IMAGENS
 background (150);
 image(col,20, 105);
 image (ledA, 500,100,30,60);
 image(ledV, 450,100,40,60);
 //RECEBENDO DADO DA SERIAL -STRING
 String temperatura = porta.readStringUntil('\n');
 //MOSTRANDO VALORES RECEBIDOS
 text("Temperatura: " + temperatura + "°C", 500, 50); 
 text("Supervisório: ", 300, 20);
 //CONVERTENDO A STRING RECEBIDA EM FLOAT
 float inByte = float(temperatura);
 //CONDIÇÕES PARA VALOR DE TEMPERATURA INFERIOR A 30ºC
     if( inByte <30){
       image(ledAON, 500,100,45,60); 
     }
 //CONDIÇÕES PARA VALOR DE TEMPERATURA SUPERIOR A 30ºC
     else{ image(ledVON, 450,100,40,60);
           image(col2,20, 105);
           fill(150, 0, 0);
           rect(12,60 , 180, 40);
           fill(0);
           textSize(24);
           textAlign(CENTER);
           fill(255, 255, 255);
           text("Acima de 30ºC!!", 100, 90);
           fill(150, 0, 0);
           rect(15, 350, 170, 40);
           fill(0);
           textSize(24);
           textAlign(CENTER);
           fill(255, 255, 255);
           text("Cooler Ligado!!", 100, 380);
    }
}

}
