import processing.serial.*;
Serial porta;
PImage col;
PImage col2;
PImage ledA;
PImage ledAON;
PImage ledV;
PImage ledVON;
void setup() {
  col =loadImage("col.jpg");
  col2 =loadImage("col2.jpg");
  ledA =loadImage("ledA.png");
  ledAON= loadImage("ledAON.jpg");
  ledVON= loadImage("ledVON.png");
  ledV= loadImage("ledV.png");
  frameRate(12); 
  

 frame.setTitle ("Supervisório V1.8");
 size(600, 400);
fill(0);
textFont(createFont("ArialBlack", 18));
textAlign(CENTER);
println(Serial.list());
porta = new Serial(this, Serial.list()[0], 9600);
}
void draw() {
 // Verificar se há bytes a serem lidos
 if (porta.available () > 0) {
 background (150);
 // Ler a String recebida
 image(col,20, 105);
 image (ledA, 500,100,30,60);
 image(ledV, 450,100,40,60);
 
 String temperatura = porta.readStringUntil('\n');
   
  text("Temperatura: " + temperatura + "°C", 500, 50); 
 text("Supervisório: ", 300, 20);
 float inByte = float(temperatura);
     if( inByte <30){
       image(ledAON, 500,100,45,60); 
           
         }
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
